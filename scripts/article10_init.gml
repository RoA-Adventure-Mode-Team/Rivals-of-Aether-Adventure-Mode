//article10_init, Items

sprite_index = asset_get("empty_sprite");
disable_movement = true;
_init = 0;
state = 0;
state_old = 0;
state_timer = 0;
debug = false;
debug_info = false;
init_pos = [0,0];
cell_pos = [0,0];
debug_color = c_gray;

event_flag = 0;


custom_args = array_create(0);
item_id = spawn_variables[0];
//sprite_index = spawn_variables[1];
grav_radius = spawn_variables[2];
grav_accel = spawn_variables[3];
auto_use = spawn_variables[4];
item_name = spawn_variables[5];

collis_obj = noone;
cooldown_timer = 120;
down_held = 0;

follow_player = noone;
follow_offset_x = 42;

follow_pos = [0,0];

keep = false;