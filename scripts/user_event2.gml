//Window API Data & Draw
//win_call for type
/*enum P {
    LOAD,
    ROOM_ID,
    SCENE_ID,
    ACTION_ID,
    ALIVE_TIME,
    OBJECT,
    VISIBLE,
    DIE
}*/
/*
Font Types
medFont
fName
roundFont
roaMBLFont
roaLBLFont
tinyFont
*/
enum WIN {
	DEBUG,
	DIALOG_DEFAULT,
	AREATITLE,
	AREAFADE,
	ARCHY_DIALOG,
	POINTOUT,
	QUESTLIST,
}

enum GUI {
	SPRITE,
	TEXTBOX,
	DIALOGBOX,
	BUTTON,
	VARCONT,
	SCROLLBOX,
	EXIT
}

if win_call == 0 {
	if mouse_x_i != mouse_x || mouse_y_i != mouse_y cursor_visible = true;
	with obj_stage_main {
		if cursor_visible do_cursor();
		draw_windows(); //Draw Objects
		if cursor_visible draw_sprite_ext(cursor_sprite_i, cursor_index, cursor_x, cursor_y, 1, 1, 0, c_white, 1); //Draw cursor over everything
	}
	if cursor_visible with obj_stage_main logic_cursor();
	exit;
}

if win_call == 1 with obj_stage_main { //Load Data
	var i = 0;
	// var _string ="";
	// win_add(i++,[WIN.DEBUG,
	// 	new_varcont([_string,0,0,0,0,0]),
	// 	new_sprite(sprite_get("gui_test"),0,0),
	// 	new_textbox("GUI 2.0 TITLE",4,2,200,16,c_white,asset_get("fName")),
	// 	//new_dialogbox("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",asset_get("mfx_back"),"_",0.4,4,16,200,12,c_white,asset_get("fName"))
	// 	//new_textbox("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",4,18,238,12,c_white,asset_get("fName")),
	// 	new_scrollbox("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",4,18,238,64,16,c_white,asset_get("fName")),
	// 	new_dialogbox(_string,noone,"_",0.4,4,100,238,12,c_white,asset_get("fName"))
	// ]);
	var _string = cmd_output;
	// var _string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
	var _w = cmd_w;
	var _h = cmd_h;
	var _sep = 16;
	var _cmd_char = cmd_char;
	win_add(i++,[WIN.DEBUG,
		new_varcont(["",_string,_w,_h,_sep,_cmd_char]),
		new_sprite(sprite_get("gui_lucid"),0,-1),
		new_scrollbox(_string,8,18,_w,_h,_sep,c_white,asset_get("fName")),
		new_dialogbox(_cmd_char,noone,"_",0.4,4,cmd_h,cmd_w,_sep,c_white,asset_get("fName")),
		new_textbox(cmd_title,8,2,200,16,c_white,asset_get("fName")),
	]);
	
	win_add(i++,[WIN.AREATITLE,
		new_sprite(sprite_get("area_title"),0,0),
		new_textbox("TITLE_NAME",0,0,200,16,c_white,asset_get("roaLBLFont"))
	]);
	
	win_add(i++,[WIN.AREAFADE,
		new_sprite(sprite_get("area_title"),4,12),
		new_textbox("TITLE_NAME",2,2,700,32,c_black,asset_get("roaLBLFont")),
		new_varcont([0,0,0,0,0]),
		new_textbox("TITLE_NAME",0,0,700,32,c_white,asset_get("roaLBLFont")),
	]);
	var _pos = [32,26];
	var _string ="Test";
	var _sound = asset_get("sfx_may_arc_talk");
	var _w = 176;
	win_add(i++,[WIN.ARCHY_DIALOG,
		new_varcont([_string,120,0,0,0,0]),
		new_sprite(sprite_get("archy_dialog"),0,16),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0],_pos[1]+2,_w,16,c_black,asset_get("fName")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0],_pos[1]-2,_w,16,c_black,asset_get("fName")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0]-2,_pos[1],_w,16,c_black,asset_get("fName")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0]+2,_pos[1],_w,16,c_black,asset_get("fName")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0]-2,_pos[1]+2,_w,16,c_black,asset_get("fName")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0]+2,_pos[1]-2,_w,16,c_black,asset_get("fName")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0],_pos[1],_w,16,$d252ff,asset_get("fName")) //$ff00ff $ea00ea $d252ff
	]);
	var _string ="Test";
	var _sound = noone;
	//var _sound = asset_get("sfx_propeller_dagger_loop");
	var _sound = asset_get("sfx_shop_move");
	var _w = 400;
	win_add(i++,[WIN.POINTOUT,
		new_varcont([_string,120,0,0,0,0]),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0],_pos[1]+2,_w,16,c_black,asset_get("roaLBLFont")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0],_pos[1]-2,_w,16,c_black,asset_get("roaLBLFont")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0]-2,_pos[1],_w,16,c_black,asset_get("roaLBLFont")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0]+2,_pos[1],_w,16,c_black,asset_get("roaLBLFont")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0]-2,_pos[1]+2,_w,16,c_black,asset_get("roaLBLFont")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0]+2,_pos[1]-2,_w,16,c_black,asset_get("roaLBLFont")),
		new_dialogbox(_string,_sound,"_",0.4,_pos[0],_pos[1],_w,16,c_white,asset_get("roaLBLFont")) //$ff00ff $ea00ea $d252ff
	]);
	
	win_add(i++,[WIN.QUESTLIST, //Expansive Custom Window, Shows Quest List
		new_varcont([1,16,300,42,sprite_get("Quest Logo")]), //alpha, sep, w, sep_things
		//new_sprite(sprite_get("gui_test"),0,0),
		// new_textbox("QUEST_NAME",0,0,200,16,c_white,asset_get("fName")),
		// new_textbox("QUEST_DESCRIPTION",0,16,200,16,c_white,asset_get("roaLBLFont")),
	]);
	exit;
}

