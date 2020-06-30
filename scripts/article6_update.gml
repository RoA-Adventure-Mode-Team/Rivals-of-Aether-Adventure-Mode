//article6_update, Enemy
//Rework done by Harbige12

//Targeting Enum
enum TR {
    NEAR,
    MID,
    FAR,
    RANDOM,
    LOW,
    HIGH
}

//Event Enum
enum EN_EVENT {
    INIT,
    ANIMATION,
    PRE_DRAW,
    POST_DRAW,
    UPDATE,
    DEATH,
    SET_ATTACK,
    ATTACK_UPDATE,
    GOT_HIT,
    GOT_PARRIED
}

if !_init {
    enem_id = spawn_variables[0];
    //player_controller = 1;
    art_event = EN_EVENT.INIT
    user_event(6);
    _init = 1;
    //print_debug(get_attack_name(attacks[0]));
} else {
    in_render = physics_range == -1 || (point_distance(x,y,view_get_xview()+view_get_wview()/2,view_get_yview()+view_get_hview()/2) < physics_range);
    if in_render {
        if hitpause <= 1 { 
            if (hitstun <= 0) {
                hsp = old_hsp;
                vsp = old_vsp;
            }
        }
        else {
            hsp = 0;
            vsp = 0;
        }
        
        if (hitpause > 0)
            hitpause--;
        reset_variables();
        if player_controller != 0 {
            with oPlayer {
                if player == other.player_controller set_state(PS_IDLE_AIR);
            }
            with obj_stage_article if get_article_script(id) == 5 && follow_player != other.id follow_player = other.id;
            get_inputs(player_controller);
        }
        if instance_exists(ai_target) frame_update();
        ai_update();
        input_process();
        physics_update();
        state_machine();
        hitbox_update();
    }
    else {
        hsp = 0;
        vsp = 0;
    }
}

#define reset_variables()

joy_pad_idle = true;
super_armor = false;
right_down = false;
left_down = false;
jump_down = false;
left_hard_pressed = false;
right_hard_pressed = false;
down_hard_pressed = false;

#define ai_update()
if hitpause <= 0 {
    state_timer++;
}

if hitstun <= 0 {
    if art_state != next_state {
        prev_state = art_state;
        art_state = next_state;
        if art_state != 5 && art_state != 6 && art_state != PS_DEAD {
            hurtbox_spr = collision_box;
            committed = 0;
            set_sprite_from_state(enem_id, art_state);
        }
        state_timer = 0;
    }
} else {
    //Contributed by Harbige
    right_down = false;
    left_down = false;
    jump_down = false;
    left_hard_pressed = false;
    right_hard_pressed = false;
    down_hard_pressed = false;
    
    hurtbox_spr = collision_box;
    if !is_free art_state = PS_HITSTUN_LAND; 
    else art_state = PS_HITSTUN;
    if hitpoints_max > 0 {
        if (percent >= hitpoints_max) {
            art_state = PS_DEAD;
        }
    }
    //
}
//Default AI Targeting
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

if (art_state != PS_DEAD) {
    art_event = EN_EVENT.UPDATE
    user_event(6); //Custom behavior
}
else {
    art_event = EN_EVENT.DEATH
    user_event(6); //Custom behavior
}

#define frame_update() //Updates ai information every frame, not physics
x_dist = abs(x-ai_target.x);
y_dist = abs(y-ai_target.y);
target_dir = sign(x-ai_target.x);

is_ai = (player_controller == 0);
#define state_machine() //Player-esque State Machine

