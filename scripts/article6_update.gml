//article6_update, Enemy
enum TR {
    NEAR,
    MID,
    FAR,
    RANDOM,
    LOW,
    HIGH
}

if !_init {
    enem_id = spawn_variables[0];
    //attack_start(attacks[0]);
    //player_controller = 1;
    _init = 1;
    //print_debug(get_attack_name(attacks[0]));
} else {
    
    if player_controller != 0 {
        with oPlayer {
            if player == other.player_controller set_state(PS_IDLE_AIR);
        }
        get_inputs(player_controller);
    }
    if instance_exists(ai_target) frame_update();
    ai_update();
    input_process();
    state_machine();
    physics_update();
    
}

#define ai_update()

state_timer++;
if hitstun <= 0 {
    if art_state != next_state {
        prev_state = art_state;
        art_state = next_state;
        if art_state != 5 && art_state != 6 {
            sprite_index = enemy_sprite_get(enem_id,get_state_name(art_state));
        }
        state_timer = 0;
    }
} else art_state = PS_HITSTUN;
//Default AI behavior
switch target_behavior {
    case TR.NEAR:
        ai_target = instance_nearest(x,y,oPlayer);
        break;
    case TR.FAR:
        ai_target = instance_furthest(x,y,oPlayer);
        break;
    case TR.RANDOM:
        var player_targ = random_func(0,instance_number(oPlayer), true);
        var i = 0;
        with oPlayer if i == player_targ other.ai_target = id; else i++;
        break;
    case TR.LOW:
        ai_target = instance_nearest(x,y,oPlayer);
        with oPlayer if other.ai_target.damage < damage ai_target = id;
        break;
    case TR.HIGH:
        ai_target = instance_furthest(x,y,oPlayer);
        with oPlayer if other.ai_target.damage > damage ai_target = id;
        break;
}

switch pos_behavior {
    case TR.FAR:
        break;
    case TR.NEAR:
        break;
}


user_event(6); //Custom behavior

if next_attack != -1 attack_start(next_attack);
#define frame_update() //Updates ai information every frame, not physics
x_dist = abs(x-ai_target.x);
y_dist = abs(y-ai_target.y);
target_dir = sign(x-ai_target.x);

is_ai = (player_controller == 0);
#define state_machine() //Player-esque State Machine

