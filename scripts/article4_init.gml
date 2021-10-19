//article4_init, Area Triggers

sprite_index = asset_get("empty_sprite");
disable_movement = true;

_init = 0;
state = 1;
state_old = 0;
state_timer = 0;
debug = false;
debug_info = false;
init_pos = [0,0];
debug_color = c_red;

spr_dir = 1;

anim_speed  = [.1,.1,.3];
anim_type = 0;
action_id = spawn_variables[0];
active_scene = spawn_variables[1];
trigger_obj_type = spawn_variables[2];
//trigger_cooldown_max = spawn_variables[3]; 
trigger_shape = spawn_variables[4];
trigger_w = spawn_variables[5];
trigger_h = spawn_variables[6];
// trigger_negative = spawn_variables[7];
req_item_id = 0; //spawn_variables[7][0]
hold_up = 0; //spawn_variables[7][1]
trigger_relative = 0; //spawn_variables[7][2]
check_visibility = 0; //spawn_variables[7][3]

has_triggered = false;

cur_scene = 0;

trigger_cooldown = 0;
trigger_cooldown_max = 360;

trigger_var = noone;
//trigger_objects = [pHitBox];
//trigger_player = [all];
collis_obj = noone;
destroy_on_trigger = false;
destroy_effect = asset_get("sfx_ice_shatter_big");

switch trigger_obj_type {
    case 0:
        trigger_obj_type = oPlayer;
        break;
    case 1:
        trigger_obj_type = pHitBox;
        break;
    case 2: 
        break;
}