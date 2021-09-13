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
	POP_DIALOG,
	POINTOUT,
	QUESTLIST,
	NOTE_SCROLL
	
}

enum GUI {
	SPRITE,
	TEXTBOX,
	DIALOGBOX,
	BUTTON,
	VARCONT,
	SCROLLBOX,
	DIALOGBOX_TRIM,
	LISTBOX,
	SPRSCR,
	EXIT
}

enum SM {
	PROP,
	ADD,
	DEL,
	EXPORT,
	SAVE,
	LOAD,
}

if win_call == 0 { //HUD Draw Call
	if mouse_x_i != mouse_x || mouse_y_i != mouse_y cursor_visible = true;
		
	if cursor_visible do_cursor();
	draw_windows(); //Draw Objects
	if cursor_visible {
		if debug {
			draw_sprite_ext(cursor_sprite_i, cursor_index, cursor_x, cursor_y, 1, 1, 0, c_white, 1); //Draw cursor over everything
			logic_cursor();
			draw_debug_points();
		}
		
	}
	exit;
}

if win_call == 1 with obj_stage_main { //Load Data
	//Reset
	debug_point_array = [];
	win_data = [];
	active_win = [];
	
	//Window Data
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
	win_add(i++,[WIN.DEBUG, //0
		new_varcont(["",_string,_w,_h,_sep,_cmd_char]),
		new_sprite(sprite_get("gui_lucid"),0,-1),
		new_scrollbox(_string,8,18,_w,_h,_sep,c_white,asset_get("fName")),
		new_dialogbox(_cmd_char,noone,"_",dialog_tick_rate,4,cmd_h,cmd_w,_sep,c_white,asset_get("fName")),
		new_textbox(cmd_title,8,2,200,16,c_white,asset_get("fName")),
	]);
	
	win_add(i++,[WIN.AREATITLE, //1
		new_sprite(sprite_get("area_title"),0,0),
		new_textbox("TITLE_NAME",0,0,200,16,c_white,asset_get("roaLBLFont"))
	]);
	
	win_add(i++,[WIN.AREAFADE, //2
		new_sprite(sprite_get("area_title"),4,12),
		new_textbox("TITLE_NAME",2,2,700,32,c_black,asset_get("roaLBLFont")),
		new_varcont([0,0,0,0,0]),
		new_textbox("TITLE_NAME",0,0,700,32,c_white,asset_get("roaLBLFont")),
	]);
	
	var _pos = [32,26];
	var _offset = [20,-128];
	var _string ="Test";
	var _dialog_index = 0;
	var _sound = asset_get("sfx_may_arc_talk");
	var _w = 176;
	win_add(i++,[WIN.POP_DIALOG, //3
		new_varcont([_dialog_index,120,0,0,0,0]),
		new_sprite(sprite_get("s_talk_gui"),_offset[0],14+_offset[1]),
		new_trim_dialogbox(_string,_sound,"_",dialog_tick_rate,_pos[0]+_offset[0],_pos[1]+_offset[1],_w,16,c_white,asset_get("fName")) //$ff00ff $ea00ea $d252ff
		// new_dialogbox(_string,_sound,"_",dialog_tick_rate,_pos[0],_pos[1]+2,_w,16,c_black,asset_get("fName")),
		// new_dialogbox(_string,_sound,"_",dialog_tick_rate,_pos[0],_pos[1]-2,_w,16,c_black,asset_get("fName")),
		// new_dialogbox(_string,_sound,"_",dialog_tick_rate,_pos[0]-2,_pos[1],_w,16,c_black,asset_get("fName")),
		// new_dialogbox(_string,_sound,"_",dialog_tick_rate,_pos[0]+2,_pos[1],_w,16,c_black,asset_get("fName")),
		// new_dialogbox(_string,_sound,"_",dialog_tick_rate,_pos[0]-2,_pos[1]+2,_w,16,c_black,asset_get("fName")),
		// new_dialogbox(_string,_sound,"_",dialog_tick_rate,_pos[0]+2,_pos[1]-2,_w,16,c_black,asset_get("fName")),
		// new_dialogbox(_string,_sound,"_",dialog_tick_rate,_pos[0],_pos[1],_w,16,$d252ff,asset_get("fName")) //$ff00ff $ea00ea $d252ff
	]);
	
	var _string ="Test";
	//var _sound = asset_get("sfx_propeller_dagger_loop");
	var _sound = asset_get("sfx_shop_move");
	var _w = 400;
	win_add(i++,[WIN.POINTOUT, //4
		new_varcont([_string,120,0,0,0,0,0]),
		new_trim_dialogbox(_string,_sound,"_",dialog_tick_rate,_pos[0],_pos[1],_w,16,c_white,asset_get("roaLBLFont")) //$ff00ff $ea00ea $d252ff
	]);
	
	win_add(i++,[WIN.QUESTLIST, //5 //Expansive Custom Window, Shows Quest List
		new_varcont([1,16,300,42,sprite_get("Quest Logo")]), //alpha, sep, w, sep_things
		//new_sprite(sprite_get("gui_test"),0,0),
		// new_textbox("QUEST_NAME",0,0,200,16,c_white,asset_get("fName")),
		// new_textbox("QUEST_DESCRIPTION",0,16,200,16,c_white,asset_get("roaLBLFont")),
	]);
	
	var _pos = [32,8];
	var _string ="Init";
	var _sound = asset_get("sfx_frog_jab");
	// var _sound = asset_get("empty_sprite");
	var _w = 500;
	win_add(i++,[WIN.DIALOG_DEFAULT, //6
		new_varcont([1,1,1,_sound]), //ID, Progress, freeze_player,sound/flap
		new_sprite(sprite_get("talk_gui"),0,0), //Dialog Background Sprite
		new_varcont([]), //Filler to replace dialog picture
		// new_sprite(sprite_get("face_default"),0,0), //Dialog Picture
		new_dialogbox(_string,_sound,"_",dialog_tick_rate,_pos[0],_pos[1]+2,_w,18,c_white,asset_get("medFont")), //Main Text
		// new_sprite(sprite_get("response_gui"),0,0), //Response Sprite
		// new_listbox(["Response 1","Response 2"],asset_get("empty_sprite"),_sound,_pos[0],_pos[1]+2,_w,18,c_white,asset_get("medFont")), //Listbox new_listbox(_choices,_select_sprite,_sound,_x,_y,_w,_sep,_color,_font)
	]);
	
	var _sprite = asset_get("empty_sprite");
	var _x = cam_width/2;
	var _y = cam_height/3;
	var _rate = [0,10];
	win_add(i++,[WIN.NOTE_SCROLL, //6 //Shows world notes
		new_varcont([_sprite,_x,_y,_rate]), //sprite, x, y, rate
		new_sprscr(_sprite,_x,_y,_rate)
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

if win_call == 3 { //World Draw Call?
	
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
		case WIN.DEBUG:
			if string_count("`",keyboard_string) {
				cmd_x = _x;
				cmd_y = _y;
				keyboard_string = "";
				end_window(_i);
				_i--;
				break;
			}
			// if win_active == _i {
			if string_count("/",keyboard_string) {
				console_parse = string_parse(_element[4][1]," ");
				if console_parse != [] {
					cmd_command(console_parse,_element[4][1],false);
					// if !cmd_save_output cmd_output = parse_lines(cmd_output,_element[3][4],_element[3][5],16,-1);
					_element[@4][@1] = cmd_char;
				}
				keyboard_string = "";
			}
			if string_count("\",keyboard_string) {
				_element[@4][@1] = string_delete(_element[4][1],string_length(_element[4][1]),2);
				keyboard_string = "";
			}
			if keyboard_string != "" {
				_element[@4][@1] += keyboard_string;
				keyboard_string = "";
			}
			// with oPlayer {
			// 	if attack_held == 1 {
			// 		other.console_parse = string_parse(_element[4][1]," ");
			// 		if other.console_parse != [] with other {
			// 			cmd_command(console_parse,_element[4][1]);
			// 			if !cmd_save_output cmd_output = parse_lines(cmd_output,_element[3][4],_element[3][5],16,-1);
			// 			_element[@3][@1] = cmd_output;
			// 			_element[@4][@1] = cmd_char;
			// 		}
			// 		// down_held = 1;
			// 	}
			// 	if special_held == 1 _element[@4][@1] = string_delete(_element[4][1],string_length(_element[4][1]),1);
			// }
			// }
			_element[@3][@1] = cmd_output;
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
				break;
			}
			break;
		case WIN.POP_DIALOG:
			if alive_time == 1 {
				//print_debug(string(_element[1][1]));
			
				// _element[@3][@1] = _element[1][1];
				var _random = random_func_2(id % 24, array_length_1d(action_manager.dialog_array[_element[1][1]])-1, true)+1;
				_element[@3][@1] = action_manager.dialog_array[_element[1][1]][_random][0];
				
				if active_win[_i][0][4] != room_manager {
					_element[@1][@6] = active_win[_i][0][4]; //Get tracking id if it's not room_id
					_element[@1][@4] = _element[1][6].x;
					_element[@1][@5] = _element[1][6].y;
				} else {
					_element[@1][@4] = _x;
					_element[@1][@5] = _y;
				}
				print_debug(string(_element[1][4]));
				print_debug(string(_element[1][5]));
				// sound_play(dialog_up);
			}
			if _element[1][6] != room_manager {
				if !instance_exists(_element[1][6]) { //Abort abort!
					end_window(_i);
					_i--;
					break;
				}
				active_win[@_i][@0][@0] = _element[1][6].x-view_get_xview();
				active_win[@_i][@0][@1] = _element[1][6].y-view_get_yview();
			} else {
				active_win[@_i][@0][@0] = _element[1][4]-view_get_xview();
				active_win[@_i][@0][@1] = _element[1][5]-view_get_yview();
			}
			if _element[3][11] > string_length(_element[3][1])-1 {
				_element[@1][@3] += 1;
				if _element[1][3] > _element[1][2] {
					end_window(_i);
					_i--;
					break;
				}
			}
			break;
		case WIN.POINTOUT:
			if alive_time == 1 {
				active_win[@_i][1][@2][@1] = _element[1][1];
				//TEST
				_element[@1][@4] = _x;
				_element[@1][@5] = _y;
				//
			}
			//TEST
			active_win[@_i][@0][@0] = _element[1][4]-view_get_xview();
			active_win[@_i][@0][@1] = _element[1][5]-view_get_yview();
			//
			if _element[2][11] > string_length(_element[2][1])-1 {
				_element[@1][@3] += 1;
				if _element[1][3] > _element[1][2] {
					end_window(_i);
					_i--;
					break;
				}
			}
			break;
		case WIN.QUESTLIST:
			_quests = action_manager.quest_active;
			// print(_quests[0][_quests[0][0][0]][0]);
			//Moved to action manager on quest update <- Moving back for proper display
			for (var _a = 0; _a < array_length_1d(_quests); _a++) {
				if _quests[_a][0] > array_length(_quests[_a])-1 {
					if quest_complete_timer == 0 sound_play(quest_complete);
					quest_complete_timer++;
					if quest_complete_timer >= quest_complete_timer_max {
						quest_complete_timer = 0;
						action_manager.quest_active = array_cut(action_manager.quest_active,_a);
						_a--;
					}
					break;
					
				}
			}
			break;
		case WIN.DIALOG_DEFAULT:
			//Element List: 1 - varcont[id, progress, freeze_players], 2 - Bg, 3 - Face, 4- Dialog
			if alive_time == 1 {
				//_element[@1][@1]
				_element[@4][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][0]; //Set to initial dialog: [id][progress][string,face,bg]
				if array_length_1d(action_manager.dialog_array[_element[1][1]][_element[1][2]]) > 1 {
					_element[@3][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][0][1]; //Set to initial dialog: [id][progress][string,face,bg]
					if array_length_1d(action_manager.dialog_array[_element[1][1]][_element[1][2]][0]) > 2 _element[@2][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][2]; //Set to initial dialog: [id][progress][data/response_map][string,face,bg]
				}
			}
			var _continue = 1;
			with oPlayer {
				if _element[1][3] && (state != PS_SPAWN && state != PS_PRATFALL){
					if free set_state(PS_PRATFALL); //If freeze players
					else set_state(PS_SPAWN);
				}
				if (attack_held == 1 || taunt_held == 1) {
					// print("Upping text...");
					_element[@1][@2]++;
					if _element[1][2] > array_length_1d(action_manager.dialog_array[_element[1][1]])-1 { //The end of the conversation!
						if _element[1][3] && (state == PS_SPAWN || state == PS_PRATFALL) { 
							set_state(PS_IDLE); //If freeze players
							attack_end();
						}
						with other {
							end_window(_i);
							_i--;
							_continue = 0;
						}
					}
					if _continue {
						_element[@4][@11] = 0;
						_element[@4][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][0];
						if array_length_1d(action_manager.dialog_array[_element[1][1]][_element[1][2]]) > 1 {
						_element[@3][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][1]; //Set to initial dialog: [id][progress][data/response_map][string,face,bg]
						if array_length_1d(action_manager.dialog_array[_element[1][1]][_element[1][2]]) > 2 _element[@2][@1] = action_manager.dialog_array[_element[1][1]][_element[1][2]][2]; //Set to initial dialog: [id][progress][data/response_map][string,face,bg]
						}
					}
				}
			}
			break;
		case WIN.NOTE_SCROLL:
			with oPlayer {
				if state != PS_SPAWN set_state(PS_SPAWN);
				if special_down with other {
					end_window(_i);
					_i--;
				}
				if left_down _x -= rate[0];
				if right_down _y += rate[0];
				if up_down _x -= rate[1];
				if down_down _y += rate[1];
			}
			break;
	}
	for (var _j = 1; _j < array_length_1d(_element);_j++) {
		_param = _element[_j];
		switch _param[0] {
			case GUI.DIALOGBOX_TRIM:
			case GUI.DIALOGBOX:
				_param[11] += _param[4];
				// print(_param[1]);
				if _param[11] < string_length(_param[1])-1 && !((floor(_param[11])) % 2) sound_play(_param[2],false,0,0.05,.9);//floor(_param[11] + _param[4]) > floor(_param[11]) sound_play(_param[2]);
				break;
			case GUI.SCROLLBOX: //[GUI.SCROLLBOX,_str,_x,_y,_w,_h,_sep,_color,_font,_line,_parsed_string];
				if alive_time == 1 _param[10] = parse_lines(_param[1],_param[4],_param[5],_param[6],_param[9]);
				if win_active == _i with oPlayer {
						if up_held == 1 || down_held == 1 {
						_param[9] += (up_held == 1) - (down_held == 1);
					}
				}
				_param[9] = clamp(_param[9],0,100);
				_param[10] = parse_lines(_param[1],_param[4],_param[5],_param[6],_param[9]);
				// 	if up_held == 1 || down_held == 1 || attack_held == 1 {
				// 		_param[9] += (up_held == 1) - (down_held == 1);
				// 		_param[9] = clamp(_param[9],0,100);
				// 		_param[10] = parse_lines(_param[1],_param[4],_param[5],_param[6],_param[9]);
				// 	}
				// }
				break;
			case GUI.BUTTON: //[GUI.BUTTON,_type,_button_strip,_x,_y,_state];
				if mb_l_click && _param[5] { //On Left Click do something
					// print("AAAA");
					switch _param[1] {
						case SM.PROP:
							array_push(active_win,[[mouse_x-view_get_xview(),mouse_y-view_get_yview(),noone,0],array_clone_deep(win_data[3])]); //Properties box
							break;
						case SM.DEL:
							if array_length_1d(debug_selected) > 0 {
								with debug_selected[0] {
									visible = false;
									destroyed = true;
									instance_destroy(self);
								}
								debug_selected = array_cut(debug_selected,0);
							}
							break;
						case SM.EXPORT:
							cmd_command(["export"],"",false);
							break;
						case SM.ADD:
							cmd_command(["new"],"",true);
							// var _hitbox_index = 1;
							// var _hit;
							// with debug_selected[0] {
							// 	while get_hitbox_value(attack,_hitbox_index,HG_LIFETIME) != 0 && get_hitbox_value(attack,_hitbox_index,HG_HITBOX_X) != 0 _hitbox_index++;
							// 	_hit = create_hitbox(attack,1,_x,_y);
							// 	_hit.hbox_num = _hitbox_index;
							// }
							// debug_selected[0] = _hit;
							// cmd_command(["set","hbox_num",string(_hitbox_index)],"",true);
							// cmd_print("","Added Hitbox "+string(_hitbox_index)+"...");
							break;
						case SM.SAVE:
							// print("save");
							cmd_command(["s_state","0"],"",false);
							break;
						case SM.LOAD:
							// print("load");
							cmd_command(["l_state","0"],"",false);
							break;
					}
					update_select = true;
					end_window(_i);
					_i--;
					break;
				}
				// print(in_rect(mouse_x,mouse_y,_x+_param[3],_y+_param[4],_x+_param[3]+sprite_get_width(_param[2])*2,_y+_param[4]+sprite_get_height(_param[2])*2));
				// if mb_l_click && _param[5] { //On Left Click do something
				// 	// print("AAAA");
				// 	switch _param[1] {
				// 		case SM.PROP:
				// 			print("AAAAA");
				// 			array_push(active_win,[[mouse_x-view_get_xview(),mouse_y-view_get_yview(),noone,0],array_clone_deep(win_data[3])]); //Properties box
				// 			break;
				// 	}
				// }
				break;
			case GUI.SPRSCR: //scroll the sprite  [GUI.SPRSCR,_sprite,_x,_y,_rate];
				with oPlayer {
					if up_held _param[3] -= _param[4][1];
					if down_held _param[3] += _param[4][1];
				}
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
			// win_alpha = .5+(win_active == _i)*.5;
			break;
		case WIN.AREAFADE:
			win_alpha = _element[3][1];
			break;
		case WIN.QUESTLIST:
			win_alpha = _element[1][1];
			// draw_sprite_ext(sprite_get("gui_test"),0,_x,_y,2,2,0,c_white,win_alpha);
			draw_sprite_ext(asset_get("empty_sprite"),0,_x,_y,2,2,0,c_white,win_alpha);
			// draw_set_alpha(.6);
			// draw_rectangle_color(_x,_y,_x+320,_y+96,c_black,c_black,c_black,c_black,false);
			// draw_set_alpha(1);
			for (var _a = 0; _a < array_length_1d(_quests); _a++) {
				if _quests[_a][0] > array_length(_quests[_a])-1 {
					draw_sprite_ext(quest_complete_spr,quest_complete_spr_num*2*quest_complete_timer/quest_complete_timer_max,_x,_y+_a*_element[1][4],2,2,0,c_white,win_alpha);
					continue;
				}
				draw_sprite_ext(quest_outline_spr ,0,_x,_y+_a*_element[1][4],2,2,0,c_white,win_alpha); //Get backdrop working
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
				//Command character flash text
				if !(floor(alive_time/0.1) % 2) draw_text_drop(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,win_alpha);
				else draw_text_drop(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,win_alpha);
				// if !(floor(alive_time/_param[4]) % 2) draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],win_alpha);
				// else draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],win_alpha);
				break;
			case GUI.DIALOGBOX_TRIM: //VERY HEAVY USE SPARINGLY
				//_param[11] += _param[4];
				draw_set_font(_param[10]);
				var _offset =  2;
				// if floor(_param[11]/4) % 2 {
					
				// 	draw_text_ext_transformed_color(_x+_param[5],_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5],_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6],string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6],string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				// 	draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],win_alpha);
				// 	break;
				// }
				draw_text_ext_transformed_color(_x+_param[5],_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5],_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6],string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6],string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6]+_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]+_offset,_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
					draw_text_ext_transformed_color(_x+_param[5]-_offset,_y+_param[6]-_offset,string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,c_black,c_black,c_black,c_black,win_alpha);
				draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],win_alpha);
				break;
			case GUI.SCROLLBOX: //Good lord help me - not actually that bad :)
				draw_set_font(_param[8]);
				draw_text_ext_transformed_color(_x+_param[2],_y+_param[3],_param[10],_param[6],_param[4],1,1,0,_param[7],_param[7],_param[7],_param[7],win_alpha);
				break;
			case GUI.BUTTON: //[GUI.BUTTON,_type,_button_strip,_x,_y,_state,_name];
				draw_set_font(asset_get("fName"));
				if in_rect(mouse_x,mouse_y,_x+_param[3],_y+_param[4],_x+_param[3]+sprite_get_width(_param[2])*2,_y+_param[4]+sprite_get_height(_param[2])*2) _param[5] = 1;
				else _param[5] = 0;
				draw_sprite_ext(_param[2],_param[5],_x+_param[3],_y+_param[4],2,2,0,c_white,1);
				draw_text_drop(_x+_param[3]+32,_y+_param[4]+8,_param[6],16,100,1,1,0,1);
				break;
			case GUI.SPRSCR: //scroll the sprite  [GUI.SPRSCR,_sprite,_x,_y,_rate];
				//Background
				draw_set_alpha(.6);
				draw_rectangle_color(view_get_xview(),view_get_yview(),view_get_xview()+view_get_wview(),view_get_yview()+view_get_hview(), c_black,c_black,c_black,c_black,false);
				draw_set_alpha(1);
				//Sprite Overlay
				draw_sprite_ext(_param[1],0,_param[2],_param[3],4,4,0,c_white,1);
				break;
		}
	}
}
//print_debug(_windows);
return true;

