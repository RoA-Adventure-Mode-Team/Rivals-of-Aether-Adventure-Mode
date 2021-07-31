// Load Action Data - Action Manager

//Enum & Macro Declarations, DO NOT EDIT

/*enum WIN {
    HUD_TXT,
    HUD_SPR,
    OBJ_SPR,
    WLD_CAM,
    WLD_TXT,
    WLD_SPR,
    PLR_CTL
}*/
//Update enums article3_update, draw_hud, and user_event0
enum LWO {
    TXT_HUD,
    TXT_WLD,
    CAM_WLD,
    SPR_HUD,
    SPR_WLD,
    PLR_CTL
}

enum ACT {
    DIALOG, //See draw scripts, depends on sub-objects
    //obj_type, x, y, l, h, bg_spr, bg_spr_speed, text_full, font, alignment, scroll_speedm, scroll_sound], 
    CAMERA, //Sets the camera to a specific point
    //action_time, x, y, focus_type, smooth 
    WINDOW, //Makes a hud window
    //window_num, x, y, [contentoverride]
    CONTROL, //Controls players
    //player_id, life_time, state_override, input_array
    SPRITE,
    
    WAIT, //waits
    //frames
    MUSIC, //set music
    //type, 1, 2
    SET, //Set article data
    //article_id, variable, value, ease_type, ease_length
    ON_INPUT, //Do a thing when a player presses a button
    //follow_player?, input_type
    SW_ROOM, //Switch the room
    //to_room, to_pos
    QUEST_PROG, //Quest-related actions
    //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
    SUS, //Suspend Action by ID
    //suspend_bool, action_id
    SPAWN_ART, //Spawn an article
    //cell, [room_format]
    CHECK, //End action upon the condition being true
    //article_group, variable, condition
}

enum P {
    LOAD,
    ROOM_ID,
    SCENE_ID,
    ACTION_ID,
    ALIVE_TIME,
    OBJECT,
    VISIBLE,
    DIE
}

enum L {
    ACTION_TYPE,
    PARAM,
    ON_EXIT
}

enum B {
    ATTACK,
    SPECIAL,
    JUMP,
    PARRY,
    TAUNT,
}

//Reset Arrays
action_array = [];
scene_array = [];
//
/*
action_add(1, 1, 4, ACT.CAMERA,
[],
[]);
*/
//Scene Data Here, please go sequentially

