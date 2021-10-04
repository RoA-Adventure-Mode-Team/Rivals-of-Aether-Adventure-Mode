//Custom Scene Update - Scene Manager










/*
switch cur_room {
    case 1:
        switch cur_scene {
            case 2:
            case 3:
            case 4:
                //if cur_scene_time == 2 with follow_player {
                freeze_players();
                //print_debug(string(list_window[| 2].text_full));
                if list_window[| 2].vis_chars == string_length(list_window[| 2].text_full) list_window[| 0]._sprite_index = sprite_get("squdia_idle");
                //else list_window[| 0]._sprite_index = sprite_get("squdia_flap");
                break;
            /*case 1:
                if cur_scene_time == 2 list_window[| 0].path = [50,400];
                if cur_scene_time == 5 list_window[| 1].path = [150,400];
                if cur_scene_time < 30 list_window[| 1].vis_chars = 0;
                break;*/
            /*case 4:
                follow_player.initial_dash_speed = 40;
                follow_player.dash_speed = 40;
                follow_player.air_max_speed = 40;
                follow_player.leave_ground_max = 40;
                follow_player.air_accel= 1;
                break;
                
        }
        break;
}
*/
/*
with oPlayer {
    if attack_down && shield_down && other.cur_room == 1 with other {
        room_switch(2);
    }
    if taunt_down && other.cur_room == 2 with other room_switch(1);
}*/
//

/*
################################################################################
CHEAT SHEET
################################################################################

#############
USEFUL SCENE VARIABLES

cur_room: The current active room.
cur_scene: the current active scene.
cur_scene_time: The current frame count into the scene.
list_window[| i]: The list of window objects, with i being the index of the window in the scene (load order)
for all other variables, see article3_init.
#############

#############
SCENE WINDOW VARIABLES
default values are shown after a ':'. 
[#] means it can be initialized via scene_add in the load script (user_event9)

HUD Textbox:
    _x,
    _y,
    content_type,
    bg_sprite_index: [0],
    bg_sprite_speed: [1],
    _in_x: [2],
    _in_y: [3],
    font: [4],
    text_full: [5],
    text_spacing: [6],
    scroll_speed: [7],
    scroll_sound: [8],
    bg_image_index,
    vis_chars: 0,
    move_time: 30,
    move_timer: 0,
    move_type: 1,
    visibl: true,
    path: [_x,_y],
    init_pos: [_x,_y]
    
HUD Sprite:
    _x:,
    _y:,
    content_type,
    bg_sprite_index: [0],
    bg_sprite_speed: [1],
    _in_x: [2],
    _in_y: [3],
    _sprite_index: [4],
    sprite_speed: [5],
    bg_image_index: [6],
    _image_index: [7],
    move_time: 30,
    move_timer: 0,
    move_type: 1,
    visibl: true,
    path: [x,y],
    init_pos: [x,y]
    
Draw Sprite, Synced with an object:
    _x,
    _y,
    content_type,
    bg_sprite_index: [0],
    bg_sprite_speed: [1],
    _in_x: [2],
    _in_y: [3],
    _sprite_index: [4],
    sprite_speed: [5],
    obj_name: [6],
    synced: [7],
    bg_image_index: [8],
    _image_index: [9],
    move_time: 30,
    move_timer: 0,
    move_type: 1,
    visibl: true,
    path: [x,y],
    init_pos: [x,y]

Camera Controller:
    _x: __x,
    _y: __y,
    content_type,
    visibl: false, //Keep false, nothing to draw
    follow_type: [0],
    follow_var: [1], //Object, bounded or not, depends on follow_type
    move_speed: [2],
    cam_offset: [3]
    
World Drawn Textbox:
    _x,
    _y,
    content_type,
    bg_sprite_index: [0],
    bg_sprite_speed: [1],
    _in_x: [2],
    _in_y: [3],
    font: [4],
    text_full: [5],
    text_spacing: [6],
    scroll_speed: [7],
    scroll_sound: [8],
    bg_image_index: 0,
    vis_chars: 0,
    move_time: 30,
    move_timer: 0,
    move_type: 1,
    visibl: true,
    path: [x,y],
    init_pos: [x,y]
    
World Drawn Animated Sprite: 
    _x,
    _y,
    content_type,
    bg_sprite_index: [0],
    bg_sprite_speed: [1],
    _in_x: [2],
    _in_y: [3],
    _sprite_index: [4],
    sprite_speed: [5],
    bg_image_index: [6],
    _image_index: [7],
    move_time: 30,
    move_timer: 0,
    move_type: 1,
    visibl: true,
    path: [x,y],
    init_pos: [x,y]
#############
*/
//DO NOT EDIT BELOW
// #define scene_switch(_scene_id)
// with obj_stage_article if num == 3 switch_to_scene = _scene_id;
// #define room_switch(_room_id)
// with obj_stage_article if num == 5 switch_to_room = _room_id;
// #define freeze_players()
// with oPlayer {
//     clear_button_buffer(PC_LEFT_HARD_PRESSED);
// 	clear_button_buffer(PC_RIGHT_HARD_PRESSED);
// 	clear_button_buffer(PC_UP_HARD_PRESSED);
// 	clear_button_buffer(PC_DOWN_HARD_PRESSED);
// 	clear_button_buffer(PC_LEFT_STRONG_PRESSED);
// 	clear_button_buffer(PC_RIGHT_STRONG_PRESSED);
// 	clear_button_buffer(PC_UP_STRONG_PRESSED);
// 	clear_button_buffer(PC_DOWN_STRONG_PRESSED);
// 	clear_button_buffer(PC_LEFT_STICK_PRESSED);
// 	clear_button_buffer(PC_RIGHT_STICK_PRESSED);
// 	clear_button_buffer(PC_UP_STICK_PRESSED);
// 	clear_button_buffer(PC_DOWN_STICK_PRESSED);
// 	clear_button_buffer(PC_JUMP_PRESSED);
// 	clear_button_buffer(PC_ATTACK_PRESSED);
// 	clear_button_buffer(PC_SHIELD_PRESSED);
// 	clear_button_buffer(PC_SPECIAL_PRESSED);
// 	clear_button_buffer(PC_STRONG_PRESSED);
// 	clear_button_buffer(PC_TAUNT_PRESSED);
// }