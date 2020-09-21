enum BT {
    ATTACK,
    SHIELD,
    ATTACK_SHIELD,
    TAUNT,
    START
}
enum WIN {
    HUD_TXT,
    HUD_SPR,
    OBJ_SPR,
    WLD_CAM,
    WLD_TXT,
    WLD_SPR,
    PLR_CTL
}

#macro TG_CUSTOM 69 //Run custom trigger code
#macro TG_COMPLETE 420 //Trigger upon 'completion' (defined per window type: Animation completion [> image_index], Full text display [vis_chars > full_text length])
#macro TG_BUTTON 2 //Triggers upon button press (any button, attack, shield, taunt, etc)
#macro TG_TIME 3 //Triggers after frame count


if  array_length_1d(array_scene_ID) == 0 reload_scenes(); //Scene initialization scripts
if cur_scene == 0 {
    switch_to_scene = 1;
}

if switch_to_scene != cur_scene scene_switch(switch_to_scene);

if ds_list_valid(list_window) user_event(2); //scene_custom_update();

if event_triggered event_trigger();

//Process the above
if ds_list_valid(list_window) {
    update_windows();
    update_scene();
}


#define scene_custom_trigger()

user_event(4);

#define event_trigger()
user_event(3);

event_triggered = false;
#define reload_scenes()
open_scene_id = 1;
cur_scene = 0;
cur_scene_time = 0;
cur_scene_time_end = 0;
cur_scene_complete = false;
array_scene_data = array_create(0);
array_scene_ID = array_create(0);
array_scene_triggers = array_create(0);

user_event(0);
//print_debug(string(array_scene_data));
#define instance_window(__x,__y,_content_type,_container)
var _vari;
while array_length_1d(_container) < 11 {
    array_push(_container,0);
}
switch _content_type {
    case WIN.HUD_TXT: //Textbox: container = [bg_sprite, bg_sprite_speed, font, text_full, scroll_speed, scroll_sound]
        var window_obj = {
            _x: __x,
            _y: __y,
            content_type: _content_type,
            bg_sprite_index: _container[0],
            bg_sprite_speed: _container[1],
            _in_x: _container[2],
            _in_y: _container[3],
            font: _container[4],
            text_full: _container[5],
            text_spacing: _container[6],
            scroll_speed: _container[7],
            scroll_sound: _container[8],
            bg_image_index: 0,
            vis_chars: 0,
            move_time: 30,
            move_timer: 0,
            move_type: 1,
            visibl: true,
            path: [__x,__y],
            init_pos: [__x,__y]
            
        };
        //_vari = [bg_image_index, vis_chars, visibl]
        break;
    case WIN.HUD_SPR: //Animated Sprite: container = [bg_sprite, bg_sprite_speed, _sprite_index, sprite_speed]
        var window_obj = {
            _x: __x,
            _y: __y,
            content_type: _content_type,
            bg_sprite_index: _container[0],
            bg_sprite_speed: _container[1],
            _in_x: _container[2],
            _in_y: _container[3],
            _sprite_index: _container[4],
            sprite_speed: _container[5],
            bg_image_index: _container[6],
            _image_index: _container[7],
            move_time: 30,
            move_timer: 0,
            move_type: 1,
            visibl: true,
            path: [__x,__y],
            init_pos: [__x,__y]
            
        };//_vari = [bg_image_index, _image_index, visibl]
        break;
    case WIN.OBJ_SPR: //Draw Sprite, synced with an object
        var window_obj = {
            _x: __x,
            _y: __y,
            content_type: _content_type,
            bg_sprite_index: _container[0],
            bg_sprite_speed: _container[1],
            _in_x: _container[2],
            _in_y: _container[3],
            _sprite_index: _container[4],
            sprite_speed: _container[5],
            obj_name: _container[6],
            synced: _container[7],
            bg_image_index: _container[8],
            _image_index: _container[9],
            move_time: 30,
            move_timer: 0,
            move_type: 1,
            visibl: true,
            path: [__x,__y],
            init_pos: [__x,__y]
        }; //_vari = [bg_image_index, _image_index, visibl]
        break;
    case WIN.WLD_CAM: //Camera Control
        var window_obj  = {
            _x: __x,
            _y: __y,
            content_type: _content_type,
            visibl: false,
            follow_type: _container[0],
            follow_var: _container[1], //Object, bounded or not, depends on follow_type
            move_speed: _container[2],
            cam_offset: _container[3]
        };
        break;
    case WIN.WLD_TXT: //World Drawn Textbox: container = [bg_sprite, bg_sprite_speed, font, text_full, scroll_speed, scroll_sound]
        var window_obj = {
            _x: __x,
            _y: __y,
            content_type: _content_type,
            bg_sprite_index: _container[0],
            bg_sprite_speed: _container[1],
            _in_x: _container[2],
            _in_y: _container[3],
            font: _container[4],
            text_full: _container[5],
            text_spacing: _container[6],
            scroll_speed: _container[7],
            scroll_sound: _container[8],
            bg_image_index: 0,
            vis_chars: 0,
            move_time: 30,
            move_timer: 0,
            move_type: 1,
            visibl: true,
            path: [__x,__y],
            init_pos: [__x,__y]
            
        };
        break;
    case WIN.WLD_SPR: //World Drawn Animated Sprite: container = [bg_sprite, bg_sprite_speed, _sprite_index, sprite_speed]
        var window_obj = {
            _x: __x,
            _y: __y,
            content_type: _content_type,
            bg_sprite_index: _container[0],
            bg_sprite_speed: _container[1],
            _in_x: _container[2],
            _in_y: _container[3],
            _sprite_index: _container[4],
            sprite_speed: _container[5],
            bg_image_index: _container[6],
            _image_index: _container[7],
            move_time: 30,
            move_timer: 0,
            move_type: 1,
            visibl: true,
            path: [__x,__y],
            init_pos: [__x,__y]
            
        };//_vari = [bg_image_index, _image_index, visibl]
        break;
    case WIN.PLR_CTL: //Control a player object
        var window_obj = {
            _x: __x,
            _y: __y,
            content_type: _content_type,
            player_obj: _container[0],
            state: _container[1],
            state_time: _container[2],
            window: _container[3],
            velocity: _container[4],
            sprite_overwrite: _container[5],
            sprite_speed: _container[6],
            sprite_index: _container[7]
        };
        break;
}