//Room 1: Topsoil
scene_add(1, 1, [1]);
action_add(1, 1, 1, ACT.WAIT,   //room_id, scene_id, action_id, action_type
[120],                          //Action arguments
[1]);                           //Actions to start on exit
action_add(1, 1, 2, ACT.SPAWN_ART,
[[0,0],[6, 84, 44, 0, -5, [4, 0, 0, 0, 0, 0, 0, 0], [0,0]]], //cell, [room_format]
[]); //Actions to start on exit
// action_add(1, 1, 2, ACT.WINDOW, 
// [0, 500, 20, []], //window_type, x, y, [contentoverride]
// []); //Actions to start on exit
// action_add(1, 1, 3, ACT.CONTROL, //ACT.CONTROL has Issues
// [30, all, PS_SPAWN], //life_time, player, state_override
// []); //Actions to start on exit
action_add(1, 1, 3, ACT.WAIT, //Preceeds on Input
[30], //follow_player?, input_type
[4]); //Actions to start on exit
action_add(1, 1, 4, ACT.SUS, 
[1, 5], //article_id, variable, value, ease_type?, ease_length?
[6]); //Actions to start on exit
action_add(1, 1, 5, ACT.WINDOW, 
[2, 200, 100, [[],["TOPSOIL VILLAGE"],[],["TOPSOIL VILLAGE"]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit
action_add(1, 1, 6, ACT.WAIT, //Archy Presentation
[600], //follow_player, input_type
[7]); //Actions to start on exit
action_add(1, 1, 7, ACT.SW_ROOM, 
[4], //to_room
[]); //Actions to start on exit

action_add(1, 1, 200, ACT.WINDOW, //Dialog Window Example
[6, 200, 100, []], //window_type, x, y, [contentoverride]
[]); //Actions to start on exit

action_add(1, 1, 201, ACT.WINDOW, //Quest Window
[5, 0, 120, []], //window_type, x, y, [contentoverride]
[]); //Actions to start on exit

action_add(1, 1, 202, ACT.QUEST_PROG, 
[3, 0, 1], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[203]); //Actions to start on exit

action_add(1, 1, 203, ACT.ON_INPUT, //Preceeds on Input
[0,PC_TAUNT_PRESSED], //follow_palyer?, input_type
[204,205]); //Actions to start on exit

action_add(1, 1, 204, ACT.QUEST_PROG, 
[3, 2, 1], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

action_add(1, 1, 205, ACT.ON_INPUT, //Preceeds on Input
[0,PC_ATTACK_PRESSED], //follow_palyer?, input_type
[206]); //Actions to start on exit

action_add(1, 1, 206, ACT.QUEST_PROG, 
[2, 0, 3], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit


/*action_add(1, 1, 200, ACT.ON_INPUT, //Archy Presentation
[0,PC_SHIELD_PRESSED], //follow_player?
[201]); //Actions to start on exit
action_add(1, 1, 201, ACT.WINDOW,
[4, 5540, 5460, [["Silouettes"]]],
[]); //Actions to start on exit
*/

//Room 3: Enemy Test

action_add(3, 1, 1, ACT.WINDOW, 
[2, 200, 100, [[],["ENEMY TEST"],[],["ENEMY TEST"]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//Room 4: Sewer
action_add(4, 1, 1, ACT.SET, 
[69, "bg_color", $999999, 0, 60], //article_id, variable, value, ease_type, ease_length
[2]); //Actions to start on exit
action_add(4, 1, 2, ACT.WINDOW,
[2, 200, 100, [[],["UNDERGROUND AQUEDUCT"],[],["UNDERGROUND AQUEDUCT"]]], //window_type, x, y, [contentoverride]
[]); //Actions to start on exit
action_add(4, 1, 3, ACT.SW_ROOM, 
[1], //player_id, life_time, state_override, ease_type, ease_value
[]); //Actions to start on exit

action_add(4, 1, 4, ACT.ON_INPUT, //Archy Presentation
[0,PC_TAUNT_PRESSED], //follow_player?
[5]); //Actions to start on exit
action_add(4, 1, 5, ACT.WINDOW,
[4, 5750, 8170, [["Dynamic Lighting"]]],
[6]); //Actions to start on exit

action_add(4, 1, 6, ACT.ON_INPUT, //Archy Presentation
[0,PC_TAUNT_PRESSED], //follow_player?
[7]); //Actions to start on exit
action_add(4, 1, 7, ACT.WINDOW,
[4, 6640, 8400, [["Particle Emitters"]]],
[]); //Actions to start on exit

action_add(4, 1, 8, ACT.WAIT, 
[120], //frames
[9]); //Actions to start on exit
action_add(4, 1, 9, ACT.WINDOW,
[4, 5368, 8162, [["Article Culling"]]],
[]); //Actions to start on exit



/*action_add(1, 1, 1, ACT.DIALOG, 
[LWO.TXT_HUD, 100, 200, 300, 50, -1, 0, "Dynamic Lighting Test", asset_get("roundFont"), -1, 0.2, -1], //obj_type, x, y, l, h, bg_spr, bg_spr_speed, text_full, font, alignment, scroll_speedm, scroll_sound], 
[2,2]); //Actions to start on exit
action_add(1, 1, 2, ACT.DIALOG, 
[LWO.TXT_HUD, 300, 300, 200, 50, -1, 0, "Test String2", asset_get("roundFont"), -1, 0.2, -1], //obj_type, x, y, l, h, bg_spr, bg_spr_speed, text_full, font, alignment, scroll_speedm, scroll_sound], 
[1]); //Actions to start on exit
action_add(1, 1, 3, ACT.DIALOG, 
[LWO.TXT_HUD, 300, 500, 200, 50, -1, 0, "Test String3", asset_get("roundFont"), -1, 0.2, -1], //obj_type, x, y, l, h, bg_spr, bg_spr_speed, text_full, font, alignment, scroll_speedm, scroll_sound], 
[4]); //Actions to start on exit
action_add(1, 1, 4, ACT.CAMERA,
[60, 500, 22, 0, 20],//action_time, x, y, focus_type, smooth 
[5]); //Actions to start on exit
action_add(1, 1, 5, ACT.CAMERA,
[60, 400, 50, 1, 20],//action_time, x, y, focus_type, smooth 
[]); //Actions to start on exit*/



//Quest Init
quest_add(2,1,"Test Quest2","This is a test quest also!",sprite_get("torch"));
quest_add(2,2,"Test Quest2.1","This is a test quest also also!",sprite_get("torch"));
quest_add(2,3,"Different Title!2.2","Completely different text again!",sprite_get("torch"));
quest_add(3,1,"Test Quest1.1","This is a test quest!",sprite_get("borgar"));
quest_add(3,2,"Test Quest1.2","This is a test quest! Part 2!",sprite_get("borgar"));
quest_add(3,3,"Different Title!1.3","Completely different text!",sprite_get("borgar"));



//Dialog Init

//1: Quick Test
dialog_add(1,1,["Hello! These are the default sprites...."]);
dialog_add(1,2,["...And Here's some Override!",sprite_get("face_default2")]);
dialog_add(1,3,["Wonder what happens here??"]);

//Functions DO NOT EDIT BELLOW
/*if debug {
    print_debug("LOADED ARRAYS:");
    print_debug(string(action_array));
    print_debug(string(scene_array));
}*/
#define action_add(_room_id, _scene_id, _action_id, _action_type, _param, _on_exit)
while _room_id >= array_length_1d(action_array) array_push(action_array, []);
while _scene_id >= array_length_1d(action_array[_room_id]) array_push(action_array[_room_id], []);
while _action_id >= array_length_1d(action_array[_room_id][_scene_id]) array_push(action_array[_room_id][_scene_id], []);
action_array[@_room_id][@_scene_id][@_action_id] = [_action_type, _param, _on_exit];
if debug print_debug("[AM] Action Loaded: "+string(_action_id));
return true;

#define scene_add(_room_id, _scene_id, _action_array)
while _room_id >= array_length_1d(scene_array) array_push(scene_array, []);
//print_debug(string(scene_array));
while _scene_id >= array_length_1d(scene_array[_room_id]) array_push(scene_array[_room_id], []);
scene_array[@_room_id][@_scene_id] = _action_array;
if debug print_debug("[AM] Scene Loaded: "+string(_scene_id));
return true;

#define quest_add(_id,_progress,_title,_description,_spr)
if quest_init return false;
if _progress == 0 {
    print("[AM:Q] ERROR: Do not override progress 0!");
    return false;
}
while _id >= array_length_1d(quest_array) array_push(quest_array,[]);
while _progress >= array_length_1d(quest_array[_id]) array_push(quest_array[_id],[]);
quest_array[@_id][@0] = noone;//Save quest progress here
quest_array[@_id][@_progress] = [_title,_description,_spr];
if debug print_debug("[AM] Quest Edited: "+string(_id)+" : "+string(_progress));
return true;

#define dialog_add(_id,_progress,_data) //Dialog Data: [string,_text_sprite_face_override,_sprite_bg_override]
//Response Map: [[_text,_to_prog,_dialog_override]...]
if _progress == 0 {
    print("[AM:D] ERROR: Do not override progress 0!");
    return false;
}
while _id >= array_length_1d(dialog_array) array_push(dialog_array,[]);
while _progress >= array_length_1d(dialog_array[_id]) array_push(dialog_array[_id],[]);
dialog_array[@_id][@0] = noone; //Save dialog progress
dialog_array[@_id][@_progress] = _data; //Save dialog progress
return true;

// #define control(_dir,_but)
// return [_dir,_but];
//Global Scenes

/*scene_add(1,[
    [2,2, 1, [sprite_get("dialog_border"), 6, -16, -16, sprite_get("squdia_idle"), 6]], //window 0, animated sprite
    [150,2, 0, [asset_get("empty_sprite"), 6, 20, 16, "roundFont", "Shabadap bo bop!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    //[TG_COMPLETE, 2,  tutorial_default_scroll]);
    [TG_COMPLETE, -1,  999999999999999]);

scene_add(2,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_estatic"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "It's been a hot minute, but a lot of work has been done and discoveries made!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 3, tutorial_default_scroll]);
scene_add(3,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_idle"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "We have a debug console now - with custom commands that can be added pretty quickly!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 4, tutorial_default_scroll]);
scene_add(4,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_idle"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "It let's you set variables, toggle/change debug information, etc.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 5, tutorial_default_scroll]);
scene_add(5,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_idle"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "For example, we can switch scenes pretty easily...", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    //[TG_COMPLETE, 6, tutorial_default_scroll]);
    [TG_COMPLETE, -1,  999999999999999]);
scene_add(6,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_happy"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "We also discovered that precise collision on articles is possible!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 7, tutorial_default_scroll*2]);
scene_add(7,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_sideglance"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "It works pretty well for solid articles, but platforms have issues.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 8, tutorial_default_scroll]);
scene_add(8,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_happy"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "This still means that we can make it easier on every front AND save processing resources.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 9, tutorial_default_scroll]);
scene_add(9,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_sideglance"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "We've also been working on the example level. But, I want to keep that a secret until we're ready.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 10, tutorial_default_scroll]);
scene_add(10,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_estatic"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "@CptTechnicality in the background has been working on the tools - can't wait to show it off!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 11, tutorial_default_scroll]);
scene_add(11,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_estatic"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "We plan on getting the engine finished and enter the beta phase soon! - Archytas", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 12, tutorial_default_scroll]);*/
    
/*switch cur_room { //Room Specific Scenes
    case 1:
        scene_add(1,[],[TG_COMPLETE, -1,  999999999999999]);
        scene_add(2,[
            [300,400, 1, [sprite_get("dialog_borderbg"), 6, 0, 0, sprite_get("squdia_flap"), 8]], //window 0, animated sprite
            [300,400, 1, [sprite_get("dialog_border"), 6, 0, 0, asset_get("empty_sprite"), 8]], //window 0, animated sprite
            [300+64,400, 0, [sprite_get("dialog_text"), 6, 12, 4, "roundFont", "Hmmm... "+player_name+" is it? I've got something you can help me with...", 300, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
            ],
            [TG_COMPLETE, 3,  tutorial_default_scroll]);
            //[TG_COMPLETE, 2,  999999999999999]);
        scene_add(3,[
            [300,400, 1, [sprite_get("dialog_borderbg"), 6, 0, 0, sprite_get("squdia_hap"), 8]], //window 0, animated sprite
            [300,400, 1, [sprite_get("dialog_border"), 6, 0, 0, asset_get("empty_sprite"), 8]], //window 0, animated sprite
            [300+64,400, 0, [sprite_get("dialog_text"), 6, 12, 4, "roundFont", "I forgot my lunch in my house to the right. Could you go fetch it?", 300, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
            ],
            [TG_COMPLETE, 4,  tutorial_default_scroll]);
        scene_add(4,[
            [300,400, 1, [sprite_get("dialog_borderbg"), 6, 0, 0, sprite_get("squdia_flap"), 8]], //window 0, animated sprite
            [300,400, 1, [sprite_get("dialog_border"), 6, 0, 0, asset_get("empty_sprite"), 8]], //window 0, animated sprite
            [300+64,400, 0, [sprite_get("dialog_text"), 6, 12, 4, "roundFont", "I've got a stall to run! Chop Chop!", 300, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
            ],
            [TG_COMPLETE, 5,  tutorial_default_scroll]);
        break;
    case 2:
        scene_add(1,[],[TG_COMPLETE, -1,  999999999999999]);
    case -1:
        break;
}*/

//

//DO NOT EDIT BELOW


/*
################################################################################
CHEAT SHEET
################################################################################


#############
scene_add(scene_id, [window_data], [trigger_data]);
scene_id: The unique numerical ID of the scene.

window_data: The initialization data of each window in the scene, in order. Instanced as window 0, 1, 2, etc.
    [x,y,content_type, [window_arguments]]

trigger_data: The data that determines when the current scene transitions to the provided.
    [trigger_type, next_scene, delay/extra arguments]
    macros:
        TG_CUSTOM //Run custom trigger code
        TG_COMPLETE //Trigger upon 'completion' (defined per window type: Animation completion [> image_index], Full text display [vis_chars > full_text length])
        TG_BUTTON //Triggers upon button press (any button, attack, shield, taunt, etc)
        TG_TIME //Triggers after a frame count

#############
SCENE WINDOW VARIABLES
default values are shown after a ':'. 
[#] means the array argument index in the last argument of windows.

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

Camera Controller: *USE ONLY IN CUTSCENES*
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
/*#define scene_add(_scene_id, scene_data, scene_triggers) //Adds a new scene to the scenespace
var _scene_id_ind = array_find_index(array_scene_ID,_scene_id);
if _scene_id_ind == -1 {
    array_push(array_scene_data,scene_data);
    array_push(array_scene_ID, _scene_id);
    array_push(array_scene_triggers,scene_triggers);
    open_scene_id++;
} else {
    array_scene_data[_scene_id_ind] = scene_data;
    array_scene_ID[_scene_id_ind] = _scene_id;
    array_scene_triggers[_scene_id_ind] = scene_triggers;
}*/