switch (enemy_class) {
    case 0:
        switch art_state { //Gameplay Logic
            case PS_ATTACK_AIR:
                committed = 1;
                if !is_free art_state = PS_LAND;
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
                next_state = PS_FIRST_JUMP;
            break;
            case PS_FIRST_JUMP:
                if !is_free next_state = PS_LAND;
                break;
            case PS_DOUBLE_JUMP:
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
                if is_free next_state = PS_IDLE_AIR; 
                hsp = clamp(hsp -walk_accel*left_down + walk_accel*right_down, -walk_speed, walk_speed);
                if (state_timer == 0)
                    spr_dir = -spr_dir;
                if state_timer > walk_turn_time {
                    next_state = PS_WALK;
                }
                break;
            case PS_WALK:
                if is_free next_state = PS_IDLE_AIR; 
                if spr_dir != to_dir next_state = PS_WALK_TURN;
                hsp = clamp(hsp -walk_accel*left_down + walk_accel*right_down, -walk_speed, walk_speed);
                if (left_hard_pressed || right_hard_pressed) {
                    if (left_down || right_down) && able_to_dash next_state = PS_DASH_START;
                }
                else if !(left_down || right_down) next_state = PS_IDLE;
                if down_down && able_to_crouch next_state = PS_CROUCH;
                break;
            case PS_DASH_TURN:
                if (state_timer == 0)
                    spr_dir = -spr_dir;
                hsp = clamp(hsp + spr_dir*dash_turn_accel, -dash_speed, dash_speed);
                if state_timer > dash_turn_time {
                    next_state = PS_DASH;
                }
                break;
            case PS_DASH_START:
                hsp = spr_dir*initial_dash_speed;
                if state_timer > initial_dash_time next_state = PS_DASH;
                if to_dir != spr_dir {
                    state_timer = 0;
                    spr_dir = -spr_dir;
                }
                if !(left_down || right_down) next_state = PS_IDLE;
                break;
            case PS_DASH:
                hsp = spr_dir*dash_speed;
                if spr_dir != to_dir next_state = PS_DASH_TURN;
                if !(left_down || right_down) next_state = PS_DASH_STOP;
                break;
            case PS_DASH_STOP:
                if state_timer > dash_stop_time {
                    hsp *= dash_stop_percent;
                    next_state = PS_IDLE;
                }
                break;
            case PS_LAND:
                committed = 1;
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
                if is_free next_state = PS_IDLE_AIR;
                if (left_hard_pressed || right_hard_pressed) {
                    if (left_down || right_down) && able_to_dash next_state = PS_DASH_START;
                } else if (left_down || right_down) {
                    next_state = PS_WALK;
                    if spr_dir != to_dir next_state = PS_WALK_TURN;
                }
                if down_down && able_to_crouch next_state = PS_CROUCH;
                break;
            case PS_CROUCH:
                if !down_down {
                    crouch_timer++;
                    if crouch_timer > 3 next_state = PS_IDLE;
                } else crouch_timer = 0;
                break;
            case PS_LANDING_LAG:
                if is_free next_state = PS_IDLE_AIR;
                if state_timer > land_time next_state = PS_IDLE;
                break;
        }
    break;
    case 1:
        switch art_state { //Gameplay Logic
            case PS_ATTACK_AIR:
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
                if state_timer == 3 {
                    _joy_dir = joy_dir;
                    invincible = 19;
                    sound_play(air_dodge_sound);
                }
                if state_timer > 24 {
                    hsp = 0;
                    vsp = 0;
                    next_state = PS_IDLE;
                }
                break;
            case PS_WALK_TURN:
                if (state_timer == 0)
                    spr_dir = -spr_dir;
                if state_timer > walk_turn_time {
                    next_state = PS_WALK;
                }
                break;
            case PS_WALK:
                if spr_dir != to_dir next_state = PS_WALK_TURN;
                hsp += lengthdir_x(walk_accel, joy_dir);
                vsp += lengthdir_y(walk_accel, joy_dir);
                hsp = clamp(hsp, -walk_speed, walk_speed)
                vsp = clamp(vsp, -walk_speed, walk_speed)
                if (left_hard_pressed || right_hard_pressed) {
                    if !joy_pad_idle && able_to_dash next_state = PS_DASH_START;
                }
                else if joy_pad_idle next_state = PS_IDLE;
                break;
            case PS_DASH_TURN:
                if (state_timer == 0)
                    spr_dir = -spr_dir;
                hsp = clamp(hsp + spr_dir*dash_turn_accel, -dash_speed, dash_speed)
                vsp = 0;
                if state_timer > dash_turn_time {
                    next_state = PS_DASH;
                }
                break;
            case PS_DASH_START:
                hsp = spr_dir*initial_dash_speed;
                vsp = 0
                if state_timer > initial_dash_time next_state = PS_DASH;
                if to_dir != spr_dir {
                    state_timer = 0;
                    spr_dir = -spr_dir;
                }
                if joy_pad_idle next_state = PS_IDLE;
                break;
            case PS_DASH:
                hsp += lengthdir_x(dash_accel, joy_dir);
                vsp += lengthdir_y(dash_accel, joy_dir);
                hsp = clamp(hsp, -dash_speed, dash_speed)
                vsp = clamp(vsp, -dash_speed, dash_speed) / 2
                if spr_dir != to_dir next_state = PS_DASH_TURN;
                if joy_pad_idle next_state = PS_DASH_STOP;
                break;
            case PS_DASH_STOP:
                if state_timer > dash_stop_time {
                    hsp *= dash_stop_percent;
                    vsp *= dash_stop_percent;
                    next_state = PS_IDLE;
                }
                break;
            case PS_IDLE_AIR:
                next_state = PS_IDLE;
            break;
            case PS_IDLE:
                if (left_hard_pressed || right_hard_pressed) {
                    if !joy_pad_idle && able_to_dash next_state = PS_DASH_START;
                } else if !joy_pad_idle {
                    next_state = PS_WALK;
                    if spr_dir != to_dir next_state = PS_WALK_TURN;
                }
                break;
            
        }
    break;
}

