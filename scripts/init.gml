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
game_end = false;

cam_x_right = view_get_wview()+view_get_xview();
cam_y_right = view_get_hview()+view_get_yview();
cam_x_left = view_get_xview();
cam_y_left = view_get_yview();

cam_state = 0;
cam_smooth = 5;
g_cam_pos = [cam_x_left,cam_y_left];
cam_offset = [0,-96];
cam_vel_influence = 30;

game_paused = false;
counter = 0;


debug_console = false;
debug_x = 650;
debug_y = 2;
debug_w = 300;
debug_h = 400;
debug_sp = 5;
debug_txt_w = 90;
debug_toggle = false;

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
is_online = false;
player_num = 0;
/*with oPlayer {
    if get_player_hud_color(player) == 15297156 {
        other.is_online = true;
        break;
    }
    if (!variable_instance_exists(self, "is_ai") || !is_ai) && is_player_on(player) other.follow_player = id;
    other.player_num++;
}
if is_online {
    player_num = 0;
    with oPlayer {
        if get_player_hud_color(player) == 15297156 other.follow_player = id;
        other.player_num++;
    }
}*/
/*with oPlayer if is_player_on(player) {
    if get_player_hud_color(player) == 15297156 {
        local_player = -1; //Flag for setting
        other.is_online = true;
    }
    //if get_player_hud_color(player) == 6612290 other.local_player = id;
    other.player_count++;
}*/
with oPlayer if other.follow_player == noone && (!variable_instance_exists(self, "is_ai") || !is_ai) && is_player_on(player) other.follow_player = id;

//Area Triggers (article4)

//Room Manager (article5)
room_manager = noone;

//Enemies (article6)
active_bosses = ds_list_create();
death_left = 100;
death_up = 100;
death_right = 100;
death_down = 100;

//Camera Controller (article7)

//Room Transitions (article8)

room_width = 10000;
room_height = 10000;

//Window API Init
win_data = [];
active_win = [];

//cursor_sprite = sprite_get("arrow");
cursor_sprite_i = sprite_get("arrow");
cursor_index = 0;
cursor_visible = false; //Change to true for debug
mb_l_click = false;
mouse_x_i = mouse_x;
mouse_y_i = mouse_y;

//Window Variables
//Textboxes
tb_title_offset_x = 4;
tb_title_offset_y = 3;
tb_str_offset_x = 4;
tb_str_offset_y = 19;
tb_bar_x = 128*2;
tb_bar_y = 56*2;
//Title
title_x_stop = 100;
//

//Command Entering
eb_bar_x = 128*2;
eb_bar_y = 56*2;

mouse_buffer = 16;
cursor_x_p = 0;
cursor_y_p = 0;
cursor_x = mouse_x - view_get_xview();
cursor_y = mouse_y - view_get_yview();
win_drag = -1;
win_active = -1;
active_thick = 4;
//

win_call = 1;
user_event(2);