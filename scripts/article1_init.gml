//article1_init, target spawner
sprite_index = asset_get("empty_sprite");

_init = 0;

marker = array_create(2);
current_marker = 1;

wait_time = 20;
wait_time_max = 20;
anim_speed = 0;
spe = 0;

//print_debug(string([x,y]));
//max_speed = [5,5];
range = [20,20];