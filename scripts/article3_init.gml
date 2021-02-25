//article3_init, action manager
sprite_index = asset_get("empty_sprite");
disable_movement = true;
debug = true;
debug_info = false;
init_pos = [0,0];
custom_args = array_create(0);
//Only One Thing to Exist
instance_num = 0;
with obj_stage_article if num == other.num other.instance_num++;


if instance_num > 1 {
    instance_destroy();
    exit;
}
//Scene Manager New
_init = 0;
scene_array = [];
action_array = [];
action_ids = [];
object_list = [];

cur_actions = [];
cur_scene = [];
action_queue = [];
end_action_queue = [];
end_action_index = [];

action_ended = false;

cam_pos = [0,0];
cam_smooth = 0;
room_id = 1;
scene_id = 0;
scene_time = 0;
action_index = 0;
with obj_stage_main other.stage_main = id;
with obj_stage_article if num == 5 other.room_manager = id;


//Quests
quest_init = false;
quest_array = [];
quest_active = [];


// quest_add(3,1,"Test Quest","This is a test quest!");
// quest_add(3,2,"Test Quest","This is a test quest! Part 2!");
// quest_add(3,3,"Dfferent Title!","Completely different text!");
// quest_set(3,1);


// #define quest_add(_id,_progress,_title,_description)
// if _progress == 0 {
//     print("[AM] ERROR: Do not override progress 0!");
//     return false;
// }
// while _id >= array_length_1d(quest_array) array_push(quest_array,[]);
// while _progress >= array_length_1d(quest_array[_id]) array_push(quest_array[_id],[]);
// quest_array[@_id][@0] = [noone];//Save quest progress here
// quest_array[@_id][@_progress] = [_title,_description];
// if debug print_debug("[AM] Quest Edited: "+string(_id)+" : "+string(_progress));
// return true;

// #define quest_set(_id,_progress)
// quest_array[@_id][@0] = [_progress];//Save current quest progress
// if debug print_debug("[AM] Quest Progress: "+string(_id)+" : "+string(_progress));
// if _progress < 0 return noone;
// return quest_array[_id][_progress];
//action_temp = 0;



//Archytas Dialog, Chess
/*
archy_dialog = [
    "Hello everyone! It's been a while, huh?",
    "I'm excited to release something that I've been working towards for a while now!",
    "It really is that time folks!",
    "I hope you have fun in this exciting new chapter in Workshop. Send me your feedback on Discord!",
    ];
    
archy_dialog = [
    "Hello everyone again! I got you, didn't I?",
    "Here's the actual update of the progress of Adventure Mode!",
    "I've gone back and rewritten the entire back-end of the API sofar.",
    "And introduced some major upgrades to systems for ease of use and performance.",
    "Captain Technicality has helped add in some really neat features that are now possible.",
    "We're taking our time on the project, to make sure it'll be quality.",
    "Enough talking! Let's show what can be done in Adventure Mode..",
    ];
*/

/*
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
//*/