switch art_state { //Gameplay Logic
    case PS_ATTACK_AIR:
        if !is_free art_state = PS_LAND;
        committed = 1;
        attack_update();
        break;
    case PS_ATTACK_GROUND:
        committed = 1;
        attack_update();
        break;
    case PS_AIR_DODGE: //Airdodge
        committed = 1;
        if !joy_pad_idle && state_timer > 3 {
            hsp = dcos(_joy_dir)*air_dodge_speed;
            vsp = -dsin(_joy_dir)*air_dodge_speed;
        }
        if !is_free next_state = PS_WAVELAND;
        if state_timer == 3 {
            _joy_dir = joy_dir;
            invincible = 19;
            sound_play(air_dodge_sound);
        }
        if state_timer > 24 {
            hsp = 0;
            vsp = 0;
            next_state = PS_IDLE_AIR;
        }
        break;
    case PS_PARRY_START:
        committed = 1;
        if left_down || right_down next_state = PS_ROLL_BACKWARD;
        if state_timer > 3 next_state = PS_PARRY;
        break;
    case PS_ROLL_BACKWARD: //Rolls, both
        committed = 1;
        if state_timer > 3 && state_timer < 27 hsp = (spr_dir)*roll_backward_max;
        if state_timer == 3 {
            spr_dir = right_down-left_down;
            invincible = 24;
            sound_play(asset_get("sfx_roll"));
        }
        if state_timer > 30 next_state = PS_IDLE;
        break;
    case PS_PARRY:
        committed = 1;
        if state_timer > 30 next_state = PS_IDLE;
        break;
    case PS_JUMPSQUAT:
        committed = 1;
            if state_timer >= jump_start_time {
                if !shield_down && shield_held == 0 {
                    if jump_down vsp = -jump_speed;
                    else vsp = -short_hop_speed;
                    next_state = PS_FIRST_JUMP;
                    sound_play(jump_sound);
                } else next_state = PS_WAVELAND;
            }
        break;
    case PS_IDLE_AIR:
        art_state = PS_FIRST_JUMP;
        sprite_index = enemy_sprite_get(enem_id,get_state_name(art_state));
    case PS_FIRST_JUMP:
        committed = 0;
        if !is_free next_state = PS_LAND;
        break;
    case PS_DOUBLE_JUMP:
        committed = 0;
        if state_timer == 0 {
            djumps -= 1;
            vsp = -djump_speed;
            hsp += jump_change*right_down - jump_change*left_down;
            sound_play(djump_sound);
        }
        if djumps > 0 && jump_down && jump_held == 0 state_timer = -1;
        if !is_free next_state = PS_LAND;
        if state_timer > double_jump_time next_state = PS_FIRST_JUMP;
        break;
    case PS_WALK_TURN:
        if state_timer > walk_turn_time {
            next_state = PS_WALK;
            spr_dir = to_dir;
        }
    case PS_WALK:
        if is_free next_state = PS_IDLE_AIR; 
        if spr_dir != to_dir next_state = PS_WALK_TURN;
        hsp = clamp(hsp -walk_accel*left_down + walk_accel*right_down, -walk_speed, walk_speed);
        if !(left_down || right_down) next_state = PS_IDLE;
        break;
    case PS_DASH_START:
        hsp = spr_dir*initial_dash_speed;
        if state_timer > initial_dash_time next_state = PS_DASH;
        if to_dir != spr_dir {
            state_timer = 0;
            spr_dir = to_dir;
        }
        if !(left_down || right_down) next_state = PS_IDLE;
        break;
    case PS_DASH:
        hsp = spr_dir*dash_speed;
        if !(left_down || right_down) next_state = PS_DASH_STOP;
        break;
    case PS_DASH_STOP:
        if state_timer > dash_stop_time {
            hsp *= dash_stop_percent;
            next_state = PS_IDLE;
        }
        break;
    case PS_LAND:
        if is_free next_state = PS_IDLE_AIR;
        if state_timer == 1 sound_play(land_sound);
        if state_timer > land_time next_state = PS_IDLE;
        break;
    case PS_WAVELAND:
        committed = 1;
        if state_timer == 1 sound_play(waveland_sound);
        if state_timer <= 2 hsp = walk_speed*wave_land_adj*(right_down-left_down);
        if state_timer > wave_land_time next_state = PS_IDLE;
        break;
    case PS_IDLE:
        committed = 0;
        if is_free next_state = PS_IDLE_AIR;
        if (left_hard_pressed || right_hard_pressed) {
            if (left_down || right_down) next_state = PS_DASH_START;
        } else if (left_down || right_down) next_state = PS_WALK;
        if down_down next_state = PS_CROUCH;
        break;
    case PS_CROUCH:
        if !down_down {
            crouch_timer++;
            if crouch_timer > 3 next_state = PS_IDLE;
        } else crouch_timer = 0;
        break;
    case PS_HITSTUN:
    case PS_TUMBLE:
        if hitpause > 0 {
            hitpause--;
            state_timer = 0;
            vsp = 0;
            hsp = 0;
        } else {
            if state_timer == 2 {
                //is_free = 1;
                vsp = -kb_power*sin(kb_angle);
                hsp = kb_power*cos(kb_angle);
                spr_dir = -sign(hsp);
                
            }
            hitstun--;
            if !is_free next_state = PS_LANDING_LAG;
            if hitstun <= 0 {
                hitstun = 0;
                next_state = PS_IDLE_AIR;
            }
        }
        break;
    case PS_LANDING_LAG:
        if is_free next_state = PS_IDLE_AIR;
        if state_timer > land_time next_state = PS_IDLE;
        break;
}

