//draw_hud - the x position of your HUD element is 48*(i-1)
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
    SPRITE,
    
    WAIT,
    
    SET
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

// with oPlayer if state == PS_RESPAWN print("[draw_hud] started check");

//draw_set_font(asset_get("medFont"));
//draw_text_trans_outline(temp_x,temp_y,"TEST FONT",10,1000,1,1,0,c_white,c_black,1);
//draw_debug_text(temp_x-200,temp_y-470,string(cur_scene));
//draw_debug_text(temp_x-200,temp_y-430,string(cur_scene_time));
//draw_debug_text(temp_x-200,temp_y-400,string(cur_scene_time_end));
//draw_debug_text(temp_x,temp_y-420,string(move_timer));
//draw_debug_text(temp_x,temp_y-400,string(list_window[| 0].path));
//draw_debug_text(temp_x,temp_y-380,string(array_scene_data));


draw_set_alpha(1);

//draw_debug_text(16,16,string(get_window_value(AT_JAB,1,AG_WINDOW_LENGTH)));

//draw_debug_text(32,2,string(object_index));
var xx = view_get_wview()/2;
var yy = 30;
/*draw_set_font(asset_get("roaLBLFont"));
draw_set_halign(fa_left);*/

//array_room_data[1][0][1][0][6][0] = 100;

/*with oPlayer {
    draw_debug_text(2,128, string(get_state_name(state)));
}*/

/*with oPlayer {
	with other.room_manager {
		if instance_exists(other.temp_pause) {
			paused = true;
			set_view_position(follow_point.x,follow_point.y);
		} else paused = false;
	}
}*/




//with scene_manager draw_windows();
draw_boss_healthbar();
/*
with obj_stage_article {
	if num == 1 && static {
		depth = -2;
		draw_sprite_ext(sprite_index,0,0,0,2,2,0,c_white,1);
	}
}
*/
//Debug Info
if debug {
    draw_set_alpha(.7);
    draw_rectangle_color(0,0,350,110,c_black,c_black,c_black,c_black,c_black);
    draw_set_alpha(1);
    draw_debug_text(2,0,"FPS: "+string(fps));
    var _count = 0;
    // with action_manager {
    // 	for (var _i = 0; _i < array_length_1d(cur_actions); _i++)
    // 	{
    // 		if cur_actions[_i][1] == room_id && cur_actions[_i][2] == scene_id _count++;
    // 	}
    // 	draw_debug_text(2,16,"ACT: "+string(_count));
    // }
    with action_manager draw_debug_text(2,16,"ACT: "+string(array_length_1d(cur_actions)));
    draw_debug_text(2,32,"WIN: "+string(array_length_1d(active_win)));
    // var _count = 0;
    with obj_stage_article _count++;
    with obj_stage_article_platform _count++;
    with obj_stage_article_solid _count++;
    draw_debug_text(2,32+16,"ART: "+string(_count));
    with room_manager {
    	//print_debug(string(follow_point));
        p_true_pos = real_to_grid([follow_player.x,follow_player.y]);
        p_cell_pos = grid_to_cell(p_true_pos);
        //draw_debug_text(2,16,"CAM POS: "+string(true_pos));
        //draw_debug_text(2,32,"CELL POS: "+string(cell_pos));
        //draw_debug_text(2,48,"POS IN CELL: "+string([floor((pos_in_cell[0])/16),floor((pos_in_cell[1])/16)]));
        draw_debug_text(2,64,"PLAYER POS: "+"R: "+string(cur_room)+" S: "+string(action_manager.cur_scene[0])+" ["+string(p_cell_pos[1][0])+","+string(p_cell_pos[1][1])+"]:["+string(floor((p_cell_pos[0][0])/16))+","+string(floor((p_cell_pos[0][1])/16))+"]:["+string((p_cell_pos[0][0]) % 16)+","+string((p_cell_pos[0][1]) % 16)+"]");
        //debug
        
    }
    //draw_circle_color(view_get_wview()/2,view_get_hview()/2,4,c_red,c_red,false);
    draw_circle_color(follow_player.x-view_get_xview(),follow_player.y-view_get_yview(),4,c_red,c_red,false);
    
    // with action_manager draw_debug_text(100,96,string(suspened_actions));
}
//Room Swap effects
with room_manager {
    //if other.game_end set_view_position(init_cam_pos[0],init_cam_pos[1]);
    switch room_switch_type {
        case 1: //Fade Out/In
    		if room_switch_timer < room_switch_time/2 {
    			draw_rectangle_color(0,0,960,540*room_switch_timer/(room_switch_time/2),c_black,c_black,c_black,c_black,c_black);
    			// music_fade((room_switch_timer-(room_switch_time/2))/(room_switch_time/2),0.5);
    		}
    		if room_switch_timer >= room_switch_time/2 {
    			draw_rectangle_color(0,540*(room_switch_timer-(room_switch_time/2))/(room_switch_time/2),960,540,c_black,c_black,c_black,c_black,c_black);
				// music_fade(room_switch_timer/(room_switch_time/2),0.5);
				
    		}
    		break;
    	case 2:
    	    draw_sprite_ext(sprite_get("1px"),0,0,0,960,540,0,c_black,-abs(room_switch_timer-(room_switch_time/2))/(room_switch_time/2)+1);
    	    music_set_volume(abs(room_switch_timer*2-room_switch_time)/room_switch_time);
    	    break;
    	case 3:
    	    draw_sprite_ext(sprite_get("1px"),0,0,0,960,540,0,c_black,-abs(room_switch_timer-(room_switch_time_long/2))/(room_switch_time_long/2)+1);
    	   music_set_volume(abs(room_switch_timer*2-room_switch_time_long)/room_switch_time_long);
    	    break;
    }
}

