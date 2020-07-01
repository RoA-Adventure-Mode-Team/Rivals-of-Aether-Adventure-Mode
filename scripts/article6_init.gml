//article6_init, Enemy
//Rework done by Harbige12

_init = 0;
collision_box = asset_get("ex_guy_hurt_box");
colis_width = sprite_get_width(collision_box);
colis_height = sprite_get_height(collision_box);
sprite_index = sprite_get("ou_idle");
mask_index =  collision_box; // Collision Mask
hurtbox_spr = collision_box; //Hurtbox Sprite

debug = false;
init_pos = [0,0];
can_be_grounded = true;
ignores_walls = false;

custom_args = array_create(0);

stage_main = asset_get("obj_stage_main");

//Physics Delta
physics_range = 800; //Range that physics live-updates
in_render = false;

//State Actions
art_state = PS_IDLE;
art_state_timer = 0;
state = PS_IDLE;
state_timer = 0;
next_state = 0;
prev_state = 0;
state_free = 1;
test = noone;
art_event = 0;

//Character Variables
enem_id = spawn_variables[0];
spr_dir = 1;
is_free = 1;
team = 0;
is_attacking = true;
committed = false;
sprite_default_offset = [56, 102];
crouch_timer = 0;
hitpoints_max = 0; //If this is zero, percentage knockback will be used. - Harbige
enemy_class = 0 //0 = grounded; 1 = flying

//AI Variables
player_controller = 0;
ai_target = noone;
target_dir = 0;
is_ai = (player_controller == 0);
target_behavior = 0;
pos_behavior = 0;
attacks = [AT_JAB];
attack_time = 30;

range_low = 32;
range_far = 200;

//Contributed by Harbige
able_to_crouch = true;
able_to_shield = true;
able_to_jump = true;
able_to_djump = true;
able_to_dash = true;
attack_time = 30;
//

//Animation Actions
char_height = 25;
char_arrow = sprite_get("char_arrow");
//Contributed by Harbige
char_healthbar = sprite_get("char_healthbar");
char_hud_color = make_color_rgb(163, 77, 253);
//
anim_speed = .02;
idle_anim_speed = .15;
crouch_anim_speed = .1;
walk_anim_speed = .25;
dash_anim_speed = .2;
pratfall_anim_speed = .25;
full_time = 20;
anim_type = 0; //0 is cycle; 1 is once per state

//Movement Variables
walk_speed = 6;
walk_accel = 1.5;
walk_turn_time = 6;
initial_dash_time = 10;
initial_dash_speed = 6.5;
dash_speed = 6;
dash_turn_time = 10;
dash_turn_accel = 2;
dash_stop_time = 4;
dash_stop_percent = .35; //the value to multiply your hsp by when going into idle from dash or dashstop
ground_friction = .5;
moonwalk_accel = 1.4;

jump_start_time = 5;
jump_speed = 12;
short_hop_speed = 8;
djump_speed = 10;
leave_ground_max = 6; //the maximum hsp you can have when you go from grounded to aerial without jumping
max_jump_hsp = 6; //the maximum hsp you can have when jumping from the ground
air_max_speed = 6; //the maximum hsp you can accelerate to when in a normal aerial state
jump_change = 3; //maximum hsp when double jumping. If already going faster, it will not slow you down
air_accel = .3;
prat_fall_accel = 1; //multiplier of air_accel while in pratfall
air_friction = .03;
max_djumps = 1;
double_jump_time = 32; //the number of frames to play the djump animation. Can't be less than 31.

max_fall = 9; //maximum fall speed without fastfalling
fast_fall = 11; //fast fall speed
gravity_speed = .5;
hitstun_grav = .5;
knockback_adj = 1.6; //the multiplier to KB dealt to you. 1 = default, >1 = lighter, <1 = heavier

land_time = 4; //normal landing frames
prat_land_time = 20;
wave_land_time = 15;
wave_land_adj = 1.5; //the multiplier to your initial hsp when wavelanding. Usually greater than 1
wave_friction = .04; //grounded deceleration when wavelanding

//parry animation frames
dodge_startup_frames = 1;
dodge_active_frames = 1;
dodge_recovery_frames = 4;

