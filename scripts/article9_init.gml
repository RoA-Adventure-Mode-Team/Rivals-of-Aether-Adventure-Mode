//article9_init, Checkpoint

sprite_index = asset_get("empty_sprite");

_init = 0;
state = 0;
state_old = 0;
state_timer = 0;
debug = true;
init_pos = [0,0];
cell_pos = [0,0];
debug_color = c_gray;



custom_args = array_create(0);
trigger_shape = spawn_variables[0];
trigger_w = spawn_variables[1];
trigger_h = spawn_variables[2];
checkpoint_id = spawn_variables[3];
stock_type = spawn_variables[4];
stock_limit = spawn_variables[5];

collis_obj = noone;