#define new_textbox(_default_string,_x,_y,_w,_sep,_color,_font)
return [GUI.TEXTBOX,_default_string,_x,_y,_w,_sep,_color,_font];
#define new_sprite(_sprite,_x,_y)
return [GUI.SPRITE,_sprite,_x,_y];
#define new_dialogbox(_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font)
var _char_vis = 0;
return [GUI.DIALOGBOX,_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font,_char_vis];
#define new_trim_dialogbox(_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font)
var _char_vis = 0;
return [GUI.DIALOGBOX_TRIM,_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font,_char_vis];
#define new_scrollbox(_str,_x,_y,_w,_h,_sep,_color,_font)
var _line = 0;
var _parsed_string = "";
return [GUI.SCROLLBOX,_str,_x,_y,_w,_h,_sep,_color,_font,_line,_parsed_string];
#define new_listbox(_choices,_select_sprite,_sound,_x,_y,_w,_sep,_color,_font)

return [GUI.LISTBOX,_choices,_select_sprite,_sound,_x,_y,_w,_sep,_color,_font];
#define new_button(_type,_button_strip,_x,_y,_name)
var _state = 0;
return [GUI.BUTTON,_type,_button_strip,_x,_y,_state,_name];
#define new_varcont(_var)
var _s = [GUI.VARCONT];
for (var _i = 0;_i < array_length_1d(_var);_i++) array_push(_s,_var[_i]);
return _s;
#define new_sprscr(_sprite,_x,_y,_rate)
return [GUI.SPRSCR,_sprite,_x,_y,_rate];
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
	draw_debug_text(cursor_x,cursor_y+20,"["+string(_cursor_grid[1][0])+","+string(_cursor_grid[1][1])+"]:["+string(floor((_cursor_grid[0][0])/16))+","+string(floor((_cursor_grid[0][1])/16))+"]:["+string((_cursor_grid[0][0]) % 16)+","+string((_cursor_grid[0][1]) % 16)+"]");
	draw_debug_text(cursor_x,cursor_y+36,string([cursor_x,cursor_y]));
	draw_debug_text(cursor_x,cursor_y+52,string([mouse_x,mouse_y]));
}
return true;
#define logic_cursor()