switch art_state { //Display Logic
    case PS_IDLE:
        image_index += idle_anim_speed;
        break;
    case PS_DASH:
        image_index += dash_anim_speed;
        break;
    case PS_WALK:
        image_index += walk_anim_speed;
        break;
    case PS_JUMPSQUAT:
        image_index = (state_timer/(2*jump_start_time))*image_number;
        break;
    case PS_FIRST_JUMP:
        image_index = ease_linear(0,image_number,floor(vsp+jump_speed), jump_speed*2);
        break;
    case PS_DOUBLE_JUMP:
        image_index = ease_linear(0,image_number, state_timer, double_jump_time);
        break;
    case PS_CROUCH:
        if crouch_timer == 0 image_index = clamp(state_timer/3,0,image_number-1);
        else image_index = clamp((3-crouch_timer)/3,0,image_number-1);
        break;
    case PS_DASH_START:
        image_index = ease_linear(0,image_number, state_timer, initial_dash_time);
        break;
    case PS_DASH_STOP:
        image_index = ease_linear(0,image_number, state_timer, dash_stop_time);
        break;
    case 5:
        image_index = ag_window_anim_frame_start[window]+floor(ease_linear(0,ag_window_anim_frames[window],window_timer,floor(ag_window_length[window]*(1+.5*ag_window_wifflag[window]*(!has_hit_en)))));
        break;
    case 6:
        image_index = ag_window_anim_frame_start[window]+floor(ease_linear(0,ag_window_anim_frames[window],window_timer,floor(ag_window_length[window]*(1+.5*ag_window_wifflag[window]*(!has_hit_en)))));
        break;
}
#define input_process() //For inputs in more than 1 state

if right_down || left_down to_dir = right_down-left_down;
if jump_down jump_held++;
else jump_held = 0;
if down_down down_held++;
else down_held = 0;


if !committed {
    if jump_down {
        if is_free {
            if jump_held == 1 && djumps > 0 { 
                next_state = PS_DOUBLE_JUMP;
                djumps--;
            }
        } else next_state = PS_JUMPSQUAT;
    } else if shield_down {
        if is_free next_state = PS_AIR_DODGE;
        else next_state = PS_PARRY_START;
    }
}

if down_hard_pressed && !committed can_fallthrough = 1;
else if !down_down can_fallthrough = 0;
//if (can_fallthrough && !place_meet_plat(x,y)) can_fallthrough = 0;

#define physics_update() //Physics updates, every frame
//is_free = (vsp < 0 || (vsp >= 0 && ((place_meeting(x,y+1,asset_get("solid_32_obj")) || (lace_meeting(x,y+1,asset_get("jumpthrough_32_obj")))) && !(place_meeting(x,y-10,asset_get("solid_32_obj")) || (place_meeting(x,y-10,asset_get("jumpthrough_32_obj")))))));
/*is_free = (vsp < 0 || !(place_meeting(x,y+1,asset_get("solid_32_obj")) || 
              place_meeting(x,y+1,asset_get("jumpthrough_32_obj")) || 
              place_meeting(x,y+1,obj_stage_article_solid) ||
              place_meeting(x,y+1,obj_stage_article_platform)));*/
//is_free = (vsp < 0 || !place_meet(x,y+1) || (place_meet_plat(x,y+1) && !place_meet_solid(x,y+1) && can_fallthrough));
//is_free = vsp < 0 || (!place_meet_solid(x,y+1) && !(place_meet_plat(x,y+1) && !can_fallthrough));
is_free = (vsp < 0 || (!place_meet_solid(x,y+1) && !(get_plat(x,y+1) && !can_fallthrough)));
//if is_free == 0 && vsp < 0 is_free = 1;
var _y = 0;
var _y_limit = 16;

//Physics Friction
if is_free {
    if hitstun == 0 vsp += gravity_speed;
    else vsp += hitstun_grav;
    vsp *= 1-air_friction;
    hsp *= 1-air_friction;
    if abs(hsp) < air_max_speed hsp += -air_accel*left_down+air_accel*right_down;
    //if !state_is_free next_state = PS_IDLE_AIR;
} else {
    vsp = 0;
    djumps = max_djumps;
    hsp *= 1-ground_friction/5;
    has_air_dodge = 1;
}

