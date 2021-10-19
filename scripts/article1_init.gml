//article1_init, target spawner
sprite_index = asset_get("empty_sprite");
disable_movement = true;
custom_args = array_create(0);

_init = 0;
group = 0;
debug = 0;
debug_info = 0;
debug_pos = 0;
init_pos = [0,0];
cell_pos = [0,0];
init_x = x;
init_y = y;

og_depth = depth;

x_lax = 0;
y_lax = 0;
lax_coef = .1;

spr_name = "";
spr_ = 0;

anim_speed = 0;

anim_speed = spawn_variables[1]*.01;
group = spawn_variables[2];
static = spawn_variables[4];
alpha_ = spawn_variables[5];
c_color = spawn_variables[6];

image_xscale = 2;
image_yscale = 2;