switch mouse_button {
	case 1: //Left-Click
		//keyboard_string = "";
		if !mb_l_click { //on click
			mb_l_click = true;
			click_x = mouse_x;
			click_y = mouse_y;
			
			//print_debug("MB1 CLICK!");
			
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
			
			
			
		}
		//print_debug(string(win_active));
		if win_drag != -1 {
			active_win[@win_drag][@0][@0] += cursor_x - cursor_x_p;
			active_win[@win_drag][@0][@1] += cursor_y - cursor_y_p;
		}
		break;
	case 2:
		if !mb_r_click { //on click
		var _debug_click = 0;
			while array_length_1d(cursor_drag_offset_x) < array_length_1d(debug_selected) {
				array_push(cursor_drag_offset_x, 0);
				array_push(cursor_drag_offset_y, 0);
				_debug_click = 1;
			}
			for (var _i = 0;_i < array_length_1d(debug_selected);_i++) {
				if instance_exists(debug_selected[_i]) {
					cursor_drag_offset_x[@_i] = mouse_x-debug_selected[_i].x;
					cursor_drag_offset_y[@_i] = mouse_y-debug_selected[_i].y;
					_debug_click = 1;
				} else debug_selected = array_cut(debug_selected,_i);
			}
			//Debug Points
			if !_debug_click { 
				for (var _i = 0; _i < array_length_1d(debug_point_array); _i++) { //Try to find a debug point under the cursor
					if point_distance(mouse_x,mouse_y,debug_point_array[_i].x,debug_point_array[_i].y) < debug_point_array[_i].r {
						debug_point_array = array_cut(debug_point_array,_i);
						_debug_click = 1;
						break;
					}
				}
				if !_debug_click { //If there wasn't a debug point under the cursor
					array_push(debug_point_array,new_debug_point(mouse_x,mouse_y,debug_point_r,debug_point_color));
				}
			}
		}
		mb_r_click = true;
		for (var _i = 0;_i < array_length_1d(debug_selected);_i++) {
			if instance_exists(debug_selected[_i]) {
				debug_selected[_i].x = floor((mouse_x-cursor_drag_offset_x[_i])/2)*2+1;
				debug_selected[_i].y = floor((mouse_y-cursor_drag_offset_y[_i])/2)*2+1;
			} else debug_selected = array_cut(debug_selected,_i);
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

#define new_debug_point(_mouse_x,_mouse_y,_debug_point_r,_debug_point_color)
var _new_point = {
	x: _mouse_x,
	y: _mouse_y,
	r: _debug_point_r,
	c: _debug_point_color
};
return _new_point;

#define draw_debug_points()
// lmb_debug_point = {
// 	x: 0, //x position of the point
// 	y: 0,
// 	r: 10,
// 	color: $aaaa22
	
// };
var _debug_grid = [];
for (var _i = 0; _i < array_length_1d(debug_point_array); _i++) {
	draw_circle_color(debug_point_array[_i].x-view_get_xview(),debug_point_array[_i].y-view_get_yview(),debug_point_array[_i].r,debug_point_array[_i].c,debug_point_array[_i].c,false);
	_debug_grid = grid_to_cell([debug_point_array[_i].x+64,debug_point_array[_i].y+64]);
	draw_debug_text(debug_point_array[_i].x-view_get_xview(),debug_point_array[_i].y-view_get_yview(),"["+string(_debug_grid[1][0])+","+string(_debug_grid[1][1])+"]:["+string(floor((_debug_grid[0][0])/16))+","+string(floor((_debug_grid[0][1])/16))+"]:["+string((_debug_grid[0][0]) % 16)+","+string((_debug_grid[0][1]) % 16)+"]");
	draw_debug_text(debug_point_array[_i].x-view_get_xview(),debug_point_array[_i].y-view_get_yview()+16,"["+string(debug_point_array[_i].x)+","+string(debug_point_array[_i].y)+"]");
}

return true;

#define cmd_command(_str_a,_str_raw,_sup)
sup_out = _sup;
var _with_obj = self;
_str_a[@0] = string_replace(_str_a[0],cmd_char,"");
for (var _i = 0;_i < array_length_1d(_str_a);_i++) { //Convert to values
	if string(_str_a[_i]) != _str_a[_i] blank = 0;
	// else if string_count("sprite:",_str_a[_i]) > 0 _str_a[@_i] = sprite_get(string_replace(string_replace(_str_a[_i],"sprite:'",""),"'",""));
	// else if string_count("asset:",_str_a[_i]) > 0 _str_a[@_i] = asset_get(string_replace(string_replace(_str_a[_i],"asset:'",""),"'",""));
	// else if string_count("sound:",_str_a[_i]) > 0 _str_a[@_i] = sound_get(string_replace(string_replace(_str_a[_i],"sound:'",""),"'",""));
	else if string_count("r:",_str_a[_i]) > 0 _str_a[@_i] = resource_get(string_replace(string_replace(_str_a[_i],"r:'",""),"'",""));
	else if string_count("v:",_str_a[_i]) > 0 _str_a[@_i] = variable_instance_get(self,string_replace(string_replace(_str_a[_i],"v:'",""),"'",""));
	else if string_count("d:",_str_a[_i]) > 0 _str_a[@_i] = real(string_replace(string_replace(_str_a[_i],"d:'",""),"'",""));
}
// print(_str_a);
with _with_obj {
	switch _str_a[0] {
		// case "action_import":
		// 	var _action = get_string("Insert the code for the action you want to import!","");
		// 	break;
		case "acts": //Display the list of action IDs active
			var action_id_list = "List of Actions running ID|Time :
";
			with action_manager {
				for (var i = 0; i < array_length_1d(cur_actions); i++) {
					action_id_list += string(cur_actions[3])+"|"+string(cur_actions[i][4])+", ";
				}
			}
			cmd_print(_str_raw,action_id_list);
			break;
		case "act_play":
			with action_manager array_push(action_queue, [room_id, scene_id, real(_str_a[1])]);
			break;
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
			with obj_stage_article debug = other.debug;
			with obj_stage_article_platform debug = other.debug;
			with obj_stage_article_solid debug = other.debug;
			cmd_print(_str_raw,"Lucid toggled; WILL desync!");
			break;
		// case "freecam":
		// 	if !debug {
		// 		cmd_print(_str_raw,"Error: Need to be LUCID");
		// 		break;
		// 	}
		// 	cmd_freecam = !cmd_freecam;
		// 	// follow_player.visible = !visible;
		// 	cmd_print(_str_raw,"Toggled Freecam Mode (WIP)");
		// 	break;
		case "freeze": //Enemy does not do inputs
			with obj_stage_article if num == 6 freeze = !freeze;
			cmd_print(_str_raw,"Controlers have been toggled for NPCs");
			break;
		case "clone":
		case "c":
			var _clone;
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) {
				print("Pre-Spawn");
				switch (debug_selected[_i].object_index) {
					case obj_stage_article:
						_clone = instance_create(debug_selected[_i].x, debug_selected[_i].y, "obj_stage_article",debug_selected[_i].num);
						break;
					case obj_stage_article_platform:
						_clone = instance_create(debug_selected[_i].x, debug_selected[_i].y, "obj_stage_article_platform",debug_selected[_i].num);
						break;
					case obj_stage_article_solid:
						_clone = instance_create(debug_selected[_i].x, debug_selected[_i].y, "obj_stage_article_solid",debug_selected[_i].num);
						break;
				}
				print("Post-Spawn");
				var _c_v_names = variable_instance_get_names(debug_selected[_i]);
				for (var _j = 0; _j < array_length_1d(_c_v_names); _j++) {
					if _c_v_names[_j] == "id" continue; //Don't override id
					variable_instance_set(_clone, _c_v_names[_j],variable_instance_get(debug_selected[_i],_c_v_names[_j]));
				}
				print("Post-Var set");
			}
			cmd_print(_str_raw,"Cloned Selected Articles");
			break;
		case "destroy":
		case "d":
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) {
				instance_destroy(debug_selected[_i]);
			}
			cmd_print(_str_raw,"Destroyed Selected");
			break;
		case "clear":
			cmd_output = "";
			debug_point_array = [];
			cmd_print(_str_raw,"Cleared LD Output and Debug Points");
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
		case "diff":
			var _output = "";
			for (var _i = 1; _i < array_length(debug_point_array); _i++)
			{
				_output += "["+string(debug_point_array[_i].x-debug_point_array[_i-1].x) + "," + string(debug_point_array[_i].y-debug_point_array[_i-1].y)+"]"+" : ";
			}
			cmd_print(_str_raw,"Differences between sequential debug points:
" + _output);
			break;
		case "deselect":
		case "ds":
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) {
				with debug_selected[_i] {
					debug_info = 0;
					depth = og_depth;
				}
			}
			debug_selected = [];
			break;
		case "export":
			for(var _a = 0; _a < array_length(debug_selected); _a++) {
				if !instance_exists(debug_selected[_a]) {
					debug_selected = array_cut(debug_selected,_a);
					_a--;
				}
			}
			for(var _a = 0; _a < array_length(debug_selected); _a++) {
				var _art = debug_selected[_a];
				var _article_type = (_art.object_index == obj_stage_article)*0+
									(_art.object_index == obj_stage_article_platform)*1+
									(_art.object_index == obj_stage_article_solid)*2;
				var _art_sv = "[";
				//Doesn't convert to a usable name, gotta manually replace it :(
				if real((_article_type == 1 || _article_type == 2) && _art.spawn_variables[0]) > 1000 { //Propbably a sprite
					_art_sv += "sprite_get("+sprite_get_name(real(_art.spawn_variables[0]))+"),";
				} //else if string(_art.spawn_variables[0]) == _art.spawn_variables[0] _art_sv += "'"+string(_art.spawn_variables[0])+"',";
				else _art_sv += string(_art.spawn_variables[0])+",";
				for (var _i = 1; _i < array_length(_art.spawn_variables);_i++) {
					_art_sv += string(_art.spawn_variables[_i])+",";
				}
				_art_sv += "]";
				var _art_pos = grid_to_cell([_art.x+64,_art.y+64]);
				var _ret = get_string("(ctrl+A) Copy the below into the room ["+string(_art_pos[1][0])+","+string(_art_pos[1][1])+"] load script (user_event1)...",
				"["+string(_art.num)+","+string(_art_pos[0][0]/16)+","+string(_art_pos[0][1]/16)+","+string(_article_type)+","+string(_art.og_depth)+","+_art_sv+",[0,0]"+"], // Exported from Lucid Dream");
			}
			cmd_print(_str_raw,"Exporting Articles into ROOM Format...");
			break;
		case "get":
			if array_length_1d(_str_a) < 2 {
				cmd_print(_str_raw,"Error: 1 Arg Req.");
				break;
			}
			if array_length_1d(debug_selected) == 0 {
				cmd_print(_str_raw, _str_a[1]+": "+string(variable_instance_get(self,_str_a[1])));
				break;
			}
			for (var _i = 0; _i < array_length_1d(debug_selected);_i++) if (_str_a[1] in debug_selected[_i]) {
				var _obj_name = debug_selected[_i].object_index;
				switch debug_selected[_i].object_index {
					case 3:
						_obj_name = "oPlayer";
						break;
					case 6:
						_obj_name = "pHitBox";
						break;
				}
				if _str_a[1] == "sprite_index" {
					cmd_print(_str_raw, _str_a[1]+": "+sprite_get_name(variable_instance_get(debug_selected[_i],_str_a[1])));
					break;
				}
				cmd_print(_str_raw,string(_obj_name)+"<"+string(debug_selected[_i])+">."+_str_a[1]+" = "+string(variable_instance_get(debug_selected[_i],_str_a[1])));
				break;
			}
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
		case "last":
		case "l":
			var _shift = 1;
			if array_length_1d(_str_a) > 1 _shift = _str_a[1];
			var _com;
			var _coma = ["l"];
			while (_coma[0] == cmd_char+"l" || _coma[0] == cmd_char+"last"
				|| _coma[0] == "l" || _coma[0] == "last") { //Don't do past last commands :P
				_com = console_com_hist[array_length_1d(console_com_hist)-_shift];
				_coma = string_parse(_com," ");
				_shift += 1;
			}
			cmd_command(_coma,_com,false);
			cmd_print(_str_raw,"Repeated the last command");
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
		case "new": //hitbox spawn
			var _hitbox_index = 1;
			var _hit;
			with debug_selected[0] {
				while get_hitbox_value(attack,_hitbox_index,HG_LIFETIME) != 0 && get_hitbox_value(attack,_hitbox_index,HG_HITBOX_X) != 0 _hitbox_index++;
				_hit = create_hitbox(attack,1,_x,_y);
				_hit.hbox_num = _hitbox_index;
			}
			debug_selected[0] = _hit;
			cmd_command(["set","hbox_num",string(_hitbox_index)],"",true);
			cmd_print("","Added Hitbox "+string(_hitbox_index)+"...");
			break;
		case "peace": //Make enemies not attack
			with obj_stage_article if num == 6 peace = !peace;
			cmd_print(_str_raw,"Aethers' rivalry toggled");
			break;
		case "plat": //shortcut for creating a platform
			if array_length_1d(_str_a) < 2 {
				cmd_print(_str_raw,"Error: Resource Name Req.");
				break;
			}
			cmd_command(["spawn","1","1","9","r:'"+_str_a[1]+"'"],"",true);
			cmd_print(_str_raw,"Spawned platform");
			break;
		case "s_state": //Save Player States
			var _variable_names;
			var _state_num = state_cur;
			if array_length_1d(_str_a) > 1 _state_num = real(_str_a[1]);
			with oPlayer {
				while array_length_1d(state_array) < _state_num+1 state_array = array_push(state_array, []);
				state_array[_state_num] = [];
				state_array[_state_num] = array_push(state_array[_state_num], ["x",x]);
				state_array[_state_num] = array_push(state_array[_state_num], ["y",y]);
				_variable_names = variable_instance_get_names(id);
				for (var _i = 0; _i < array_length_1d(_variable_names);_i++) {
					if !(_in(_variable_names[_i],other.excluded_vars)) state_array[_state_num] = array_push(state_array[_state_num],[_variable_names[_i],variable_instance_get(id,_variable_names[_i])]);
					// if !(phrase_in(_variable_names[_i],other.keyword_ban)) state_array[_state_num] = array_push(state_array[_state_num],[_variable_names[_i],variable_instance_get(id,_variable_names[_i])]);
				}
				while array_length_1d(hurtbox_array) < _state_num+1 hurtbox_array = array_push(hurtbox_array, []);
				with pHurtBox {
					if playerID == other.id with other {
						hurtbox_array[_state_num] = [];
						// hurtbox_array[_state_num] = array_push(hurtbox_array[_state_num], ["sprite_index",sprite_index]);
						// hurtbox_array[_state_num] = array_push(hurtbox_array[_state_num], ["mask_index",mask_index]);
						_variable_names = variable_instance_get_names(other);
						// print(_variable_names);f 
						for (var _i = 0; _i < array_length_1d(_variable_names);_i++) {
							hurtbox_array[_state_num] = array_push(hurtbox_array[_state_num],[_variable_names[_i],variable_instance_get(other,_variable_names[_i])]);
						}
					}
				}
				while array_length_1d(hitbox_array) < _state_num+1 hitbox_array = array_push(hitbox_array, []); //Expand
				hitbox_array[@_state_num] = []; //Reset
				with pHitBox {
					if player_id == other.id with other {
						hitbox_array[@_state_num] = array_push(hitbox_array[_state_num], []); //New Hitbox
						var _end = array_length_1d(hitbox_array[_state_num])-1;
						hitbox_array[@_state_num][@_end] = [];
						hitbox_array[@_state_num][@_end] = array_push(hitbox_array[_state_num][_end],["attack",other.attack]);
						hitbox_array[@_state_num][@_end] = array_push(hitbox_array[_state_num][_end],["hbox_num",other.hbox_num]);
						_variable_names = variable_instance_get_names(other);
						for (var _i = 0; _i < array_length_1d(_variable_names);_i++) {
							hitbox_array[@_state_num][@_end] = array_push(hitbox_array[_state_num][_end],[_variable_names[_i],variable_instance_get(other,_variable_names[_i])]);
						}
					}
				}
				art_array_save(obj_article1, article1_array,_state_num);
				art_array_save(obj_article2, article2_array,_state_num);
				art_array_save(obj_article3, article3_array,_state_num);
				art_array_save(obj_article_platform, articlep_array,_state_num);
				art_array_save(obj_article_solid, articles_array,_state_num);
				// while array_length_1d(article1_array) < _state_num+1 article1_array = array_push(article1_array, []); //Expand
				// article1_array[@_state_num] = []; //Reset
				// with obj_article1 {
				// 	if player_id == other.id {
				// 		other.article1_array[@_state_num] = array_push(other.article1_array[_state_num], []); //New Article
				// 		var _end = array_length_1d(other.article1_array[_state_num])-1;
				// 		other.article1_array[@_state_num][@_end] = [];
				// 		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["num",num]);
				// 		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["x",x]);
				// 		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["y",y]);
				// 		_variable_names = variable_instance_get_names(self);
				// 		for (var _i = 0; _i < array_length_1d(_variable_names);_i++) {
				// 			other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],[_variable_names[_i],variable_instance_get(self,_variable_names[_i])]);
				// 		}
				// 	}
				// }
				
				// print(article1_array);
			}
			cmd_print(_str_raw,"Saved State "+string(_state_num));
			break;
		case "l_state": //Load Player States
			var _state_num = 0;
			var _i = 0;
			if array_length_1d(_str_a) > 1 _state_num = real(_str_a[1]);
			with pHitBox instance_destroy(self);
			with obj_article1 instance_destroy(self);
			with obj_article2 instance_destroy(self);
			with obj_article3 instance_destroy(self);
			with obj_article_platform instance_destroy(self);
			with obj_article_solid instance_destroy(self);
			with oPlayer {
				with pHurtBox {
					if player == other.player with other {
						_i = 0;
						repeat array_length_1d(hurtbox_array[_state_num]) variable_instance_set(other,hurtbox_array[_state_num][_i][0],hurtbox_array[_state_num][_i++][1]);
					}
				}
				if array_length_1d(state_array) == 0 break;
				_i = 0;
				var _j = 0;
				
				repeat array_length_1d(hitbox_array[_state_num]) {
					_j = 0;
					// var _end = array_length_1d(hitbox_array[_state_num])-1;
					// if array_length_1d(hitbox_array[_state_num][_end]) > 0 {
					var _id = create_hitbox(hitbox_array[_state_num][_i][0][1],hitbox_array[_state_num][_i][1][1],0,0);
					repeat array_length_1d(hitbox_array[_state_num][_i]) variable_instance_set(_id,hitbox_array[_state_num][_i][_j][0],hitbox_array[_state_num][_i][_j++][1]);
					_i++;
					// }
				}
				_i = 0;
				repeat array_length_1d(state_array[_state_num]) variable_instance_set(self,state_array[_state_num][_i][0],state_array[_state_num][_i++][1]);
				art_array_load("obj_article1",article1_array,_state_num);
				art_array_load("obj_article2",article2_array,_state_num);
				art_array_load("obj_article3",article3_array,_state_num);
				art_array_load("obj_article_platform",articlep_array,_state_num);
				art_array_load("obj_article_solid",articles_array,_state_num);
				// _i = 0;
				// repeat array_length_1d(article1_array[_state_num]) {
				// 	_j = 0;
				// 	var _id = instance_create(floor(article1_array[_state_num][_i][1][1]),floor(article1_array[_state_num][_i][2][1]),"obj_article1",article1_array[_state_num][_i][0][1]);
				// 	repeat array_length_1d(article1_array[_state_num][_i]) variable_instance_set(_id,article1_array[_state_num][_i][_j][0],article1_array[_state_num][_i][_j++][1]);
				// 	_i++;
				// }
				
			}
			
			cmd_print(_str_raw,"Loaded State "+string(_state_num));
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
		case "s":
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
				if string_count("'",string(_str_a[2])) == 0 {
					variable_instance_set(debug_selected[_i],_str_a[1],_str_a[2]);
				} else variable_instance_set(debug_selected[_i],_str_a[1],string_digits(_str_a[2]));
			}
			cmd_print(_str_raw,"Set "+_str_a[1]+" to "+string(_str_a[2])+" on selected.");
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
			acts
			act_play
			<selected> clone|c
			<selected> debug_output
			diff
			<selected> destroy|d
			<selected> export
			god
			help
			kill
			list [num, selected:self]
			lucid
			plat <sprite_name>
			<selected> man <num>
			save_output
			select [id]
			<selected> set|s [var] [value]
			spawn [num] [type] [depth] <arg0-7>
			");
			break;
		case "":
			break;
		default:
			cmd_print(_str_raw,"Error: Command "+_str_a[0]+" not found. Type 'help' for command list.");
			break;
	}
}
sup_out = false;
array_push(console_com_hist,_str_raw);