if string_count("`",keyboard_string) {
	cmd_toggle = !cmd_toggle;
	if cmd_toggle {
		keyboard_string = "";
		array_push(active_win,[[cmd_x,cmd_y,noone,0],array_clone_seriously_why_isnt_this_how_it_works(win_data[0])]);
		win_active = array_length_1d(active_win)-1;
		active_win[@win_active][@1][@3][@1] = cmd_output;
	}
}

// if debug_console { //debug_console_update();
//     //#define debug_console_update();
//     draw_set_alpha(.5);
//     draw_rectangle_color(debug_x,debug_y,debug_ex,debug_ey,c_black,c_black,c_black,c_black,c_black);
//     draw_rectangle_color(debug_x,debug_txt_y,debug_ex,debug_txt_y+20,c_black,c_black,c_black,c_black,c_black);
    
//     draw_set_alpha(1);
//     draw_set_font(asset_get("fName"));
//     draw_text_transformed(debug_x,debug_txt_ey,keyboard_string,1,1,0);
//     draw_text_transformed(debug_x,-10,console_output,1,1,0);
//     if follow_player.attack_down && follow_player.attack_held == 1 {
//         console_parse = string_parse(keyboard_string, " ");
//         key_string_old = keyboard_string;
//         keyboard_string = "";
//         //print_debug(string(console_parse));
//         if console_parse != [] console_command(console_parse);
        
//     }
// }

// if debug_toggle != get_match_setting(SET_HITBOX_VIS) {
//     console_command(["debug",get_match_setting(SET_HITBOX_VIS)]);
//     debug_toggle = get_match_setting(SET_HITBOX_VIS);
// }

win_call = 0;
user_event(2); //Cursor and Window Draw

if debug draw_debug_text(430-floor(string_length("AM ALPHA "+string(am_vers))/2),0,"AM ALPHA "+string(am_vers)); 

// with oPlayer if state == PS_RESPAWN {
// 	print("[draw_hud] completed check");
// 	// set_state(PS_IDLE);
// }


