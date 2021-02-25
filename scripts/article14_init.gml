//article14_init, Particles
sprite_index = asset_get("empty_sprite");
disable_movement = true;
custom_args = array_create(0);

_init = 0;
group = 0;
debug = false;
debug_info = false;
init_pos = [0,0];
init_x = x;
init_y = y;

spr_name = "";
spr_ = 0;

wait_time = 20;
wait_time_max = 20;
anim_speed = 0;
spe = 0;
alive_time = 0;

spr_name = spawn_variables[0];
spawn_time = spawn_variables[1];
vfx_time = spawn_variables[2];
anim_speed = spawn_variables[3];
type = spawn_variables[4];
vel = spawn_variables[5];
alpha_ = spawn_variables[6];

active_particles = [];