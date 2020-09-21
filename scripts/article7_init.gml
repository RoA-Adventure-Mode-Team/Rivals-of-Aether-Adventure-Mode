//article7_init, Camera Controller

sprite_index = asset_get("empty_sprite");


_init = 0;
state = 0;
state_old = 0;
state_timer = 0;
debug = false;
init_pos = [0,0];
cell_pos = [0,0];

custom_args = array_create(0);

trigger_shape = spawn_variables[0];
trigger_w = spawn_variables[1];
trigger_h = spawn_variables[2];
lock_type = spawn_variables[3];
cam_lock_x = spawn_variables[4];
cam_lock_y = spawn_variables[5];

collis_obj = noone;

