//article16_init, Local Sound
sprite_index = asset_get("empty_sprite");
disable_movement = true;

_init = 0;
debug = true;
debug_info = false;
init_pos = [0,0];
debug_color = c_aqua;

active_scene = 0;
sound = noone;
sound_playing = false;
radius_max = 10;
loop = true;

collis_obj = noone;