ds_list_add(list_window, window_obj);

#define update_windows()

if ds_list_size(list_window) > 0 {
    var i = 0;
    repeat ds_list_size(list_window) {
        if list_window[| i].visibl {
            list_window[| i].bg_image_index += 1/(list_window[| i].bg_sprite_speed); //Animate Background
            if list_window[| i].path[0] != list_window[| i]._x || list_window[| i].path[1] != list_window[| i]._y { //Movement
                switch list_window[| i].move_type {
                    case 0: //Linear
                        list_window[| i]._x = ease_linear(list_window[| i].init_pos[0],list_window[| i].path[0],list_window[| i].move_timer,list_window[| i].move_time);
                        list_window[| i]._y = ease_linear(list_window[| i].init_pos[1],list_window[| i].path[1],list_window[| i].move_timer,list_window[| i].move_time);
                        break;
                    case 1: //Schmoothfast
                        list_window[| i]._x = ease_expoInOut(list_window[| i].init_pos[0],list_window[| i].path[0],list_window[| i].move_timer,list_window[| i].move_time);
                        list_window[| i]._y = ease_expoInOut(list_window[| i].init_pos[1],list_window[| i].path[1],list_window[| i].move_timer,list_window[| i].move_time);
                        break;
                    case 2: //Schmoothslow
                        list_window[| i]._x = ease_quartInOut(list_window[| i].init_pos[0],list_window[| i].path[0],list_window[| i].move_timer,list_window[| i].move_time);
                        list_window[| i]._y = ease_quartInOut(list_window[| i].init_pos[1],list_window[| i].path[1],list_window[| i].move_timer,list_window[| i].move_time);
                        break;
                }
                if list_window[| i].move_time <= list_window[| i].move_timer {
                    list_window[| i]._x = list_window[| i].path[0];
                    list_window[| i]._y = list_window[| i].path[1];
                    list_window[| i].init_pos = list_window[| i].path;
                }
                list_window[| i].move_timer++;
            } else list_window[| i].move_timer = 0;
            switch list_window[| i].content_type { //Type-Specific updates when visible
                case WIN.HUD_TXT: //Textbox
                case WIN.WLD_TXT:
                    if floor(list_window[| i].vis_chars) < string_length(list_window[| i].text_full) {
                        if floor(list_window[| i].vis_chars) % 2 == 0 && floor(list_window[| i].vis_chars) != floor(list_window[| i].vis_chars + 1/(list_window[| i].scroll_speed)) sound_play(list_window[| i].scroll_sound);
                        list_window[| i].vis_chars += 1/(list_window[| i].scroll_speed);
                        
                    }
                    break;
                case WIN.HUD_SPR: //Animated Sprite 
                case WIN.WLD_SPR:
                    list_window[| i]._image_index += 1/(list_window[| i].sprite_speed);
                    break;
                case 2: //Sprite on Object
                    if list_window[| i].synced {
                        switch list_window[| i].obj_name {
                            case "cpu":
                                with oPlayer if player != other.player {
                                   other.list_window[| i]._x = x;
                                   other.list_window[| i]._y = y;
                                }
                                break;
                            default:
                                with list_window[| i].obj_name {
                                    other.list_window[| i]._x = x;
                                    other.list_window[| i]._y = y;
                                }
                                break;
                        }
                    }
            }
            
        }
        switch list_window[| i].content_type { //Type-Specific updates when invisible
            case WIN.WLD_CAM: //Camera Control
                cam_pos = [view_get_xview()+view_get_wview()/2+list_window[| i].cam_offset[0],view_get_yview()+view_get_hview()/2+list_window[| i].cam_offset[1]];
                if list_window[| i].follow_type == 1 { //follow specific object
                    set_view_position(
                        cam_pos[0] - list_window[| i].cam_offset[0] - (cam_pos[0] - list_window[| i].follow_var.x)/list_window[| i].move_speed,
                        cam_pos[1] - list_window[| i].cam_offset[1] - (cam_pos[1] - list_window[| i].follow_var.y)/list_window[| i].move_speed);
                } 
                if list_window[| i].follow_type == 2 { //Stay still, deathboxes
                    set_view_position(list_window[| i]._x,list_window[| i]._y);
                    with oPlayer {
                        if (x < view_get_xview()-other.cam_deathbox_bounds[0] ||
                        x > view_get_xview()+view_get_wview()+other.cam_deathbox_bounds[1] ||
                        y < view_get_yview()-other.cam_deathbox_bounds[2] ||
                        y > view_get_yview()+view_get_hview()+other.cam_deathbox_bounds[3]) create_deathbox(x,y,1,1,player,true, 1, 6, 0);
                    }
                }
                break;
        }
        i++;
    }
}