//user_event(); //Draw Endscreen
// #define draw_scene() //Drawing HUD
// //gpu_set_blendmode(bm_add); //Reduce draw lag?
// var actions_load = [];
// var _param = 0;
// var alive_time = 0;
// with scene_manager {
// 	for (var i = 0; i < array_length_1d(cur_actions); i++) {
// 		//print_debug("CATCH THIS");
// 		actions_load = cur_actions[i][P.LOAD];
// 		//var _param = actions_load[L.PARAM];
// 		_param =  actions_load[L.PARAM];
// 		alive_time = cur_actions[i][P.ALIVE_TIME];
// 		switch actions_load[L.ACTION_TYPE] {
// 			case ACT.DIALOG:
// 				switch _param[0] { //obj_type, x, y, l, h, bg_spr, bg_spr_speed, text_full, font, alignment, scroll_speed, scroll_sound], 
// 					case LWO.TXT_HUD: 
// 						if _param[5] != -1 draw_sprite_ext(_param[5], alive_time * _param[6], _param[1], _param[2], 1, 1, 0, c_white, 1);
// 						//draw_set_color(c_white);
// 						draw_set_font(_param[8]);
// 						draw_text_ext_transformed(_param[1], _param[2], string_copy(_param[7], 0, floor(alive_time * _param[10])), 16, _param[3], 1, 1, 0);
// 						if _param[11] != -1 && alive_time * _param[10] == floor(alive_time * _param[10]) sound_play(_param[11]);
// 						//draw_text_trans_outline(_param[1], _param[2], _param[7], 16, _param[3], 1, 1, 0, c_white, c_black, 1);
// 						break; 
// 					case LWO.SPR_HUD: //obj_type, x, y, l, h, bg_spr, bg_spr_speed, spr, spr_speed], 
// 						//It's generally more efficient to just use a SPRITE object, but it's here for standardization
// 						if _param[5] != -1 draw_sprite_ext(_param[5], alive_time * _param[6], _param[1], _param[2], 1, 1, 0, c_white, 1);
// 						if _param[7] != -1 draw_sprite_ext(_param[7], alive_time * _param[8], _param[1], _param[2], 1, 1, 0, c_white, 1);
// 						break;
// 				}
// 				break;
// 			/*case ACT.SPRITE: //spr, x, y, spr_speed, alpha
// 				draw_sprite_ext(_param[0],sprite_get_number(_param[0])*alive_time*_param[3],_param[1],_param[2],1,1,0,c_white,_param[4]);
// 				break;*/
// 		}
// 	}
// }
// //gpu_set_blendmode(bm_normal);
// return true;

// #define console_command(_console_parse)
// switch _console_parse[0] {
//     case "debug":
//         debug = !debug;
//         var _debug = debug;
//         with obj_stage_article_solid debug = _debug;
//         with obj_stage_article_platform debug = _debug;
//         with obj_stage_article debug = _debug;
//         break;
//     case "set":
//         if _console_parse[1] in self && _console_parse[2] in variable_instance_get(self,_console_parse[1]) {
//             variable_instance_set(variable_instance_get(self,_console_parse[1]),_console_parse[2], _console_parse[3]);
//             print_to_console("SET "+_console_parse[2]+" IN "+_console_parse[1]+" TO "+_console_parse[3]);
//         } else print_to_console("UNKNOWN SET");
//         break;
//     case "kill":
//         //var _with_foder = noone;
//         if array_length_1d(_console_parse) < 2 with follow_player create_deathbox(x,y,10,10,player,1,1,3,0);
//         else {
//             switch _console_parse[1] {
//                 case "enemies":
//                     with obj_stage_article if num == 6 create_deathbox(x,y,10,10,-1,1,1,3,0);
//                     break;
//                 case "players":
//                     with oPlayer create_deathbox(x,y,10,10,-1,1,1,3,0);
//                     break;
//             }
//         }
//         break;
//     case "instances":
//         var _str = "";
//         with asset_get(_console_parse[1]) {
//             if !("num" in self) || num == _console_parse[2] _str += string(id)+", ";
//         }
//         print_to_console(_str);
//         break;
//     case "help":
//         print_to_console("COMMAND LIST:
//     color [article] [color] -
//     set the debug color of an article.
//     debug [article] - 
//     toggle debug info for an 
//     article type. 
//     help - show this message.
//     kill ['' || 'players' || 'enemies'] -
//     kill self, players, or enemies
//     set [instance] [variable] [value] - 
//     set a variable to a value in 
//     a named instance.
//     instances [article] [num] - 
//     list the instances of an article.
    
//     room/scene [id] - 
//     set the current room/scene to id.");
//         break;
//     case "color":
//         if string_digits(_console_parse[1]) != "" {
//             with obj_stage_article_solid if num == real(_console_parse[1]) debug_color = _console_parse[2];
//             with obj_stage_article_platform if num == real(_console_parse[1]) debug_color = _console_parse[2];
//             with obj_stage_article if num == real(_console_parse[1]) debug_color = _console_parse[2];
//             print_to_console("NEW ARTICLE COLOR: "+_console_parse[2]);
//         } else print_to_console("UNKNOWN ARGUMENTS");
        