if win_call == 2 {//Update Call
	with obj_stage_main logic_windows(); 
	exit;
	
}
#define logic_windows() //Update Call
var _x = 0;
var _y = 0;
var _param = [];
var _element = [];
win_alpha = 1;
var alive_time = 0;
for (var _i = 0; _i < array_length_1d(active_win); _i++) {
	_x = active_win[_i][0][0];
	_y = active_win[_i][0][1];
	_element = active_win[_i][1];
	active_win[@_i][@0][@3] += 1;
	alive_time = active_win[_i][0][3];
	
	win_alpha = 1;
	switch _element[0] {
		// case WIN.DEBUG:
		// 	if win_active == _i {
		// 		//print_debug("DB Active: "+string(_i));
		// 		if keyboard_string != "" {
		// 			_element[@5][@1] += keyboard_string;
		// 			keyboard_string = "";
		// 		}
		// 	}
		// 	break;
		case WIN.DEBUG:
			if string_count("`",keyboard_string) {
				cmd_x = _x;
				cmd_y = _y;
				keyboard_string = "";
				end_window(_i);
				_i--;
			}
			if win_active == _i {
				if keyboard_string != "" {
					_element[@4][@1] += keyboard_string;
					keyboard_string = "";
				}
				with oPlayer {
					if attack_held == 1 {
						other.console_parse = string_parse(_element[4][1]," ");
						if other.console_parse != [] with other {
							cmd_command(console_parse,_element[4][1]);
							if !cmd_save_output cmd_output = parse_lines(cmd_output,_element[3][4],_element[3][5],16,-1);
							_element[@3][@1] = cmd_output;
							_element[@4][@1] = cmd_char;
						}
						// down_held = 1;
					}
					if special_held == 1 _element[@4][@1] = string_delete(_element[4][1],string_length(_element[4][1]),1);
				}
			}
			break;
		case WIN.AREATITLE:
			active_win[@_i][@0][@0] = lerp(active_win[_i][0][0],title_x_stop*(alive_time < 360)-title_x_stop*(alive_time > 360),0.1);
			if active_win[_i][0][0] == -title_x_stop {
				end_window(_i);
				_i--;
			}
			break;
		case WIN.AREAFADE:
			_element[@3][@1] = lerp(_element[3][1],(alive_time < title_time),0.05);
			if alive_time > title_time*2 {
				end_window(_i);
				_i--;
			}
			break;
		case WIN.ARCHY_DIALOG:
			if alive_time == 1 {
				//print_debug(string(_element[1][1]));
				active_win[@_i][1][@3][@1] = _element[1][1];
				active_win[@_i][1][@4][@1] = _element[1][1];
				active_win[@_i][1][@5][@1] = _element[1][1];
				active_win[@_i][1][@6][@1] = _element[1][1];
				active_win[@_i][1][@7][@1] = _element[1][1];
				active_win[@_i][1][@8][@1] = _element[1][1];
				active_win[@_i][1][@9][@1] = _element[1][1];
				//TEST
				_element[@1][@4] = _x;
				_element[@1][@5] = _y;
				//TEST
			}
			//TEST
			active_win[@_i][@0][@0] = _element[1][4]-view_get_xview();
			active_win[@_i][@0][@1] = _element[1][5]-view_get_yview();
			//
			if _element[3][11] > string_length(_element[3][1])-1 {
				_element[@1][@3] += 1;
				//print_debug(string(_element[1][3]));
				if _element[1][3] > _element[1][2] {
					end_window(_i);
					_i--;
				}
			}
			break;
		case WIN.POINTOUT:
			if alive_time == 1 {
				//print_debug(string(_element[1][1]));
				active_win[@_i][1][@2][@1] = _element[1][1];
				active_win[@_i][1][@3][@1] = _element[1][1];
				active_win[@_i][1][@4][@1] = _element[1][1];
				active_win[@_i][1][@5][@1] = _element[1][1];
				active_win[@_i][1][@6][@1] = _element[1][1];
				active_win[@_i][1][@7][@1] = _element[1][1];
				active_win[@_i][1][@8][@1] = _element[1][1];
				_element[@1][@4] = _x;
				_element[@1][@5] = _y;
			}
			//TEST
			active_win[@_i][@0][@0] = _element[1][4]-view_get_xview();
			active_win[@_i][@0][@1] = _element[1][5]-view_get_yview();
			//
			if _element[3][11] > string_length(_element[3][1])-1 {
				_element[@1][@3] += 1;
				//print_debug(string(_element[1][3]));
				if _element[1][3] > _element[1][2] {
					end_window(_i);
					_i--;
				}
			}
			break;
		case WIN.QUESTLIST:
			_quests = action_manager.quest_active;
			// print(_quests[0][_quests[0][0][0]][0]);
			break;
	}
	for (var _j = 1; _j < array_length_1d(_element);_j++) {
		_param = _element[_j];
		switch _param[0] {
			case GUI.DIALOGBOX:
				_param[11] += _param[4];
				if _param[11] < string_length(_element[3][1])-1 && !((floor(_param[11])) % 2) sound_play(_param[2],false,0,0.05,.9);//floor(_param[11] + _param[4]) > floor(_param[11]) sound_play(_param[2]);
				break;
			case GUI.SCROLLBOX: //[GUI.SCROLLBOX,_str,_x,_y,_w,_h,_sep,_color,_font,_line,_parsed_string];
				// if alive_time == 1 _param[10] = break_string(_param[1],_param[4],_param[5],_param[9]);
				// if win_active == _i with oPlayer {
				// 	if up_held == 1 || down_held == 1 {
				// 		_param[9] -= (up_held == 1)-(down_held == 1);
				// 		_param[9] = clamp(_param[9],0,100);
				// 		_param[10] = break_string(_param[1],_param[4],_param[5],_param[9]);
				// 	}
				// }
				if alive_time == 1 _param[10] = parse_lines(_param[1],_param[4],_param[5],_param[6],_param[9]);
				if win_active == _i with oPlayer {
					if up_held == 1 || down_held == 1 || attack_held == 1 {
						_param[9] += (up_held == 1) - (down_held == 1);
						_param[9] = clamp(_param[9],0,100);
						_param[10] = parse_lines(_param[1],_param[4],_param[5],_param[6],_param[9]);
					}
				}
				// _param[10] = _param[1];
				break;
		}
	}
}


