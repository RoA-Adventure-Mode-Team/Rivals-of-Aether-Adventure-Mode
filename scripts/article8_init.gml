//article8_init, Room Transitions

sprite_index = asset_get("empty_sprite");

_init = 0;
init_pos = [0,0];
state = 0;
state_old = 0;
state_timer = 0;
debug_color = c_fuchsia;
anim_speed = 0;

custom_args = array_create(0);

collis_obj = noone;


active_scene = spawn_variables[0];
trigger_shape = spawn_variables[1];
trigger_w = spawn_variables[2];
trigger_h = spawn_variables[3];
to_room = spawn_variables[4];
room_switch_type = spawn_variables[5];
hold_up = spawn_variables[6];
event_id = spawn_variables[7];
