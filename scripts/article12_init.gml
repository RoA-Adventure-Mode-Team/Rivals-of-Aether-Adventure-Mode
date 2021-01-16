//article12_init, Dynamic Lighting, By CaptnTechnicality
sprite_index = asset_get("empty_sprite");


custom_args = [];
action_article_index = 0;
_init = 0;
group = 0;
debug = 0;
init_pos = [0,0];
init_x = x;
init_y = y;

wait_time = 20;
wait_time_max = 20;
anim_speed = 0;
spe = 0;

render_sprite = spawn_variables[0];
anim_speed = spawn_variables[1]*.01;
follow_object = spawn_variables[2];

image_xscale = 2;
image_yscale = 2;

render_sprite = sprite_get("empty_sprite");
render_index = 0;
bg_color = $702010;
bg_color_true = bg_color;
color_rate = .02;
sat_limit = 100;
draw = false;