//         break;
//     case "room":
//         if string_digits(_console_parse[1]) != "" {
//             with obj_stage_article if num == 5 switch_to_room = real(_console_parse[1]);
//         }
//         break;
//     case "scene":
//         if string_digits(_console_parse[1]) != "" {
//             with obj_stage_article if num == 3 switch_to_scene = real(_console_parse[1]);
//         }
//         break;
//     case "":
//         break;
//     default:
//         print_to_console("UNKNOWN COMMAND");
//         break;
// }

// #define print_to_console(_str)
// console_output = console_output + "
// > " + key_string_old + "
// : " + _str;
// if string_height(console_output) > debug_ey {
//     console_output = string_copy(console_output,string_pos("
// : ",console_output)+1,string_length(console_output));
// }


#define string_parse(_str,_delim) // BECAUSE THIS ISN'T DEFAULT FOR SOME REASON
_str = string_lower(_str); //Not case-sensitive
var _consol_parse = array_create(0);
var j = 1;
var k = 0;
for (var i = 0; i < string_length(_str);i++) {
    if string_char_at(_str,i) == _delim {
        _consol_parse[k] = string_copy(_str,j,i-j);
        j = i+1;
        k++;
    }
}
_consol_parse[k] = string_copy(_str,j,i-j+1);

return _consol_parse;

#define draw_boss_healthbar()
var i = 0;

repeat ds_list_size(active_bosses) {
    var boss = active_bosses[| i];
    var hbar_x = view_get_wview() / 2;
    var hbar_y = -80;
    var hbar_yoff = 52 * i;
    var hbar_fill = 0;
    var hbar_color = c_white;
    var show_percent = true;
    var hbar_percent = 0;
    var hbar_shake_x = 0;
    var hbar_shake_y = 0;
    
    with (boss) {
    	if !show_healthbar continue;
        hbar_color = char_hud_color;
        show_percent = hitpoints_max <= 0;
        hbar_percent = percent;
        
        if (show_percent)
            hbar_yoff = 68 * i;
        
        if (hitstun > 15 && hitpause > 0) {
            hbar_shake_x = round(-2 + random_func(1, 4, true) / 2) * 2;
            hbar_shake_y = round(-2 + random_func(1, 4, true) / 2) * 2;
        }
        switch(battle_state) {
            case 0:
                hbar_y = -80;
                hbar_fill = 0;
            break;
            
            case 1:
                if (show_healthbar) {
                    if (battle_state_timer <= 30)
                        hbar_y = lerp(-80, 24 + hbar_yoff, battle_state_timer / 30);
                    else
                        hbar_y = 24 + hbar_yoff;
                    if (boss_healthbar_timer > 0) {
                        if (boss_healthbar_timer < 56) 
                            hbar_fill = ease_linear(0, 1, round(boss_healthbar_timer), 56);
                        else {
                            hbar_fill = 1;
                        }
                    }
                    else
                        hbar_fill = 0;
                }
                else {
                    hbar_y = -80;
                    hbar_fill = 0;
                }
            break;
            
            case 2:
                var hp_total = 0;
                var hp_sum = 0;
                hbar_y = 24 + hbar_yoff;
                hp_total += hitpoints_max;
                hp_sum += hitpoints_max - percent;
                if (array_length(health_children) > 0) {
                    for (var i = 0; i < array_length(health_children); i++) {
                        with (health_children[i]) {
                            hp_total += hitpoints_max;
                            hp_sum += hitpoints_max - percent;
                        }
                    }
                }
                if (health_parent != -1 && health_parent != id) {
                    with (health_parent) {
                        hp_total += hitpoints_max;
                        hp_sum += hitpoints_max - percent;
                    }
                }
                if (hp_total != 0)
                    hbar_fill = hp_sum / hp_total;
            break;
            case 3:
                if (battle_state_timer <= 60)
                    hbar_y = lerp(24 + hbar_yoff, -80, battle_state_timer / 60);
                else
                    hbar_y = -80;
            break;
        }
        var xx = hbar_x - 320;
        var yy = hbar_y + 32;
        var str = char_name;
        
        if (!show_percent) {
            draw_set_font(asset_get("medFont"));
            draw_set_halign(fa_left);
            draw_sprite(sprite_get("boss_hp_back"), 0, hbar_x + hbar_shake_x, hbar_y + hbar_shake_y);
            draw_sprite_part_ext(sprite_get("boss_hp_bar"), 0, 0, 0, 640 * hbar_fill, 26, hbar_x - 320 + hbar_shake_x, hbar_y + hbar_shake_y, 1, 1, hbar_color, 1);
            draw_text_trans_outline(xx, yy, str, 1, -1, 1, 1, 0, c_white, c_black, 1);
        } else {
            draw_sprite(sprite_get("boss_percent_back"), 0, hbar_x + hbar_shake_x, hbar_y + hbar_shake_y);
            draw_set_font(asset_get("roaLBLFont"));
            draw_set_halign(fa_right);
            draw_text_trans_outline(hbar_x + 80, hbar_y + 8, hbar_percent, 1, -1, 1, 1, 0, c_white, c_black, 1);
            
            draw_set_font(asset_get("medFont"));
            draw_set_halign(fa_left);
            draw_text_trans_outline(hbar_x + 86, hbar_y + 16, "%", 1, -1, 1, 1, 0, c_white, c_black, 1);
            draw_set_halign(fa_right);
            draw_text_trans_outline(xx + 320 - 32, yy, str, 1, -1, 1, 1, 0, c_white, c_black, 1);
        }
    }
    i++;
}

