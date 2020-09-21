//article3_init, cutscene manager
sprite_index = asset_get("empty_sprite");
debug = false;
init_pos = [0,0];
custom_args = array_create(0);
//Only One Thing to Exist
instance_num = 0;
with obj_stage_article if num == other.num other.instance_num++;

if instance_num > 1 {
    instance_destroy();
    exit;
}
/*TG_CUSTOM = 69; //Run custom trigger code
TG_COMPLETE = 420; //Trigger upon 'completion' (defined per window type: Animation completion [> image_index], Full text display [vis_chars > full_text length])
TG_BUTTON = 2; //Triggers upon button press (any button, attack, shield, taunt, etc)
TG_TIME = 3; //Triggers after frame count
*/
//Scene Manager
list_window = ds_list_create();
open_scene_id = 1;
cur_scene = 0;
cur_scene_time = 0;
cur_scene_time_end = 0;
cur_scene_complete = false;
array_scene_data = array_create(0);
array_scene_ID = array_create(0);
array_scene_triggers = array_create(0);
cur_room = 0;
switch_to_scene = cur_scene;

_x_init = 0;
_y_init = 0;
window_num = 0;
move_timer = 0;
target_id = 0;
cpu_hit_full = false;

cam_pos = [view_get_xview()+view_get_wview()/2,view_get_yview()+view_get_hview()/2];

event_id = noone;
trigger_id= noone;
event_triggered = false;
obj_triggered = noone;

player_snap_range = 10;

cam_deathbox_bounds = [50,50,50,50];
// Bg controller
bg_data = ds_list_create();
/*bg_data = {
    sprite: noone,
    parallax: [0,0]
};*/
ds_list_add(bg_data, {
    sprite: sprite_get("bg_1"),
    parallax: [0,0]
});

bg_speed = .1;

//
tutorial_target = noone;
tutorial_default_scroll = 120;
tutorial_default_text_speed = 2;

//

//Custom Variables
with oPlayer {
    if !variable_instance_exists(self, "is_ai") other.follow_player = id;
}
//