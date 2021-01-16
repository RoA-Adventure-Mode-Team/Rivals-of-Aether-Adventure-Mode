//article1_init, target spawner
sprite_index = asset_get("empty_sprite");


custom_args = array_create(0);

_init = 0;
group = 0;
debug = 0;
init_pos = [0,0];
init_x = x;
init_y = y;

x_lax = 0;
y_lax = 0;
lax_coef = .1;

spr_name = "";
spr_ = 0;

wait_time = 20;
wait_time_max = 20;
anim_speed = 0;
spe = 0;

anim_speed = spawn_variables[1]*.01;
group = spawn_variables[2];
static = spawn_variables[4];
alpha_ = spawn_variables[5];
c_color = spawn_variables[6];

image_xscale = 2;
image_yscale = 2;