#define draw_text_trans_outline(_x, _y, str, separ, w, xscale, yscale, angl, text_colour, outline_colour, alph)
for (var i = - 1; i < 2; i++) for (var j = -1; j < 2; j++) draw_text_ext_transformed_color(_x+i*2,_y+j*2,str,separ, w, xscale, yscale, angl, outline_colour, outline_colour, outline_colour, outline_colour, 1);
draw_text_ext_transformed_color(_x,_y,str,separ, w, xscale, yscale, angl, text_colour, text_colour, text_colour, text_colour, 1);
#define real_to_grid(_pos) //Translate real coordinates into coordinates on the basegame grid 
return _pos;
#define cell_to_real(_pos,_cell_pos) //Translate cell coordinates to real
with room_manager return [(_pos[0]-grid_offset)*cell_size + (cell_dim[0]*_cell_pos[0]-grid_offset*(_cell_pos[0] != 0))*cell_size + render_offset[0], 
						  (_pos[1]-grid_offset)*cell_size + (cell_dim[1]*_cell_pos[1]-grid_offset*(_cell_pos[1] != 0))*cell_size + render_offset[1]];
#define cell_to_grid(_pos, _cell_pos) //Translate cell coordinates to the basegame grid system
with room_manager return real_to_grid(cell_to_real(_pos,_cell_pos));
#define grid_to_cell(_pos) //Translate basegame grid system coordinates to in cell coordinates
with room_manager {
	_pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];
	var _sub_pos_x = [(_pos[0] % ((cell_dim[0]-grid_offset)*cell_size)),floor(_pos[0]/((cell_dim[0]-grid_offset)*cell_size))];
	var _sub_pos_y = [(_pos[1] % ((cell_dim[1]-grid_offset)*cell_size)),floor(_pos[1]/((cell_dim[1]-grid_offset)*cell_size))];
	if sign(_sub_pos_x[0]) == -1 _sub_pos_x[0] += ((cell_dim[0]-grid_offset)*cell_size); 
	if sign(_sub_pos_y[0]) == -1 _sub_pos_y[0] += ((cell_dim[1]-grid_offset)*cell_size);
    return [[_sub_pos_x[0], //Subcell
		    _sub_pos_y[0]],
		   [_sub_pos_x[1], //Cell
			_sub_pos_y[1]]];
}
#define array_clone_seriously_why_isnt_this_how_it_works(_shit)
var _fuck = [];
for(var _i = 0;_i < array_length_1d(_shit);_i++) {
	if array_length_1d(_shit[_i]) > 0 array_push(_fuck,array_clone_seriously_why_isnt_this_how_it_works(_shit[_i]));
	else array_push(_fuck,_shit[_i]);
}
return _fuck;