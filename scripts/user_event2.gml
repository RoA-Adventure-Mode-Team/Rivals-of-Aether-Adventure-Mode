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
	QUESTLIST
}

enum GUI {
	SPRITE,
	TEXTBOX,
	DIALOGBOX,
	BUTTON,
	VARCONT,
	EXIT
}

if win_call == 0 {
	if mouse_x_i != mouse_x || mouse_y_i != mouse_y cursor_visible = true;
	with obj_stage_main {
		if cursor_visible && debug do_cursor();
		draw_windows(); //Draw Objects
		if cursor_visible && debug draw_sprite_ext(cursor_sprite_i, cursor_index, cursor_x, cursor_y, 1, 1, 0, c_white, 1); //Draw cursor over everything
	}
	exit;
}

if win_call == 1 with obj_stage_main { //Load Data
	var i = 0;
	var _string ="";
	win_add(i++,[WIN.DEBUG,
		new_varcont([_string,0,0,0,0,0]),
		new_sprite(sprite_get("gui_test"),0,0),
		new_textbox("GUI 2.0 TITLE",4,2,200,16,c_white,asset_get("fName")),
		//new_dialogbox("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",asset_get("mfx_back"),"_",0.4,4,16,200,12,c_white,asset_get("fName"))
		new_textbox("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",4,18,238,12,c_white,asset_get("fName")),
		new_dialogbox(_string,noone,"_",0.4,4,100,238,12,c_white,asset_get("fName"))
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
	if debug with obj_stage_main logic_cursor();
	with obj_stage_main logic_windows(); 
	
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
			if win_active == _i {
				//print_debug("DB Active: "+string(_i));
				if keyboard_string != "" {
					_element[@5][@1] += keyboard_string;
					keyboard_string = "";
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
			draw_sprite_ext(sprite_get("gui_test"),0,_x,_y,2,2,0,c_white,win_alpha);
			for (var _a = 0; _a < array_length_1d(_quests); _a++) {
				draw_sprite_ext(_quests[_a][_quests[_a][0]][2],0,_x,_y,2,2,0,c_white,win_alpha); //Get Logo Working
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
with action_manager array_push(end_action_index,other.active_win[_i][0][2]);
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
	draw_debug_text(cursor_x,cursor_y,"["+string(_cursor_grid[1][0])+","+string(_cursor_grid[1][0])+"]:["+string(floor((_cursor_grid[0][0])/16))+","+string(floor((_cursor_grid[0][1])/16))+"]:["+string((_cursor_grid[0][0]) % 16)+","+string((_cursor_grid[0][1]) % 16)+"]");
	draw_debug_text(cursor_x,cursor_y+16,string([cursor_x,cursor_y]));
	draw_debug_text(cursor_x,cursor_y+32,string([mouse_x,mouse_y]));
}
return true;
#define logic_cursor()
if mouse_button == 1 {
	keyboard_string = "";
	if !mb_l_click { //on click
		// print_debug("MB1 CLICK!");
		
		//Debug View Objects
		with obj_stage_article_solid {
			if collision_point(other.mouse_x,other.mouse_y,self,true,false) != noone debug_info = !debug_info;
			depth = (-100*debug_info)+(og_depth*(!debug_info));
			// if debug_info draw_debug_info();
		}
		with obj_stage_article_platform {
			if collision_point(other.mouse_x,other.mouse_y,self,true,false) != noone debug_info = !debug_info;
			depth = (-100*debug_info)+(og_depth*(!debug_info));
			// if debug_info draw_debug_info();
		}
		with obj_stage_article {
			if (!("static" in self) || !static) && collision_point(other.mouse_x,other.mouse_y,self,true,false) != noone debug_info = !debug_info;
			depth = (-100*debug_info)+(og_depth*!debug_info);
			// if debug_info draw_debug_info();
		}
		
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
	}
	//print_debug(string(win_active));
	if win_drag != -1 {
		active_win[@win_drag][@0][@0] += cursor_x - cursor_x_p;
		active_win[@win_drag][@0][@1] += cursor_y - cursor_y_p;
	}
	mb_l_click = true;
} else {
	if mb_l_click { //on release
		win_drag = -1;
		//print_debug("MB1 UN CLICK!8");
	}
	mb_l_click = false;
}
// with obj_stage_article_solid if collision_point(other.mouse_x,other.mouse_x,self,true,true) != noone {
// 	print("OVERLAP");
// 	draw_debug_info();
// }
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
return true;
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
#define break_string(str, sep, w) //From Soup :)
var final_str = "";
var len = string_length(final_str);
for (var i = 1; i <= string_length(str); i++) {
    var prev_char =  string_char_at(str,i-(i > 0));
    var char = string_char_at(str,i);
    if string_width_ext(final_str + char, sep, w) > w {
        final_str = string_delete(final_str,len,1);
        final_str += "-
" + prev_char + char;
    } else {
        final_str += char;
    }
    len = string_length(final_str);
}
return final_str;
#define grid_to_cell(_pos) //Translate basegame grid system coordinates to in cell coordinates
with room_manager {
	_pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];

    return [[(abs(_pos[0]) % ((cell_dim[0]-grid_offset)*cell_size)),
		    (abs(_pos[1]) % ((cell_dim[1]-grid_offset)*cell_size))],
		   [floor(_pos[0]/((cell_dim[0]-grid_offset)*cell_size)),
			floor(_pos[1]/((cell_dim[1]-grid_offset)*cell_size))]];
}

#define draw_text_drop(_x,_y,_str,_sep,_w,_x1,_y1,_ang,_alp)

draw_text_ext_transformed_color(_x+2,_y+2,_str,_sep,_w,_x1,_y1,_ang,c_black,c_black,c_black,c_black,_alp);
draw_text_ext_transformed_color(_x,_y,_str,_sep,_w,_x1,_y1,_ang,c_white,c_white,c_white,c_white,_alp);