switch (art_state) {
    case PS_HITSTUN:
    case PS_HITSTUN_LAND:
    case PS_TUMBLE:
        set_sprite_from_state(enem_id, art_state);
        if hitpause > 0 {
            state_timer = 0;
        } else {
            if (state_timer <= 2) {
                if !is_free && kb_angle > 3.14159 && kb_angle < 3.14159*2 vsp = kb_power*sin(kb_angle);
                else if !is_free vsp = -abs(kb_power*dsin(kb_angle));
                else vsp = -kb_power*dsin(kb_angle);
                hsp = kb_power*dcos(kb_angle);
                if hsp != 0 spr_dir = -sign(hsp);
            }
            if horiz_col hsp = -hsp*.7;
            old_hsp = hsp;
            old_vsp = vsp;
            hitstun--;
            if hitstun <= 0 {
                hitstun = 0;
                next_state = PS_IDLE_AIR;
            }
        }
        break;
    case PS_DEAD:
    with asset_get("pHitBox") if "hit_owner" in self && hit_owner == other.id {
        if (type != 2) {
            instance_destroy(id);
            continue;
        }
    }
    
    break;
}

if hitpause <= 0 switch art_state { //Display Logic
        case PS_IDLE:
        case PS_IDLE_AIR:
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
            image_index = clamp(ease_linear(0,image_number, state_timer, double_jump_time), 0, image_number - 1);
            break;
        case PS_CROUCH:
            if crouch_timer == 0 image_index = clamp(state_timer/3,0,image_number-1);
            else image_index = clamp((3-crouch_timer)/3,0,image_number-1);
            break;
        case PS_WALK_TURN:
            image_index = clamp(ease_linear(0,image_number, state_timer, walk_turn_time), 0, image_number - 1);
            break;
        case PS_DASH_TURN:
            image_index = clamp(ease_linear(0,image_number, state_timer, dash_turn_time), 0, image_number - 1);
            break;
        case PS_DASH_START:
            image_index = clamp(ease_linear(0,image_number, state_timer, initial_dash_time), 0, image_number - 1);
            break;
        case PS_DASH_STOP:
            image_index = clamp(ease_linear(0,image_number, state_timer, dash_stop_time), 0, image_number - 1);
            break;
        case 5:
            image_index = clamp(ag_window_anim_frame_start[window]+floor(ease_linear(0,ag_window_anim_frames[window],window_timer,floor(ag_window_length[window]*(1+.5*ag_window_wifflag[window]*(!has_hit_en)) + 1))), 0, image_number - 1);
            break;
        case 6:
            image_index = clamp(ag_window_anim_frame_start[window]+floor(ease_linear(0,ag_window_anim_frames[window],window_timer,floor(ag_window_length[window]*(1+.5*ag_window_wifflag[window]*(!has_hit_en)) + 1))), 0, image_number - 1);
            break;
        case PS_HITSTUN:
            image_index +=  (kb_power / 60);
            break;
    }
    