return true;
#define draw_windows() //Draw Call
var _x = 0;
var _y = 0;
var _param = [];
var _element = [];
win_alpha = 1;
var alive_time = 0;
var _windows = "";

// draw_debug_text(100,100,break_string("Hello! This is a test on breaking up strings....",100,32,0));
for (var _i = 0; _i < array_length_1d(active_win); _i++) {
	_x = active_win[_i][0][0];
	_y = active_win[_i][0][1];
	_element = active_win[_i][1];
	active_win[@_i][@0][@3] += 1;
	alive_time = active_win[_i][0][3];
	_windows += string(active_win[_i][1][0])+" : ";
	win_alpha = 1;
	switch _element[0] {
		case WIN.DEBUG:
			win_alpha = .5+(win_active == _i)*.5;
			break;
		case WIN.AREAFADE:
			win_alpha = _element[3][1];
			break;
		case WIN.QUESTLIST:
			win_alpha = _element[1][1];
			// draw_sprite_ext(sprite_get("gui_test"),0,_x,_y,2,2,0,c_white,win_alpha);
			draw_sprite_ext(asset_get("empty_sprite"),0,_x,_y,2,2,0,c_white,win_alpha);
			draw_set_alpha(.6);
			draw_rectangle_color(_x,_y,_x+320,_y+96,c_black,c_black,c_black,c_black,false);
			draw_set_alpha(1);
			for (var _a = 0; _a < array_length_1d(_quests); _a++) {
				draw_sprite_ext(_quests[_a][_quests[_a][0]][2],0,_x,_y+_a*_element[1][4],2,2,0,c_white,win_alpha); //Get Logo Working
				draw_text_drop(_x+42,_y+_a*_element[1][4]+4,_quests[_a][_quests[_a][0]][0],_element[1][2],_element[1][3],1,1,0,win_alpha);
				draw_text_drop(_x+42+16,_y+_a*_element[1][4]+4+16,_quests[_a][_quests[_a][0]][1],_element[1][2],_element[1][3],1,1,0,win_alpha);
			}
			break;
	}
	if win_alpha > 0 for (var _j = 1; _j < array_length_1d(_element); _j++) {
		_param = _element[_j];
		switch _param[0] {
			case GUI.SPRITE:
				draw_sprite_ext(_param[1],0,_x+_param[2],_y+_param[3],2,2,0,c_white,win_alpha);
				break;
			case GUI.TEXTBOX:
				draw_set_font(_param[7]);
				draw_text_ext_transformed_color(_x+_param[2],_y+_param[3],_param[1],_param[5],_param[4],1,1,0,_param[6],_param[6],_param[6],_param[6],win_alpha);
				break;
			case GUI.DIALOGBOX:
				//_param[11] += _param[4];
				draw_set_font(_param[10]);
				if floor(_param[11]/4) % 2 {
					draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],win_alpha);
					break;
				}
				draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],win_alpha);
				break;
			case GUI.SCROLLBOX: //Good lord help me
				draw_set_font(_param[8]);
				draw_text_ext_transformed_color(_x+_param[2],_y+_param[3],_param[10],_param[6],_param[4],1,1,0,_param[7],_param[7],_param[7],_param[7],win_alpha);
				break;
		}
	}
}
//print_debug(_windows);
return true;

