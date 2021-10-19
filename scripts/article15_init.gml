//article15_init, Destructable Terrain
sprite_index = asset_get("empty_sprite");
disable_movement = true;

custom_args = array_create(0);

_init = 0;
group = 0;
debug = 0;
debug_info = 0;
debug_pos = 0;
init_pos = [0,0];
init_x = x;
init_y = y;

og_depth = depth;

spr_name = "";
spr_ = 0;

collis = 0;
destroyed = 0;

anim_speed = 0;

anim_speed = spawn_variables[1]*.01;
group = spawn_variables[2];
dest_sfx = spawn_variables[3];

action_id = spawn_variables[5];
active_scene = spawn_variables[6];
alpha_time = spawn_variables[7];
full_alpha = 1;

image_xscale = 2;
image_yscale = 2;