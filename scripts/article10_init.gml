//article9_init, Items

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
item_id = spawn_variables[0];
grav_radius = spawn_variables[1];
grav_accel = spawn_variables[2];
auto_use = spawn_variables[3];
stock_type = spawn_variables[4];
stock_limit = spawn_variables[5];

collis_obj = noone;

follow_player = noone;
follow_offset_x = 42;

follow_pos = [0,0];

keep = false;