return true;

#define cmd_print(_cmd_str,_str)
if sup_out return true;
var _str1 = "";
if _cmd_str == "" _str1 = "";
else _str1 = break_string(_cmd_str,cmd_w,10000,0) + "
";
var _str2 = "";
if _str == "" _str2 = "
";
else _str2 = break_string(_str,cmd_w,10000,0) + "
";
cmd_output += _str1 + _str2;
if !cmd_save_output cmd_output = parse_lines(cmd_output,cmd_w,cmd_h,16,-1);
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
#define in_rect(_x,_y,_x1,_y1,_x2,_y2)
// if abs(_x-_xp) < abs(_x-_x2) && abs(_y-_yp) < abs(_y-_y2) return true;
if _x < _x2 && _x > _x1 && _y < _y2 && _y > _y1 return true;
return false;
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

#define string_split(s,d) //Ty YAL for the great blog post!
// var s = argument[0], d = argument[1];
// var rl = global.string_split_list;
var rl = [];
var p = string_pos(d, s);
var dl = string_length(d);

if (dl) while (p) {
    p -= 1;
    // ds_list_add(rl, string_copy(s, 1, p));
    array_push(rl, string_copy(s, 1, p));
    s = string_delete(s, 1, p + dl);
    p = string_pos(d, s);
}
// ds_list_add(rl, s);