#define new_textbox(_default_string,_x,_y,_w,_sep,_color,_font)
return [GUI.TEXTBOX,_default_string,_x,_y,_w,_sep,_color,_font];
#define new_button(_sprite,_x,_y)
return [GUI.BUTTON,_sprite,_x,_y];
#define new_sprite(_sprite,_x,_y)
return [GUI.SPRITE,_sprite,_x,_y];
#define new_dialogbox(_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font)
var _char_vis = 0;
return [GUI.DIALOGBOX,_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font,_char_vis];
#define new_scrollbox(_str,_x,_y,_w,_h,_sep,_color,_font)
var _line = 0;
var _parsed_string = "";
return [GUI.SCROLLBOX,_str,_x,_y,_w,_h,_sep,_color,_font,_line,_parsed_string];
#define new_varcont(_var)
var _s = [GUI.VARCONT];
for (var _i = 0;_i < array_length_1d(_var);_i++) array_push(_s,_var[_i]);
return _s;
#define win_add(_win_id, _win_data)
while _win_id >= array_length_1d(win_data)  array_push(win_data, []);
win_data[@_win_id] = _win_data;
return true;
#define end_window(_i)
if debug print_debug("[WA] ENDING W: "+string(active_win[_i][1][0])+" AI: "+string(active_win[_i][0][2]));
if active_win[_i][0][2] != noone with action_manager array_push(end_action_index,other.active_win[_i][0][2]);
active_win = array_cut(active_win,_i);
return true;

#define do_cursor() //cursor stuff
cursor_x_p = cursor_x;
cursor_y_p = cursor_y;
cursor_x = mouse_x - view_get_xview();
cursor_y = mouse_y - view_get_yview();
var _cursor_grid = grid_to_cell([mouse_x+64,mouse_y+64]);
if debug {
	//draw_debug_text(cursor_x,cursor_y,string(_cursor_grid[1])+":"+string([floor((_cursor_grid[0][0])/16),floor((_cursor_grid[0][1])/16)])+":"+string([(_cursor_grid[0][0]) % 16, (_cursor_grid[0][1]) % 16]));
	draw_debug_text(cursor_x,cursor_y,"["+string(_cursor_grid[1][0])+","+string(_cursor_grid[1][1])+"]:["+string(floor((_cursor_grid[0][0])/16))+","+string(floor((_cursor_grid[0][1])/16))+"]:["+string((_cursor_grid[0][0]) % 16)+","+string((_cursor_grid[0][1]) % 16)+"]");
	draw_debug_text(cursor_x,cursor_y+16,string([cursor_x,cursor_y]));
	draw_debug_text(cursor_x,cursor_y+32,string([mouse_x,mouse_y]));
}
return true;
#define logic_cursor()