//Fix Clipping
//if (art_state == PS_LAND || art_state == PS_WAVELAND) && !is_free {
if !is_free {
    while (place_meet(x,y-_y) && _y < _y_limit+1)  _y++;
    if _y < _y_limit y -= _y;
}
//Horizontal Collision Detection
if place_meet_solid(x+3,y-1) {
    while place_meet_solid(x,y-1) x--;
    if hsp < 0 hsp = 0; 
}
if place_meet_solid(x-3,y-1) {
    while place_meet_solid(x,y-1) x++;
    if hsp < 0 hsp = 0; 
}
    

if invincible == 0 {
    last_hitbox = hit_id;
    hit_id = instance_place(x,y,pHitBox);
    if hit_id == noone has_hit = 0;
    if hit_lockout > 0 hit_lockout--;
    if hit_id != noone && (!("hit_owner" in hit_id) || hit_id.hit_owner != id) && hit_lockout == 0 && last_hitbox != hit_id {
        with hit_id {
            if kb_value*4*((other.knockback_adj-1)*0.6+1)+other.percent*0.12*kb_scale*4*0.65*other.knockback_adj > other.hitstun {
                other.spr_dir = -spr_dir;
                other.percent += damage;
                other.kb_power = kb_value+other.percent*0.12*kb_scale*other.knockback_adj;
                //
                
                if kb_angle == 361 && other.free other.kb_angle = 45;
                else if kb_angle == 361 && !other.free other.kb_angle = 40;
                var _kb_angle = kb_angle;
                if player_id.spr_dir == 1 other.kb_angle = (kb_angle)*3.14159/180;
                else other.kb_angle = (180-kb_angle)*3.14159/180;
                var _x_hcenter = sign(other.x-x);
                var _y_hcenter = sign(other.y-y);
                var _x_pcenter = sign(other.x-player_id.x);
                var _y_pcenter = sign(other.y-player_id.y);
                switch hit_flipper {
                    case 1: // Send Away from the enemy
                        
                        break;
                }
                //
                other.hitstun = kb_value*4*((other.knockback_adj-1)*0.6+1)+other.percent*0.12*kb_scale*4*0.65*other.knockback_adj;
                other.hitpause = hitpause + other.percent*hitpause_growth*0.05;
                other.old_hsp = other.hsp;
                other.old_vsp = other.vsp;
                if no_other_hit != 0 other.hit_lockout = no_other_hit;
                else other.hit_lockout = 10;
                other.hit_sound = sound_effect;
                other.hit_visual = hit_effect;
            }
        }
        if hit_id.player_id != 0 with hit_id.player_id {
            has_hit = 1;
            old_vsp = vsp;
            old_hsp = hsp;
            hitstop = other.hitpause;
            hitpause = 1;
            hsp = 0;
            vsp = 0;
        }
        if has_hit == 0 {
            sound_play(hit_sound);
            spawn_hit_fx(x,y,hit_visual);
        }
        has_hit = 1;
    }
} else invincible--;


