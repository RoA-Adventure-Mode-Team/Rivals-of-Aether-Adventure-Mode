// decorative columns

deco_image = asset_get("empty_sprite");
sprite_index = asset_get("empty_sprite");
mask_index = sprite_get("column_deco");
transparency_timer = 0;
debug = false;

_init = 1;
dither_type = 0;
full_transparency = 0;
keep = 0;

x_lax = 0;
y_lax = 0;
lax_coef = .1;

deco_image = asset_get("empty_sprite");
dither_type = spawn_variables[1];
full_transparency = spawn_variables[2];
dither_time = spawn_variables[3];
collis_type = spawn_variables[4];
parallax_x = spawn_variables[5];
parallax_y = spawn_variables[6];
static = spawn_variables[7];



room_manager = noone;
init_cam_pos = [0,0];

