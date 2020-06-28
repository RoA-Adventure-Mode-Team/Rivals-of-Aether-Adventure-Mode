//

//print_debug("Init Time setting is "+string(get_match_setting(SET_TIMER)));
updated = 0;
_init = 0;

//Debug Vars
debug = true;
debug_info = true;
down_down = 0;
up_down = 0;
last_ID = 0;

cam_x_right = view_get_wview()+view_get_xview();
cam_y_right = view_get_hview()+view_get_yview();
cam_x_left = view_get_xview();
cam_y_left = view_get_yview();

debug_console = false;
debug_x = 650;
debug_y = 2;
debug_w = 300;
debug_h = 400;
debug_sp = 5;
debug_txt_w = 90;

debug_ex = debug_x+debug_w;
debug_ey = debug_y+debug_h;
debug_txt_y = debug_ey+debug_sp;
debug_txt_ey = debug_txt_y+debug_sp;
keyboard_string = "";
key_string_old = "";
console_parse = "";
console_output = "";
//Article Allocations:


//Quick Terrain (article1) //Parallax

//Custom Marker (article2)

//Scene Manager (article3) 
list_window = ds_list_create();
scene_manager = noone;

follow_player = noone;
with oPlayer {
    if !variable_instance_exists(self, "is_ai") other.follow_player = id;
}

//Area Triggers (article4)

//Room Manager (article5)
room_manager = noone;

//Enemies (article6)

//Camera Controller (article7)

//Room Transitions (article8)