return rl;

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
#define _in(_val,_array) //If a value is in an array
// for (var _i = 0; _i < array_length_1d(_array);_i++) if _val == _array[_i] return true;
var _i = 0;
repeat array_length_1d(_array) if _val == _array[_i++] return true;

return false;

#define a_vector(_l,_a)
var _xa = _l*dcos(_a);
var _ya = -_l*dsin(_a);
return [_xa,_ya];
#define keyboard_has(_ch)
if string_count(_ch,keyboard_string) {
	keyboard_string = "";
	return true;
}
return false;
#define array_clone_deep(_array)
var _array_d_clone = [];
for(var _i = 0;_i < array_length_1d(_array);_i++) {
	if array_length_1d(_array[_i]) > 0 array_push(_array_d_clone,array_clone_deep(_array[_i]));
	else array_push(_array_d_clone,_array[_i]);
}
return _array_d_clone;

#define art_array_save(article_obj, article1_array,_state_num)
while array_length_1d(article1_array) < _state_num+1 article1_array = array_push(article1_array, []); //Expand
article1_array[@_state_num] = []; //Reset
with article_obj {
	if player_id == other.id {
		other.article1_array[@_state_num] = array_push(other.article1_array[_state_num], []); //New Article
		var _end = array_length_1d(other.article1_array[_state_num])-1;
		other.article1_array[@_state_num][@_end] = [];
		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["num",num]);
		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["x",x]);
		other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],["y",y]);
		_variable_names = variable_instance_get_names(self);
		for (var _i = 0; _i < array_length_1d(_variable_names);_i++) {
			other.article1_array[@_state_num][@_end] = array_push(other.article1_array[_state_num][_end],[_variable_names[_i],variable_instance_get(self,_variable_names[_i])]);
		}
	}
}
return article1_array;

