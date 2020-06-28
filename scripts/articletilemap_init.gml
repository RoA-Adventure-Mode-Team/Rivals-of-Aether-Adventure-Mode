//article7_init, TileMapped Terrain

sprite_index = asset_get("empty_sprite");

_init = 0;
init_pos = [0,0];

anim_speed = 0;

custom_args = array_create(0);

tmap_id = spawn_variables[0];
tmap_size = spawn_variables[1];
col_x = spawn_variables[2];
col_y = spawn_variables[3];
tile_data = array_create(0);
tmap_sprite = sprite_get("tilemap_"+string(tmap_id));