switch mouse_button {
	case 1: //Left-Click
		//keyboard_string = "";
		if !mb_l_click { //on click
			// print_debug("MB1 CLICK!");
			//Windows
			var _x = 0;
			var _y = 0;
			var _param = [];
			for (var i = 0; i < array_length_1d(active_win);i++) {
				_x = active_win[i][0][0];
				_y = active_win[i][0][1];
				_param = active_win[i][1];
				switch _param[0] {
					case WIN.DEBUG:
						if point_distance(_x,_y,cursor_x,cursor_y) < 64 {
							win_drag = i;
							win_active = i;
						}
						break;
				}
			}
			if win_drag == -1 win_active = -1;
			
			//Debug View Objects
			var _debug_click = !(sign(win_active) == -1);
			if !_debug_click with obj_stage_article {
				if "static" in self && static break; //Don't Select Background
				switch num {
					case 12: //Lighting
						if sprite_get_width(render_sprite) > other.mouse_x-x && other.mouse_x-x > 0 &&
								sprite_get_height(render_sprite) > other.mouse_y-y && other.mouse_y-y > 0 _debug_click = 1;
						break;
					case 4: // Trigger Zones
					case 7: // Camera Control Zones
					case 8: // Room Transfer Zones
					case 9: // Checkpoints
						switch trigger_shape {
							case 0: // Rectangle
								if trigger_w > other.mouse_x-x && other.mouse_x-x > 0 &&
									trigger_h > other.mouse_y-y && other.mouse_y-y > 0 _debug_click = 1;
								break;
							case 1: // Circle
								if point_distance(other.mouse_x,other.mouse_y,x,y) < trigger_w _debug_click = 1;
								break;
						}
					case 1: // Terrain - no collision
					case 10:// Items
					default:// Catch-all for now 
						if collision_point(other.mouse_x,other.mouse_y,self,true,false) != noone _debug_click = 1;
						break;
				}
				if _debug_click {
					debug_info = !debug_info;
					depth = (-100*debug_info)+(og_depth*(!debug_info));
					if debug_info && array_find_index(other.debug_selected,id) == -1 array_push(other.debug_selected,id);
					else if array_find_index(other.debug_selected,id) != -1 other.debug_selected = array_cut(other.debug_selected,array_find_index(other.debug_selected,id));
					break;
				}
			}
			if !_debug_click with obj_stage_article_solid {
				if collision_point(other.mouse_x,other.mouse_y,self,true,false) != noone {
					debug_info = !debug_info;
					depth = (-100*debug_info)+(og_depth*(!debug_info));
					if debug_info && array_find_index(other.debug_selected,id) == -1 array_push(other.debug_selected,id);
					else if array_find_index(other.debug_selected,id) != -1 other.debug_selected = array_cut(other.debug_selected,array_find_index(other.debug_selected,id));
					_debug_click = 1;
					break;
				}
			}
			if !_debug_click with obj_stage_article_platform {
				if collision_point(other.mouse_x,other.mouse_y,self,true,false) != noone {
					debug_info = !debug_info;
					depth = (-100*debug_info)+(og_depth*(!debug_info));
					if debug_info && array_find_index(other.debug_selected,id) == -1 array_push(other.debug_selected,id);
					else if array_find_index(other.debug_selected,id) != -1 other.debug_selected = array_cut(other.debug_selected,array_find_index(other.debug_selected,id));
					_debug_click = 1;
					break;
				}
			}
		}
		//print_debug(string(win_active));
		if win_drag != -1 {
			active_win[@win_drag][@0][@0] += cursor_x - cursor_x_p;
			active_win[@win_drag][@0][@1] += cursor_y - cursor_y_p;
		}
		mb_l_click = true;
		break;
	case 2:
		if !mb_r_click { //on click
			while array_length_1d(cursor_drag_offset_x) < array_length_1d(debug_selected) {
				array_push(cursor_drag_offset_x, 0);
				array_push(cursor_drag_offset_y, 0);
			}
			for (var _i = 0;_i < array_length_1d(debug_selected);_i++) {
				cursor_drag_offset_x[@_i] = mouse_x-debug_selected[_i].x;
				cursor_drag_offset_y[@_i] = mouse_y-debug_selected[_i].y;
			}
		}
		mb_r_click = true;
		for (var _i = 0;_i < array_length_1d(debug_selected);_i++) {
			debug_selected[_i].x = floor((mouse_x-cursor_drag_offset_x[_i])/2)*2+1;
			debug_selected[_i].y = floor((mouse_y-cursor_drag_offset_y[_i])/2)*2+1;
		}
		break;
	default:
		if mb_l_click { //on release
			win_drag = -1;
			//print_debug("MB1 UN CLICK!8");
		}
		mb_l_click = false;
		mb_r_click = false;
		break;
}
return true;

// #define draw_debug_info() //Done in the scope of an article; Here so there's no performance impact