#define art_array_load(article_obj,article1_array,_state_num)
var _i = 0;
var _j = 0;

repeat array_length_1d(article1_array[_state_num]) {
	_j = 0;
	var _id = instance_create(floor(article1_array[_state_num][_i][1][1]),floor(article1_array[_state_num][_i][2][1]),article_obj,article1_array[_state_num][_i][0][1]);
	repeat array_length_1d(article1_array[_state_num][_i]) variable_instance_set(_id,article1_array[_state_num][_i][_j][0],article1_array[_state_num][_i][_j++][1]);
	_i++;
}
return;
#define grid_to_cell(_pos) //Translate basegame grid system coordinates to in cell coordinates
with room_manager {
	_pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];
	var _sub_pos_x = [(_pos[0] % ((cell_dim[0]-grid_offset)*cell_size)),floor(_pos[0]/((cell_dim[0]-grid_offset)*cell_size))];
	var _sub_pos_y = [(_pos[1] % ((cell_dim[1])*cell_size)),floor(_pos[1]/((cell_dim[1])*cell_size))];
	if sign(_sub_pos_x[0]) == -1 _sub_pos_x[0] += ((cell_dim[0]-grid_offset)*cell_size); 
	if sign(_sub_pos_y[0]) == -1 _sub_pos_y[0] += ((cell_dim[1])*cell_size);
    return [[_sub_pos_x[0], //Subcell
		    _sub_pos_y[0]],
		   [_sub_pos_x[1], //Cell
			_sub_pos_y[1]]];
}

#define draw_text_drop(_x,_y,_str,_sep,_w,_x1,_y1,_ang,_alp)

draw_text_ext_transformed_color(_x+2,_y+2,_str,_sep,_w,_x1,_y1,_ang,c_black,c_black,c_black,c_black,_alp);
draw_text_ext_transformed_color(_x,_y,_str,_sep,_w,_x1,_y1,_ang,c_white,c_white,c_white,c_white,_alp);