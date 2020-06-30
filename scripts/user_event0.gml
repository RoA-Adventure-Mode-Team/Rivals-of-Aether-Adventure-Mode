// Load Scene Data - Scene Manager

//Enum & Macro Declarations, DO NOT EDIT
enum BT {
    ATTACK,
    SHIELD,
    ATTACK_SHIELD,
    TAUNT,
    START
}
enum WIN {
    HUD_TXT, //HUD Text Object
    HUD_SPR, //HUD Sprite Object
    OBJ_SPR, //Sprite on an Object
    WLD_CAM, //World Camera
    WLD_TXT, //World Text
    WLD_SPR  //World Sprites
}

#macro TG_CUSTOM 69 //Run custom trigger code
#macro TG_COMPLETE 420 //Trigger upon 'completion' (defined per window type: Animation completion [> image_index], Full text display [vis_chars > full_text length])
#macro TG_BUTTON 2 //Triggers upon button press (any button, attack, shield, taunt, etc)
#macro TG_TIME 3 //Triggers after frame count


//Scene Data Here

//Global Scenes
scene_add(1,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_happy"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "Hello! Welcome to RoA Adventure Mode Update 7!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
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
    [TG_COMPLETE, 12, tutorial_default_scroll]);
    
switch cur_room { //Room Specific Scenes
    case 1:
        
        break;
    /*case 1:
        scene_add(1,[
            [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "SCROLLING ROOM TEST", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 0, textbox
            //[400,800,3,[0,follow_player,20,[0,40]]], //window 1, camera control
            ],
            [TG_CUSTOM, 2, tutorial_default_scroll]);
        break;*/
}

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
#define scene_add(_scene_id, scene_data, scene_triggers) //Adds a new scene to the scenespace
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
}

