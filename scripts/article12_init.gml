//article12_init, Dynamic Lighting, By CaptnTechnicality
sprite_index = asset_get("empty_sprite");
disable_movement = true;

custom_args = [];
action_article_index = 0;
_init = 0;
group = 0;
debug = false;
debug_info = false;
init_pos = [0,0];
init_x = x;
init_y = y;

spr_dir = 1;

wait_time = 20;
wait_time_max = 20;
anim_speed = 0;
spe = 0;

render_sprite = spawn_variables[0];
anim_speed = spawn_variables[1]*.01;
follow_object = spawn_variables[2];
cant_root = spawn_variables[3];

image_xscale = 2;
image_yscale = 2;

render_sprite = sprite_get("empty_sprite");
render_index = 0;
bg_color = $ffffff;
bg_color_true = bg_color;
color_rate = 1;
val_limit = 70;
draw = false;