#define place_meet(__x,__y) //get place_meeting for the usual suspects
return (place_meeting(__x,__y,asset_get("solid_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_solid) || 
        place_meeting(__x,__y,asset_get("jumpthrough_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_platform));
#define place_meet_solid(__x,__y) //get place_meeting for the usual suspects
return (place_meeting(__x,__y,asset_get("solid_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_solid));
#define place_meet_plat(__x,__y) //get place_meeting for the usual suspects
return (place_meeting(__x,__y,asset_get("jumpthrough_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_platform));
#define get_plat(__x,__y)
var _plat = instance_place(__x,__y,obj_stage_article_platform);
if instance_exists(_plat) return instance_place(__x,__y,obj_stage_article_platform);
else return instance_place(__x,__y,asset_get("jumpthrough_32_obj"));
#define attack_update() //Attack update script during attacks
//if debug print_debug("[EM] Attack Updating..."+string(window)+":"+string(window_timer));
window_timer++;
if window_timer >= ag_window_length[window]*(1+.5*ag_window_wifflag[window]*(!has_hit_en)) {
    if window == ag_num_windows {
        is_attacking = false;
        next_state = PS_IDLE;
        window = 1;
        window_timer = 1;
    } else {
        window++;
        window_timer = 1;
    }
}

//Speeds
if window < array_length_1d(ag_window_hspeed_type) {
    switch ag_window_hspeed_type[window] {
        case 1:
            if window_timer == 1 hsp = ag_window_hspeed[window]*spr_dir;
            break;
        case 2:
            hsp = ag_window_hspeed[window]*spr_dir;
            break;
        default:
            if window_timer == 1 hsp += ag_window_hspeed[window]*spr_dir;
            break;
    }
}

if window < array_length_1d(ag_window_vspeed_type) {
    switch ag_window_vspeed_type[window] {
        case 1:
            if window_timer == 1 vsp = ag_window_vspeed[window]*spr_dir;
            break;
        case 2:
            vsp = ag_window_vspeed[window]*spr_dir;
            break;
        default:
            if window_timer == 1 vsp += ag_window_vspeed[window]*spr_dir;
            break;
    }
}

//Sounds
if ag_window_has_sfx[window] == 1 && ag_window_sfx_frame[window] == window_timer && ag_window_sfx[window] != 0 
    sound_play(ag_window_sfx[window]);

//Hitboxes

for (var j = 1; j <= hg_num_hitboxes; j += 1) if window == hg_window[j] && window_timer == hg_window_frame[j]+1 {
    hitb = create_hitbox(attack,j,x,y);
    if not "hit_owner" in hitb hitb.hit_owner = id;
}

with asset_get("pHitBox") if "hit_owner" in self && hit_owner == other.id {
    x = other.x+x_pos;
    y = other.y+y_pos;

}


#define attack_start(_attack) //Start attacking 
get_attack(_attack);

has_hit_en = false;
last_attack = attack;
attack = next_attack;
next_attack = -1;
window_timer = 0;
window = 1;
sprite_index = ag_sprite;
image_index = 0;
if is_free next_state = PS_ATTACK_AIR;
else next_state = PS_ATTACK_GROUND;

#define get_attack(_attack) //Set attack data, and attack start
print_debug("[EN] Getting attack data for "+get_attack_name(_attack));
with obj_stage_main { //Main stage script object
    other.ag_category = get_attack_value(_attack,AG_CATEGORY);
    other.ag_num_windows = get_attack_value(_attack,AG_NUM_WINDOWS);
    other.ag_sprite = get_attack_value(_attack,AG_SPRITE);
    other.hg_num_hitboxes = get_num_hitboxes(other.attack);
}
for (var i = 1; i <= ag_num_windows; i += 1) {
    with obj_stage_main {
        other.ag_window_length[i] = get_window_value(_attack,i,AG_WINDOW_LENGTH);
        other.ag_window_anim_frames[i] = get_window_value(_attack,i,AG_WINDOW_ANIM_FRAMES);
        other.ag_window_anim_frame_start[i] = get_window_value(_attack,i,AG_WINDOW_ANIM_FRAME_START);
        if get_window_value(_attack,i,AG_WINDOW_HAS_SFX) {
            other.ag_window_has_sfx[i] = get_window_value(_attack,i,AG_WINDOW_HAS_SFX);
            other.ag_window_sfx[i] = get_window_value(_attack,i,AG_WINDOW_SFX);
            other.ag_window_sfx_frame[i] = get_window_value(_attack,i,AG_WINDOW_SFX_FRAME);
        } else {
            other.ag_window_has_sfx[i] = 0;
        }
        other.ag_window_wifflag[i] = get_window_value(_attack,i,AG_WINDOW_HAS_WHIFFLAG);
        other.ag_window_hspeed[i] = get_window_value(_attack,i,AG_WINDOW_HSPEED);
        other.ag_window_hspeed_type[i] = get_window_value(_attack,i,AG_WINDOW_HSPEED_TYPE);
        other.ag_window_vspeed[i] = get_window_value(_attack,i,AG_WINDOW_VSPEED);
        other.ag_window_vspeed_type[i] = get_window_value(_attack,i,AG_WINDOW_VSPEED_TYPE);
    }
}
for (var i = 1; i <= hg_num_hitboxes; i += 1) {
    with obj_stage_main {
        other.hg_window[i] = get_hitbox_value(_attack,i,HG_WINDOW);
        other.hg_window_frame[i] = get_hitbox_value(_attack,i,HG_WINDOW_CREATION_FRAME);
        other.hg_x[i] = get_hitbox_value(_attack,i,HG_HITBOX_X)*other.spr_dir;
        other.hg_y[i] = get_hitbox_value(_attack,i,HG_HITBOX_Y);
        other.hg_bhitp[i] = get_hitbox_value(_attack,i,HG_BASE_HITPAUSE);
        other.hg_shitp[i] = get_hitbox_value(_attack,i,HG_HITPAUSE_SCALING);
        
    }
}
#define get_inputs(_player) //Overwrite inputs with the given player's inputs (NOTE: Controller Port, NOT oPlayer)
with asset_get("oPlayer") { 
    if player == _player {
        other.down_down = down_down;
        other.up_down = up_down;
        other.left_down = left_down;
        other.right_down = right_down;
        other.jump_down = jump_down;
        other.attack_down = attack_down;
        other.shield_down = shield_down;
        other.taunt_down = taunt_down;
        other.joy_dir = joy_dir;
        other.up_strong_down = up_strong_down;
        other.down_strong_down = down_strong_down;
        other.left_strong_down = left_strong_down;
        other.right_strong_down = right_strong_down;
        other.strong_down = strong_down;
        other.left_hard_pressed = left_hard_pressed;
        other.right_hard_pressed = right_hard_pressed;
        other.down_hard_pressed = down_hard_pressed;
        other.joy_pad_idle = joy_pad_idle;
    }
}
#define enemy_sprite_get(_num,_sprite) //Get the sprite of this article
return sprite_get("enemy_"+string(_num)+"_"+string(_sprite));

#define get_attack_name(_attack) //get the name of an attack

switch _attack {
    case AT_JAB:
        return "AT_JAB";
    case AT_DATTACK:
        return "AT_DATTACK";
    case AT_FTILT:
        return "AT_FTILT";
    case AT_DTILT:
        return "AT_DTILT";
    case AT_UTILT:
        return "AT_UTILT";
    case AT_NAIR:
        return "AT_NAIR";
    case AT_FAIR:
        return "AT_FAIR";
    case AT_UAIR:
        return "AT_UAIR";
    case AT_DAIR:
        return "AT_DAIR";
    case AT_BAIR:
        return "AT_BAIR";
    case AT_FSTRONG:
        return "AT_FSTRONG";
    case AT_USTRONG:
        return "AT_USTRONG";
    case AT_DSTRONG:
        return "AT_DSTRONG";
    case AT_DSPECIAL:
        return "AT_DSPECIAL";
    case AT_USPECIAL:
        return "AT_USPECIAL";
    case AT_FSPECIAL:
        return "AT_FSPECIAL";
    case AT_NSPECIAL:
        return "AT_FSPECIAL";
    case AT_DSPECIAL_AIR:
        return "AT_DSPECIAL_AIR";
    case AT_USPECIAL_GROUND:
        return "AT_USPECIAL_GROUND";
    case AT_FSPECIAL_AIR:
        return "AT_FSPECIAL_AIR";
    case AT_NSPECIAL_AIR:
        return "AT_FSPECIAL_AIR";
    case AT_TAUNT:
        return "AT_TAUNT";
    case AT_DTHROW:
        return "AT_DTHROW";
    case AT_FTHROW:
        return "AT_FTHROW";
    case AT_NTHROW:
        return "AT_NTHROW";
    case AT_UTHROW:
        return "AT_UTHROW";
    case AT_FSTRONG_2:
        return "AT_FSTRONG_2";
    case AT_USTRONG_2:
        return "AT_USTRONG_2";
    case AT_DSTRONG_2:
        return "AT_DSTRONG_2";
    case AT_TAUNT_2:
        return "AT_TAUNT_2";
    case AT_EXTRA_1:
        return "AT_EXTRA_1";
    case AT_EXTRA_2:
        return "AT_EXTRA_2";
    case AT_EXTRA_3:
        return "AT_EXTRA_3";
}