art_event = EN_EVENT.ANIMATION
user_event(6); //Custom behavior

if next_attack != -1 attack_start();
#define input_process() //For inputs in more than 1 state

if right_down || left_down to_dir = right_down-left_down;
if jump_down jump_held++;
else jump_held = 0;
if down_down down_held++;
else down_held = 0;


if !committed {
    if jump_down && able_to_jump {
        if (enemy_class == 0) {
            if is_free {
                if jump_held == 1 && djumps > 0 && able_to_djump {
                    next_state = PS_DOUBLE_JUMP;
                    djumps--;
                }
            } else next_state = PS_JUMPSQUAT;
        }
    } else if shield_down && able_to_shield {
        if is_free || enemy_class == 1 next_state = PS_AIR_DODGE;
        else next_state = PS_PARRY_START;
    }
}

if down_hard_pressed && !committed can_fallthrough = 1;
else if !down_down can_fallthrough = 0;


#define physics_update() //Physics updates, every frame
horiz_col = false;
vert_col = false;
is_free = can_be_grounded ? (vsp < 0 || (!place_meet_solid(x,y+2) && !(get_plat(x,y+2) && !can_fallthrough))) : true;
//free = true;
//var _y = 0;
//var _y_limit = 32;

//Physics Friction

if hitpause <=  0 {
    if is_free {
        if hitstun <= 0 vsp += gravity_speed;
            else vsp += hitstun_grav;
        if (art_state != PS_ATTACK_AIR && art_state != PS_ATTACK_GROUND) {
            if (enemy_class == 0) {
                hsp *= 1-air_friction;
            }
            else {
                hsp *= 1-air_friction;
                vsp *= 1-air_friction;
            }
        }
        if (enemy_class == 0) {
            vsp = min(vsp, max_fall);
            if (art_state != PS_ATTACK_AIR && art_state != PS_ATTACK_GROUND) {
                if abs(hsp) < air_max_speed hsp += -air_accel*left_down+air_accel*right_down;
            }
        }
        else {
            if (player_controller == 1) {
                if (art_state != PS_ATTACK_AIR && art_state != PS_ATTACK_GROUND) {
                    if (!joy_pad_idle) {
                        if abs(hsp) < air_max_speed  hsp += lengthdir_x(air_accel, joy_dir);
                        if abs(vsp) < air_max_speed  vsp += lengthdir_y(air_accel, joy_dir);
                    }
                }
            }
        }
        //if !state_is_free next_state = PS_IDLE_AIR;
    } else {
        vsp = 0;
        djumps = max_djumps;
        if (art_state != PS_ATTACK_AIR && art_state != PS_ATTACK_GROUND) {
            hsp *= 1-ground_friction/5;
        }
        has_air_dodge = 1;
    }
}
if (!ignores_walls) {
    vert_col = (place_meet_solid(x,y+2));
    
    if !vert_col && (place_meet_solid(x+5,y) || place_meet_solid(x-5,y)) horiz_col = true;
}
//Fix Clipping
if !is_free && vsp <= 0 && place_meet(x,y+1) y--;
/*if !is_free && vsp <= 0 {
//if state == PS_LAND || state == PS_LANDING_LAG || state == PS_WAVELAND {
    while (place_meet(x,y-_y+1) && _y < _y_limit+1)  _y++;
    if _y < _y_limit {
        y -= _y;
        if _y > 0 && debug print_debug("SHIFTED: "+string(_y));
        vsp = 0;
    } else if _y > 0 && debug print_debug("TOO FAR");
}*/