// switch num {
// 	case 1:
// 		debug_pos = grid_to_cell([x+64,y+64]);
// 		draw_debug_text(floor(x),floor(y),"["+string(debug_pos[1][0])+","+string(debug_pos[1][0])+"]:["+string(floor((debug_pos[0][0])/16))+","+string(floor((debug_pos[0][1])/16))+"]:["+string((debug_pos[0][0]) % 16)+","+string((debug_pos[0][1]) % 16)+"]");
//     	draw_rectangle_color(x-sprite_get_xoffset(sprite_index)*2,y-sprite_get_yoffset(sprite_index)*2,
//                 			 x-sprite_get_xoffset(sprite_index)*2+sprite_get_width(sprite_index)*2,y-sprite_get_yoffset(sprite_index)*2+sprite_get_height(sprite_index)*2,
//                         	 c_fuchsia,c_fuchsia,c_fuchsia,c_fuchsia,true);
// 		break;
// }
// return true;

#define cmd_command(_str_a,_str_raw)
_str_a[@0] = string_replace(_str_a[0],cmd_char,"");
for (var _i = 0;_i < array_length_1d(_str_a);_i++) { //Convert to values
	if string(_str_a[_i]) != _str_a[_i] blank = 0;
	else if string_count("sprite:",_str_a[_i]) > 0 _str_a[@_i] = sprite_get(string_replace(string_replace(_str_a[_i],"sprite:'",""),"'",""));
	else if string_count("asset:",_str_a[_i]) > 0 _str_a[@_i] = asset_get(string_replace(string_replace(_str_a[_i],"asset:'",""),"'",""));
	else if string_count("sound:",_str_a[_i]) > 0 _str_a[@_i] = sound_get(string_replace(string_replace(_str_a[_i],"sound:'",""),"'",""));
	else if string_count("r:",_str_a[_i]) > 0 _str_a[@_i] = resource_get(string_replace(string_replace(_str_a[_i],"r:'",""),"'",""));
	else if string_count("v:",_str_a[_i]) > 0 _str_a[@_i] = variable_instance_get(self,string_replace(string_replace(_str_a[_i],"v:'",""),"'",""));
}
// print(_str_a);
with obj_stage_main {
	switch _str_a[0] {
		case "attack": //Cause Enemies to attack
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) {
				if debug_selected[_i].num == 6 { //only if enemy
					// debug_selected[_i].state_timer = 0;
					// debug_selected[_i].state = PS_ATTACK_GROUND*(1-free)+PS_ATTACK_AIR*free;
					debug_selected[_i].next_attack = real(_str_a[1]);
				}
			}
			break;
		case "lucid": //Enable breaking commands
			debug = !debug;
			cmd_print(_str_raw,"Lucid toggled; WILL desync!");
			break;
		case "freecam":
			if !debug {
				cmd_print(_str_raw,"Error: Need to be LUCID");
				break;
			}
			cmd_freecam = !cmd_freecam;
			// follow_player.visible = !visible;
			cmd_print(_str_raw,"Toggled Freecam Mode (WIP)");
			break;
		case "freeze": //Enemy does not do inputs
			with obj_stage_article if num == 6 freeze = !freeze;
			cmd_print(_str_raw,"Controlers have been toggled");
			break;
		case "destroy":
		case "d":
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) {
				instance_destroy(debug_selected[_i]);
			}
			break;
		case "clear":
			cmd_output = "";
			cmd_print(_str_raw,"Cleared LD Output");
			break;
		case "debug_output": //toggles debug console outputs
			if !debug {
				cmd_print(_str_raw,"Error: Need to be LUCID");
				break;
			}
			if array_length_1d(debug_selected) == 0 {
				with obj_stage_article debug = !debug;
				with obj_stage_article_platform debug = !debug;
				with obj_stage_article_solid debug = !debug;
				cmd_print(_str_raw,"Debug toggled for all articles...");
				break;
			} 
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) {
				debug_selected[_i].debug = !debug_selected[_i].debug;
				cmd_print(_str_raw,"Debug toggled for selected...");
			}
			break;
		case "export":
			var _art = debug_selected[0];
			var _article_type = (_art.object_index == obj_stage_article)*0+
								(_art.object_index == obj_stage_article_platform)*1+
								(_art.object_index == obj_stage_article_solid)*2;
			var _art_sv = "[";
			for (var _i = 0; _i < array_length(_art.spawn_variables);_i++) _art_sv += string(_art.spawn_variables[_i])+",";
			_art_sv += "]";
			var _art_pos = grid_to_cell([_art.x+64,_art.y+64]);
			get_string("Copy the below into the room ["+string(_art_pos[1][0])+","+string(_art_pos[1][1])+"] load script...",
			"["+string(_art.num)+","+string(floor(_art_pos[0][0]/16))+","+string(_art_pos[0][1]/16)+","+string(_article_type)+","+string(_art.og_depth)+","+_art_sv+",[0,0]"+"],");
			cmd_print(_str_raw,"Exporting Article into ROOM Format...");
			break;
		case "god":
			with oPlayer god = !god;
			cmd_print(_str_raw,"God Mode Toggled");
			break;
		case "kill":
			with oPlayer if state != PS_DEAD && state != PS_RESPAWN {
				dead_pos = [x,y];
				create_deathbox(x,y-32,10,10,player,true,0,2,2);
			}
			cmd_print(_str_raw,"You must DIE");
			break;
		case "list":
			if array_length_1d(_str_a) < 2 {
				cmd_print(_str_raw,"Error: Article Number Req.");
				break;
			}
			if _str_a[1] == "selected" {
				var _art_list = "Selected Articles:
";
				for (var _i = 0; _i < array_length_1d(debug_selected);_i++) {
					_art_list += string(debug_selected[_i])+", ";
				}
				cmd_print(_str_raw,_art_list);
				break;
			}
			var _art_list = "num = "+_str_a[1]+"
