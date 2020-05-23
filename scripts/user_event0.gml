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

//

//Scene Data Here

switch cur_room {
    case 1:
        scene_add(1,[
            [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_happy"), 6]], //window 0, animated sprite
            [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "Hello! Welcome to RoA Adventure Mode Update 3!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]], //window 1, textbox
            [400,800,3,[1,follow_player,20,[0,40]]], //window 3, camera control
            ],
            [TG_COMPLETE, 2, tutorial_default_scroll]);
        scene_add(2,[
            [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_idle"), 6]], //window 0, animated sprite
            [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "It's been a while since the last one - been busy with other projects on top of this one.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]], //window 1, textbox
            [400,800,3,[1,follow_player,20,[0,40]]], //window 3, camera control
            ],
            [TG_COMPLETE, 3, tutorial_default_scroll]);
        scene_add(3,[
            [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_estatic"), 6]], //window 0, animated sprite
            [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "And this one is taking some time due to the complexity of it! It's enemies!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]], //window 1, textbox
            [400,800,3,[1,follow_player,20,[0,40]]], //window 3, camera control
            ],
            [TG_COMPLETE, 4, tutorial_default_scroll]);
        scene_add(4,[
            [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_idle"), 6]], //window 0, animated sprite
            [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "It's Ou there, been programming them in as an example enemy. Let's switch control over and show what I've gotten done so far...", 680, tutorial_default_text_speed, asset_get("mfx_hp")]], //window 1, textbox
            [400,800,3,[1,follow_player,20,[0,40]]], //window 3, camera control
            ],
            [TG_COMPLETE, 5, tutorial_default_scroll]);
        scene_add(5,[
            [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_idle"), 6]], //window 0, animated sprite
            [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "Enemies right now have collision, attacks, ans control override. Still need to finish writing all the player states and the actual AI.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]], //window 1, textbox
            [400,800,3,[1,follow_player,20,[0,40]]], //window 3, camera control
            ],
            [TG_COMPLETE, 6, tutorial_default_scroll]);
        scene_add(6,[
            [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_sideglance"), 6]], //window 0, animated sprite
            [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "I've also refined quick terrain a bit, made collisions a bit better. There's some niche issues still with other configurations.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]], //window 1, textbox
            [400,800,3,[1,follow_player,20,[0,40]]], //window 3, camera control
            ],
            [TG_COMPLETE, 7, tutorial_default_scroll]);
        scene_add(7,[
            [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_idle"), 6]], //window 0, animated sprite
            [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "Since user_events now work, all custom code is running in there instead of in the scource scripts. A lot cleaner and less prone to messing up!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]], //window 1, textbox
            [400,800,3,[1,follow_player,20,[0,40]]], //window 3, camera control
            ],
            [TG_COMPLETE, 8, tutorial_default_scroll]);
        scene_add(8,[
            [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_estatic"), 6]], //window 0, animated sprite
            [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "Thank you to everyone who's been keeping up with the updates ~ I'm opening up a development discord so people can contribute to the project.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]], //window 1, textbox
            [400,800,3,[1,follow_player,20,[0,40]]], //window 3, camera control
            ],
            [TG_COMPLETE, 9, tutorial_default_scroll]);
        scene_add(9,[
            [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_sideglance"), 6]], //window 0, animated sprite
            [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "Even if you don't program, I recommend joining so you can get an early look at it and provide feedback to make it better and easier to use.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]], //window 1, textbox
            [400,800,3,[1,follow_player,20,[0,40]]], //window 3, camera control
            ],
            [TG_COMPLETE, 10, tutorial_default_scroll]);
        scene_add(10,[
            [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_happy"), 6]], //window 0, animated sprite
            [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "There should be an open invite below, if you have any questions/inqueries you can always DM me anywhere. - Archytas", 680, tutorial_default_text_speed, asset_get("mfx_hp")]], //window 1, textbox
            [400,800,3,[1,follow_player,20,[0,40]]], //window 3, camera control
            ],
            [TG_COMPLETE, 11, tutorial_default_scroll]);
        break;
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