/*if vert_col {
    _y = 0;
    while (place_meet_solid(x,y+_y-1) && _y < _y_limit+1)  _y++;
    if _y < _y_limit {
        //y += _y;
        //vsp = 0;
    } else vert_col = false; //If it's greater than this, it's probably against a wall.
}


//Horizontal Collision Detection
if !vert_col {
    if place_meet_solid(x+5,y) {
        //while place_meet_solid(x+1,y-1) x--;
        //if state != PS_HITSTUN hsp = 0; 
        horiz_col = true;
    }
    if place_meet_solid(x-5,y) {
        //while place_meet_solid(x-1,y-1) x++;
        //if state != PS_HITSTUN hsp = 0; 
        horiz_col = true;
    }
}*/
//print_debug(string(vert_col));

if hit_player_id != noone && hit_player_id.object_index == oPlayer.object_index && ((hit_player_id.state != 5 &&  hit_player_id.state != 6) || hit_player_id.window == 1) {
    hbox_group = -1;
    hit_player_id = noone;
}

if invincible == 0 {
    last_hitbox = hit_id;
    mask_index = hurtbox_spr;
    hit_id = instance_place(x,y,pHitBox);
    mask_index = collision_box;
    if hit_id == noone has_hit = 0;
    if hit_lockout > 0 hit_lockout--;
    if hit_id != noone && (!("hit_owner" in hit_id) || hit_id.hit_owner != id) && (!("team" in hit_id) || hit_id.team != team)  && hit_lockout == 0 && last_hitbox != hit_id && (hit_id.hbox_group == -1 || hit_id.hbox_group != hbox_group) {
        with hit_id {
            if other.hitstun == 0 || kb_value*4*((other.knockback_adj-1)*0.6+1)+other.percent*0.12*kb_scale*4*0.65*other.knockback_adj > other.hitstun {
                
                //DEPRICATED BECAUSE get_hitbox_angle() EXISTS TY GIIK
                
                /*if kb_angle == 361 && other.free other.kb_angle = 45;
                else if kb_angle == 361 && !other.free other.kb_angle = 40;
                var _kb_angle = kb_angle;
                var true_dir = player_id.spr_dir;
                if attack == AT_BAIR true_dir = !true_dir; //I swear to god Dan
                if true_dir == 1 other.kb_angle = (kb_angle)*3.14159/180;
                else other.kb_angle = (180-kb_angle)*3.14159/180;
                
                var _x_hcenter = other.x-x;
                var _y_hcenter = other.y-y;
                var _x_pcenter = other.x-player_id.x;
                var _y_pcenter = other.y-player_id.y;
                switch hit_flipper {
                    case 1: // Send away from the enemy
                        other.kb_angle = tan(_y_hcenter/_x_hcenter);
                        break;
                    case 2: // Send toward from the enemy
                        other.kb_angle = tan(_y_hcenter/_x_hcenter)+3.14159/2;
                        break;
                    case 3: // Horizontal away
                        other.kb_angle = tan(arcsin(other.kb_angle)/(sign(_x_hcenter)*arccos(other.kb_angle)));
                        break;
                    case 4: // Horizontal towards
                        other.kb_angle = tan(arcsin(other.kb_angle)/(-sign(_x_hcenter)*arccos(other.kb_angle)));
                        break;
                }*/
                //
                if (!other.super_armor) {
                    other.spr_dir = -spr_dir;
                    other.percent += damage;
                    other.kb_power = kb_value+other.percent*0.12*kb_scale*other.knockback_adj;
                    other.hitstun = kb_value*4*((other.knockback_adj-1)*0.6+1)+other.percent*0.12*kb_scale*4*0.65*other.knockback_adj;
                }
                other.hitpause = hitpause + other.percent*hitpause_growth*0.05;
                other.old_hsp = other.hsp;
                other.old_vsp = other.vsp;
                if no_other_hit != 0 other.hit_lockout = no_other_hit;
                else other.hit_lockout = hitpause;
                other.hit_sound = sound_effect;
                other.hit_visual = hit_effect;
                other.hbox_group = hbox_group;
            }
        }
        art_event = EN_EVENT.GOT_HIT
        user_event(6); //Custom behavior
        kb_angle = get_hitbox_angle(hit_id);
        if hit_id.player_id != 0 with hit_id.player_id {
            has_hit = 1;
            has_hit_id = other.id;
            old_vsp = vsp;
            old_hsp = hsp;
            hitstop = other.hitpause;
            hitpause = 1;
            hsp = 0;
            vsp = 0;
        }
        hit_player_id = hit_id.player_id;
        if (!hit_id.fx_created && hit_id.hbox_group != -1) || hit_id.hbox_group == -1 {
            hit_id.fx_created = true;
            if (hit_visual >= 0)
                with (hit_id)
                    spawn_hit_fx(x + (spr_dir * hit_effect_x), y + hit_effect_y, hit_effect);
            if (hit_id.hitstun_factor != -1)
                sound_play(hit_sound);
        }
        if (hit_id.type == 2 && hit_id.enemies == 0) {
            instance_destroy(hit_id);
        }
        has_hit = 1;
    }
} else invincible--;