";
			var _n_str_a = string_digits(_str_a[1]);
			with obj_stage_article {
				if num == _n_str_a _art_list += string(id)+":A, ";
			}
			with obj_stage_article_platform {
				if num == _n_str_a _art_list += string(id)+":P, ";
			}
			with obj_stage_article_solid {
				if num == _n_str_a _art_list += string(id)+":S, ";
			}
			cmd_print(_str_raw,_art_list);
			break;
		case "peace": //Make enemies not attack
			with obj_stage_article if num == 6 peace = !peace;
			cmd_print(_str_raw,"Aethers' rivalry toggled");
			break;
		case "save_output":
			cmd_save_output = !cmd_save_output;
			break;
		case "select": //Add an ID to selection
			if !debug {
				cmd_print(_str_raw,"Error: Need to be LUCID");
				break;
			}
			if array_length_1d(_str_a) < 2 {
				cmd_print(_str_raw,"Error: Object ID Req.");
				break;
			}
			var _index = array_find_index(debug_selected,string_digits(_str_a[1]));
			if _index != -1 {
				debug_selected = array_cut(debug_selected,_index);
				cmd_print(_str_raw,"Removed "+_str_a[1]+" from selection.");
				break;
			}
			array_push(debug_selected,string_digits(_str_a[1]));
			cmd_print(_str_raw,"Added "+_str_a[1]+" to selection.");
			break;
		case "set": //Set a varable for selected objects
			if !debug {
				cmd_print(_str_raw,"Error: Need to be LUCID");
				break;
			}
			if array_length_1d(_str_a) < 3 {
				cmd_print(_str_raw,"Error: 2 Args Req.");
				break;
			}
			if array_length_1d(debug_selected) == 0 {
				if string_count("'",_str_a[2]) == 0 {
					variable_instance_set(self,_str_a[1],string_digits(_str_a[2]));
				} else variable_instance_set(self,_str_a[1],_str_a[2]);
				cmd_print(_str_raw,"Set "+_str_a[1]+" to "+_str_a[2]);
				break;
			}
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) if (_str_a[1] in debug_selected[_i]) {
				if string_count("'",_str_a[2]) == 0 {
					variable_instance_set(debug_selected[_i],_str_a[1],string_digits(_str_a[2]));
				} else variable_instance_set(debug_selected[_i],_str_a[1],_str_a[2]);
			}
			cmd_print(_str_raw,"Set "+_str_a[1]+" to "+_str_a[2]+" on selected.");
			break;
		case "spawn":
			if array_length_1d(_str_a) < 1 {
				cmd_print(_str_raw,"Error: More Args Req.");
				break;
			}
			switch _str_a[2] {
				case "0":
					_str_a[@2] = "obj_stage_article";
					break;
				case "1":
					_str_a[@2] = "obj_stage_article_platform";
					break;
				case "2":
					_str_a[@2] = "obj_stage_article_solid";
					break;
			}
			var _handl = instance_create(floor(mouse_x),floor(mouse_y),_str_a[2],real(string_digits(_str_a[1])));
			while array_length_1d(_str_a) < 12 array_push(_str_a, 0);
			var _art_pos = grid_to_cell([_handl.x,_handl.y]);
			with _handl {
				spawn_variables = array_slice(_str_a,4,8);
				room_manager = other.room_manager;
				og_depth = real(string_digits(_str_a[3]));
				depth = og_depth;
				cell_size = room_manager.cell_size;
				init_pos = [_art_pos[0][0]/16,_art_pos[0][1]/16];
				cell_pos = [_art_pos[1][0],_art_pos[1][1]];
				debug = other.debug;
			}
			cmd_print(_str_raw,"Spawned <"+string(_str_a[2])+":"+string(_str_a[1])+">");
			// print(_handl.spawn_variables);
			break;
		case "man": //Help Manual
			break;
		case "help":
			cmd_print(_str_raw,"Valid commands:
			<selected> debug_output
			<selected> destroy
			<selected> export
			god
			help
			kill
			list [num, selected:self]
			lucid
			<selected> man <num>
			save_output
			select [id]
			<selected> set [var] [value]
			spawn [num] [type] [depth] <arg0 ... arg7>
			");
			break;
		case "":
			break;
		default:
			cmd_print(_str_raw,"Error: Command "+_str_a[0]+" not found. Type 'help' for command list.");
			break;
	}
}
return true;