//tech animation frames
tech_active_frames = 3;
tech_recovery_frames = 1;

//tech roll animation frames
techroll_startup_frames = 2;
techroll_active_frames = 2;
techroll_recovery_frames = 2;
techroll_speed = 10;

//airdodge animation frames
air_dodge_startup_frames = 1;
air_dodge_active_frames = 3;
air_dodge_recovery_frames = 3;
air_dodge_speed = 7.5;

has_air_dodge = 1;

//roll animation frames
roll_forward_startup_frames = 2;
roll_forward_active_frames = 2;
roll_forward_recovery_frames = 2;
roll_back_startup_frames = 2;
roll_back_active_frames = 2;
roll_back_recovery_frames = 2;
roll_forward_max = 9; //roll speed
roll_backward_max = 9;

roll_dir = 0;

land_sound = asset_get("sfx_land_heavy");
landing_lag_sound = asset_get("sfx_land_heavy");
waveland_sound = asset_get("sfx_waveland_syl");
jump_sound = asset_get("sfx_jumpground");
djump_sound = asset_get("sfx_jumpair");
air_dodge_sound = asset_get("sfx_quick_dodge");
death_sound = asset_get("sfx_death2");

//Knockback Variables
hit_id = noone;
percent = 0;
damage = 0;
kb_power = 0;
bkb = 0;
hitstun = 0;
kb_angle = 0;
kb_scale = 0;
hitpause = 0;
hit_lockout = 0;
hit_sound = 0;
hit_visual = 0;
has_hit = 0;
has_hit_en = 0;
enem = 0;
invincible = 0;
last_hitbox = noone;
should_die = false;
horiz_col = false;
vert_col = false;
hbox_group = -1;
hit_player_id = noone;
old_hsp = 0;
old_vsp = 0;

//Pathing Variables
x_dist = 0;
y_dist = 0;
jumped = 0;
djumps = 0;
on_ground = 0;
plat_drop = 0;
to_dir = 0;
walk_turn_timer = 0;
can_fallthrough = 0;

//Attack Variables
attack_fresh = true;
attack = 0;
next_attack = -1;
last_attack = -1;
super_armor = false;

window = 0;
window_timer = 0;

ag_category = 0;
ag_num_windows = 0;
ag_window_start = 0;
ag_sprite = 0;
ag_hurtbox_sprite = 0;
ag_num_windows = 0;
ag_uses_custom_gravity = 0;
ag_off_ledge = 0;

hg_num_hitboxes = 0;
hg_hitbox_start = 0;

//Window Variables
ag_window_type[100] = 0;
ag_window_length[100] = 0;
ag_window_anim_frames[100] = 0;
ag_window_anim_frame_start[100] = 0;
ag_window_has_sfx[100] = 0;
ag_window_sfx[100] = 0;
ag_window_sfx_frame[100] = 0;
ag_window_hspeed[100] = 0;
ag_window_hspeed_type[100] = 0;
ag_window_vspeed[100] = 0;
ag_window_vspeed_type[100] = 0;
ag_window_custom_gravity[100] = 0;
ag_window_wifflag[100] = 0;
ag_window_has_custom_friction[100] = 0;
ag_window_air_friction[100] = 0;
ag_window_ground_friction[100] = 0;

//Hitbox Variables
hg_type[100] = 0;
hg_window[100] = 0;
hg_window_frame[100] = 0;
hg_x[100] = 0;
hg_y[100] = 0;
hg_bhitp[100] = 0;
hg_shitp[100] = 0;

hitb = noone;
hitb_pos = [0,0];

//Input Variables
joy_dir = 0;
joy_pad_idle = 0;
down_down = 0;
up_down = 0;
left_down = 0;
right_down = 0;
jump_down = 0;
attack_down = 0;
shield_down = 0;
taunt_down = 0;
up_strong_down = 0;
down_strong_down = 0;
left_strong_down = 0;
right_strong_down = 0;
strong_down = 0;
left_hard_pressed = 0;
right_hard_pressed = 0;
down_hard_pressed = 0;
attack_pressed = 0;

_joy_dir = 0;

attack_held = 0;
shield_held = 0;
jump_held = 0;
down_held = 0;