#define hitbox_update() //Update enemy hitboxes

with asset_get("pHitBox") if "hit_owner" in self && hit_owner == other.id {
    if (type != 2) {
        var x_off = other.hg_x[hbox_num];
        var y_off = other.hg_y[hbox_num];
        x_pos = ((other.x + x_off * other.spr_dir) - obj_stage_main.x);
        y_pos = ((other.y + y_off) - obj_stage_main.y);
        hsp = other.hsp;
        vsp = other.vsp;
        spr_dir = other.spr_dir;
        
        if (obj_stage_main.hitstop > 0) {
            other.hitpause = obj_stage_main.hitstop;
            obj_stage_main.hitstop = 0;
            obj_stage_main.hitpause = false;
            
            other.has_hit_en = 1;
        }
    }
}
if (hitpause <= 0 && hitstun <= 0) {
    old_hsp = hsp;
    old_vsp = vsp;
}
#define place_meet(__x,__y) //get place_meeting for the usual suspects
/*return (collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("solid_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_solid,true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("jumpthrough_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_platform,true,true));*/
return (place_meeting(__x,__y,asset_get("solid_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_solid) || 
        place_meeting(__x,__y,asset_get("jumpthrough_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_platform));
#define place_meet_solid(__x,__y) //get place_meeting for the usual suspects
/*return (collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("solid_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_solid,true,true));*/
return (place_meeting(__x,__y,asset_get("solid_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_solid));
#define place_meet_plat(__x,__y) //get place_meeting for the usual suspects
/*return (collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("jumpthrough_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_platform,true,true));*/
return (place_meeting(__x,__y,asset_get("jumpthrough_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_platform));
#define get_plat(__x,__y)
//var _plat = collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_platform,true,true);
var _plat = instance_place(__x,__y,obj_stage_article_platform);
if instance_exists(_plat) return _plat;
else return instance_place(__x,__y,asset_get("jumpthrough_32_obj"));
#define attack_update() //Attack update script during attacks
//if debug print_debug("[EM] Attack Updating..."+string(window)+":"+string(window_timer));
if (hitpause <= 0) {
    
    if window_timer >= ag_window_length[window]*(1+.5*ag_window_wifflag[window]*(!has_hit_en)) {
        if window >= ag_num_windows {
            is_attacking = false;
            next_state = PS_IDLE;
            set_sprite_from_state(enem_id, next_state);
            window = 1;
            window_timer = 0;
        }
        else {
            if ag_window_type[window] != 9 &&  ag_window_type[window] != 8 {
                window++;
            }
            window_timer = 0;
        }
    }
    
    if (ag_window_type[window] == 8 && !is_free) {
        window++;
        window_timer = 0;
    }
    
    //Speeds
    switch ag_window_hspeed_type[window] {
        case 2:
            if window_timer == 0 hsp = ag_window_hspeed[window]*spr_dir;
            break;
        case 1:
            hsp = ag_window_hspeed[window]*spr_dir;
            break;
        default:
            if window_timer == 0 hsp += ag_window_hspeed[window]*spr_dir;
            break;
    }


    switch ag_window_vspeed_type[window] {
        case 2:
            if window_timer == 0 vsp = ag_window_vspeed[window];
            break;
        case 1:
            vsp = ag_window_vspeed[window];
            break;
        default:
            if window_timer == 0 vsp += ag_window_vspeed[window];
            break;
    }
    
    //Sounds
    if ag_window_has_sfx[window] == 1 && ag_window_sfx_frame[window] == window_timer && ag_window_sfx[window] != 0 
        sound_play(ag_window_sfx[window]);
        
    //Friction
    var g_frict = ground_friction;
    var a_frict = air_friction;
    if (ag_window_has_custom_friction[window] == 1) {
        g_frict = ag_window_custom_ground_friction[window];
        a_frict = ag_window_custom_air_friction[window];
    }
    if (is_free) {
        hsp *= 1-a_frict;
        if (enemy_class == 1)
            vsp *= 1-a_frict;
    }
    else {
        hsp *= 1-g_frict/5;
    }
    
    for (var j = 1; j <= hg_num_hitboxes; j += 1) if window == hg_window[j] && window_timer == hg_window_frame[j] {
        var hitb = create_hitbox(attack,j,x+hg_x[j]*spr_dir,y+hg_y[j]);
        hitb.type = hg_type == 0 ? 1 : hg_type;
        if not "hit_owner" in hitb hitb.hit_owner = id;
        if not "team" in hitb hitb.team = team;
    }
    
    window_timer++;
    
    
    art_event = EN_EVENT.ATTACK_UPDATE
    user_event(6); //Custom behavior
}

#define attack_start() //Start attacking 
art_event = EN_EVENT.SET_ATTACK
user_event(6); //Custom behavior
get_attack(next_attack);

has_hit_en = false;
last_attack = attack;
attack = next_attack;
next_attack = -1;
window_timer = 0;
window = 1;
sprite_index = ag_sprite;
image_index = 0;
hurtbox_spr = ag_hurtbox_sprite;
if is_free next_state = PS_ATTACK_AIR;
else next_state = PS_ATTACK_GROUND;

#define get_attack(_attack) //Set attack data, and attack start
print_debug("[EN] Getting attack data for "+get_attack_name(_attack));
with obj_stage_main { //Main stage script object
    other.ag_category = get_attack_value(_attack,AG_CATEGORY);
    other.ag_num_windows = get_attack_value(_attack,AG_NUM_WINDOWS);
    other.ag_sprite = get_attack_value(_attack,AG_SPRITE);
    other.hg_num_hitboxes = get_num_hitboxes(_attack);
    other.ag_hurtbox_sprite = get_attack_value(_attack,AG_HURTBOX_SPRITE);
}
for (var i = 1; i <= ag_num_windows; i += 1) {
    with obj_stage_main {
        other.ag_window_type[i] = get_window_value(_attack,i,AG_WINDOW_TYPE);
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
        if (get_window_value(_attack,i,AG_WINDOW_HAS_CUSTOM_FRICTION)) {
            other.ag_window_has_custom_friction[i] = get_window_value(_attack,i,AG_WINDOW_HAS_CUSTOM_FRICTION);
            other.ag_window_custom_air_friction[i] = get_window_value(_attack,i,AG_WINDOW_CUSTOM_AIR_FRICTION);
            other.ag_window_custom_ground_friction[i] = get_window_value(_attack,i,AG_WINDOW_CUSTOM_GROUND_FRICTION);
        }
        else {
            other.ag_window_has_custom_friction[i] = 0;
        }
    }
}
for (var i = 1; i <= hg_num_hitboxes; i += 1) {
    with obj_stage_main {
        other.hg_type = get_hitbox_value(_attack, i, HG_HITBOX_TYPE);
        other.hg_window[i] = get_hitbox_value(_attack,i,HG_WINDOW);
        other.hg_window_frame[i] = get_hitbox_value(_attack,i,HG_WINDOW_CREATION_FRAME);
        other.hg_x[i] = get_hitbox_value(_attack,i,HG_HITBOX_X);
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
clear_button_buffer(PC_LEFT_HARD_PRESSED);
clear_button_buffer(PC_RIGHT_HARD_PRESSED);
clear_button_buffer(PC_UP_HARD_PRESSED);
clear_button_buffer(PC_DOWN_HARD_PRESSED);
clear_button_buffer(PC_LEFT_STRONG_PRESSED);
clear_button_buffer(PC_RIGHT_STRONG_PRESSED);
clear_button_buffer(PC_UP_STRONG_PRESSED);
clear_button_buffer(PC_DOWN_STRONG_PRESSED);
clear_button_buffer(PC_LEFT_STICK_PRESSED);
clear_button_buffer(PC_RIGHT_STICK_PRESSED);
clear_button_buffer(PC_UP_STICK_PRESSED);
clear_button_buffer(PC_DOWN_STICK_PRESSED);
clear_button_buffer(PC_JUMP_PRESSED);
clear_button_buffer(PC_ATTACK_PRESSED);
clear_button_buffer(PC_SHIELD_PRESSED);
clear_button_buffer(PC_SPECIAL_PRESSED);
clear_button_buffer(PC_STRONG_PRESSED);
clear_button_buffer(PC_TAUNT_PRESSED);
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

#define set_sprite_from_state(_enemyID, _state) //Gets the sprite name from a state. The sprites have the same names as player sprites.
var spr_name = "";
switch (_state) {
    case PS_IDLE:
        spr_name = "idle";
        break;
    case PS_WALK:
        spr_name = "walk";
        break;
    case PS_WALK_TURN:
        spr_name = "walkturn";
        break;
    case PS_FIRST_JUMP:
    case PS_IDLE_AIR:
        spr_name = "jump";
        break;
    case PS_JUMPSQUAT:
        spr_name = "jumpstart";
        break;
    case PS_DOUBLE_JUMP:
        spr_name = "doublejump";
        break;
    case PS_AIR_DODGE:
        spr_name = "airdodoge";
        break;
    case PS_DASH:
        spr_name = "dash";
        break;
    case PS_DASH_START:
        spr_name = "dashstart";
        break;
    case PS_DASH_STOP:
        spr_name = "dashstop";
        break;
    case PS_DASH_TURN:
        spr_name = "dashturn";
        break;
    case PS_LAND:
        spr_name = "land";
        break;
    case PS_LANDING_LAG:
        spr_name = "landinglag";
        break;
    case PS_WAVELAND:
        spr_name = "waveland";
        break;
    case PS_PRATFALL:
        spr_name = "pratfall";
        break;
    case PS_CROUCH:
        spr_name = "crouch";
        break;
    case PS_PARRY:
        spr_name = "parry";
        break;
    case PS_HITSTUN:
    case PS_HITSTUN_LAND:
    case PS_TUMBLE:
        if (!is_free) {
            if (kb_power >= 10)
                spr_name = "bighurt";
            else
                spr_name = "hurtground";
        }
        else {
            if (kb_angle < 70 && kb_angle > 110) {
                spr_name = "uphurt";
            }
            else if (kb_angle < 290 && kb_angle > 250) {
                spr_name = "uphurt";
            }
            else {
                if (state_timer <= 10) {
                    if (kb_power >= 10)
                        spr_name = "bighurt";
                    else
                        spr_name = "hurt";
                }
                else
                {
                    spr_name = "spinhurt";
                }
            }
        }
        break;
    default:
        spr_name = "idle";
        break;
}
sprite_index = enemy_sprite_get(_enemyID, spr_name);

if (sprite_index == asset_get("net_disc_spr")) { //The origin of the X Sprite 
    switch (_state) {
        case PS_HITSTUN:
        case PS_HITSTUN_LAND:
        case PS_TUMBLE:
            sprite_index = enemy_sprite_get(_enemyID, "hurt");
        break;
    }
}