#define cmd_print(_cmd_str,_str)
cmd_output += break_string(_cmd_str,cmd_w,10000,0) + "
" + break_string(_str,cmd_w,10000,0) +"
";
return true;
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
#define collision_circle_all(_x,_y,_r,_obj)
var _collis_array = [];
with _obj if point_distance(x,y,_x,_y) < _r array_push(_collis_array,id);
return _collis_array;
#define collision_rectangle_all(_x,_y,_l,_h,_obj)
var _collis_array = [];
with _obj if abs(x-_x) < _l && abs(y-_y) < _h array_push(_collis_array,id);
return _collis_array;
#define array_cut(_array, _index)
var _array_cut = array_create(array_length_1d(_array)-1);
var j = 0;
for (var i = 0; i < array_length_1d(_array); i++) {
	if i != _index {
		_array_cut[@j] = _array[i];
		j++;
	}
}
return _array_cut;
#define break_string(str, w, h, s_line) //From Soup :)
var final_str = "";
var line = 0;
var len = string_length(final_str);
var prev_char = "";
var char = "";
for (var i = 1; i <= string_length(str); i++) {
    char = string_char_at(str,i);
    if string_width(final_str+char) > w { //if string_width_ext(final_str + char, sep, w) > w { 
    	line++;
		// if line-s_line == l_count return final_str;
        final_str = string_delete(final_str,len,1);
        final_str += "
";
		if line == s_line final_str = "";
		if line > s_line && string_height(final_str) > h return final_str;
		prev_char =  string_char_at(str,i-(i > 0));
		if prev_char != " " final_str += prev_char;
		if char != " " final_str += char;
    } else {
        final_str += char;
    }
    
    len = string_length(final_str);
}
return final_str;

#define break_rev_string(_str,_w,_h,_sep,_s_line) // Break a string from the end first
var _f_str = "";
var _line = string_height_ext(_str,_sep,_w)/(_sep+string_height_ext("I",_sep,1000)); // Max lines
var _char = '';
for (var _i = string_length(_str);_i > 0;_i--) {
	_char = string_char_at(_str,_i);
}
return true;

#define parse_lines(_str, _w, _h, _sep, _s_line) //Parse existing string
var _f_str = _str;
var _s_char = 0;
var _i = 0;
if _s_line > 0 {
	// var _lines = ceil(string_height_ext(_f_str,_sep,_w)/(_sep+string_height("I"))); // Total Lines
	// while (_lines > (_lines - _s_line)) {
	// 	_f_str = string_delete(_f_str,string_length(_f_str),1);
	// 	_lines = ceil(string_height_ext(_f_str,_sep,_w)/(_sep+string_height("I")));
	// }
}
while string_height_ext(_f_str,_sep,_w) > _h _f_str = string_delete(_f_str,1,1);
return _f_str;

// #define vert_string(_str,_w) //Verticalize a string
// var _final_str = "";
// var _line = 0;
// var _len = string_length(_final_str);
// var _prev_char = "";
// var _char = "";
// for (var i = 1; i <= string_length(_str); i++) {
//     _char = string_char_at(_str,i);
//     if string_width(_final_str+_char) > _w { //if string_width_ext(final_str + char, sep, w) > w { 
//     	_line++;
//     	// _final_str = string_delete(_final_str,_len,1);
//     	_final_str += "
// ";
//     }
//     _final_str += _char;
// }
// return _final_str;
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

#define draw_text_drop(_x,_y,_str,_sep,_w,_x1,_y1,_ang,_alp)

draw_text_ext_transformed_color(_x+2,_y+2,_str,_sep,_w,_x1,_y1,_ang,c_black,c_black,c_black,c_black,_alp);
draw_text_ext_transformed_color(_x,_y,_str,_sep,_w,_x1,_y1,_ang,c_white,c_white,c_white,c_white,_alp);