#define update_scene() //Updates scenes
var _scene_id_ind = array_find_index(array_scene_ID,cur_scene);
cur_scene_time++;

if cur_scene != 0 {
    switch array_scene_triggers[_scene_id_ind][0] { //Trigger types
        case TG_CUSTOM: //do nothing, lol
            scene_custom_trigger(); //Define custom trigger behavior here
            break;
        case TG_COMPLETE: //Trigger on all scene windows completing, and the cooldown time has passed.
            cur_scene_complete = false;
            if ds_list_size(list_window) > 0 { //Check here for now, save on execution
                var i = 0;
                cur_scene_complete = true;
                repeat ds_list_size(list_window) {
                    if cur_scene_complete {
                        switch list_window[| i].content_type {
                            case WIN.HUD_TXT: //Textbox
                            case WIN.WLD_TXT:
                                if floor(list_window[| i].vis_chars) < string_length(list_window[| i].text_full) cur_scene_complete = false;
                                break;
                            case WIN.HUD_SPR: //Animated Sprite
                            case WIN.WLD_SPR:
                                if list_window[| i]._image_index < sprite_get_number(list_window[| i]._sprite_index) cur_scene_complete = false;
                                break;
                        }
                    }
                    i++;
                }
            }
            if cur_scene_complete == true {
                cur_scene_time_end++;
                if cur_scene_time_end > array_scene_triggers[_scene_id_ind][2] {
                    if array_scene_triggers[_scene_id_ind][1] == -1 { //Switch Rooms
                        with obj_stage_article if num == 5 switch_to_room = other.array_scene_triggers[_scene_id_ind][3];
                   } else scene_switch(array_scene_triggers[_scene_id_ind][1]);
                }
            }
                
            break;
        case TG_BUTTON:
            switch array_scene_triggers[_scene_id_ind][2] {
                case BT.ATTACK_SHIELD:
                    if attack_down && shield_down scene_switch(array_scene_triggers[_scene_id_ind][1]);
                    break;
                case BT.TAUNT:
                    if taunt_down scene_switch(array_scene_triggers[_scene_id_ind][1]);
                    break;
            }
            break;
        case TG_TIME:
            if cur_scene_time > array_scene_triggers[_scene_id_ind][2] 
                scene_switch(array_scene_triggers[_scene_id_ind][1]);
            break;
    }
}

with obj_stage_article if num == 5 && other.cur_room != cur_room {
    other.cur_room = cur_room;
    /*with other {
        reload_scenes();
        scene_switch(1);
    }*/
}


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


#define scene_switch(_scene_id) //Switches the active scene
if debug print_debug("[SM] Switching to... "+string(_scene_id));
if _scene_id != cur_scene {
    cur_scene_time = 0;
    cur_scene_time_end = 0;
    var _scene_id_ind = array_find_index(array_scene_ID,_scene_id);
    if _scene_id_ind != -1 {
        var scene_id = array_scene_ID[_scene_id_ind];
        var scene_data =  array_scene_data[_scene_id_ind];
        
        ds_list_clear(list_window); //Clear active windows, add new ones
        cur_scene = _scene_id;
        for (var i = 0; i < array_length_1d(scene_data); i++) { 
            instance_window(scene_data[i][0],scene_data[i][1],scene_data[i][2],scene_data[i][3]);
        }
    
    } else { //Default to no scene
        ds_list_clear(list_window);
        cur_scene = 0;
    }
}
switch_to_scene = cur_scene;