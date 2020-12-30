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
enum WIN {
	DEBUG,
	DIALOG_DEFAULT
}

enum GUI {
	SPRITE,
	TEXTBOX,
	DIALOGBOX,
	BUTTON,
	EXIT
}

if win_call == 0 {
	if mouse_x_i != mouse_x || mouse_y_i != mouse_y cursor_visible = true;
	with obj_stage_main {
		if cursor_visible do_cursor();
		draw_windows(); //Draw Objects
		if cursor_visible draw_sprite_ext(cursor_sprite_i, cursor_index, cursor_x, cursor_y, 1, 1, 0, c_white, 1); //Draw cursor over everything
	}
	exit;
}

if win_call == 1 with obj_stage_main { //Load Data
	var i = 0;
	win_add(i++,[WIN.DEBUG,
	new_sprite(sprite_get("gui_test"),0,0),
	new_textbox("GUI 2.0 TITLE",4,2,200,16,c_white,asset_get("fName")),
	new_dialogbox("HENLOOOOOOOOOOOOOOOOOOOOOOOOO",asset_get("mfx_back"),"_",0.4,4,16,200,12,c_white,asset_get("roundFont"))]);
	//win_add(1, [WIN.DEBUG, sprite_get("gui_test"), "Gucci", ""]);
	//win_add(1, [WIN.DEBUG, sprite_get("gui_test"), "Gucci", "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."]);
	//window_type, bg, title var, string var
	//win_add(2, [WIN.DIALOG_DEFAULT, "", asset_get("empty_sprite"), asset_get("mfx_back"), //String, Bg Sprite, Click Sound
	//0, .25, 200, asset_get("roundFont"),"_", //char_vis, char_speed, w, font, clicker, //Text
	//0.4, //anim_speed //Bg sprite
	//]);
	//window_type
}



#define new_textbox(_default_string,_x,_y,_w,_sep,_color,_font)
return [GUI.TEXTBOX,_default_string,_x,_y,_w,_sep,_color,_font];
#define new_button(_sprite,_x,_y)
return [GUI.BUTTON,_sprite,_x,_y];
#define new_sprite(_sprite,_x,_y)
return [GUI.SPRITE,_sprite,_x,_y];
#define new_dialogbox(_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font)
var _char_vis = 0;
return [GUI.DIALOGBOX,_default_string,_sound,_ticker,_ticker_time,_x,_y,_w,_sep,_color,_font,_char_vis];
#define win_add(_win_id, _win_data)
while _win_id >= array_length_1d(win_data)  array_push(win_data, []);
win_data[@_win_id] = _win_data;
return true;
#define draw_windows()
var _x = 0;
var _y = 0;
var _param = [];
var _elements = [];
var _alpha = 1;
var alive_time = 0;

if win_active != -1 {
	
}

for (var _i = 0; _i < array_length_1d(active_win); _i++) {
	_x = active_win[_i][0][0];
	_y = active_win[_i][0][1];
	_elements = active_win[_i][1];
	alive_time = active_win[_i][0][3];
	active_win[@_i][@0][@3] += 1;
	_alpha = 1;
	switch _elements[0] {
		case WIN.DEBUG:
			_alpha = 1-(win_active != _i)*.5;
			break;
	}
	for (var _j = 1; _j < array_length_1d(_elements);_j++) {
		_param = _elements[_j];
		switch _param[0] {
			case GUI.SPRITE:
				draw_sprite_ext(_param[1],0,_x+_param[2],_y+_param[3],2,2,0,c_white,_alpha);
				break;
			case GUI.TEXTBOX:
				draw_set_font(_param[7]);
				draw_text_ext_transformed_color(_x+_param[2],_y+_param[3],_param[1],_param[5],_param[4],1,1,0,_param[6],_param[6],_param[6],_param[6],_alpha);
				break;
			case GUI.DIALOGBOX:
				_param[11] += _param[4];
				draw_set_font(_param[10]);
				if floor(_param[11]/4) % 2 draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11]))+_param[3],_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],_alpha);
				else draw_text_ext_transformed_color(_x+_param[5],_y+_param[6],string_copy(_param[1],0,floor(_param[11])),_param[8],_param[7],1,1,0,_param[9],_param[9],_param[9],_param[9],_alpha);
				break;
		}
	}
}

return true;

/*#define draw_windows() //Do everything windows
//gpu_set_blendmode(bm_add); //Reduce draw lag?
var _x = 0;
var _y = 0;
var _param = [];
var _alpha = 1;
var alive_time = 0;
//var _string = "";
if win_active != -1 {
	//print_debug(string(active_win[@win_active]));
	_param = _active_win[win_active][1];
	switch _param[0] {
		case WIN.DEBUG:
			if keyboard_string != "" {
				active_win[@win_active][@1][@3] += keyboard_string;
				keyboard_string = "";
			}
			break;
	}
}
for (var i = 0; i < array_length_1d(active_win); i++) {
	_x = active_win[i][0][0];
	_y = active_win[i][0][1];
	_param = active_win[i][1];
	alive_time = active_win[i][0][3];
	active_win[@i][@0][@3] += 1;
	switch _param[0] {
		case WIN.DEBUG:
			_alpha = 1-(win_active != i)*.5;
			draw_sprite_ext(_param[1],0,_x,_y,2,2,0,c_white,_alpha);
			draw_text_ext_transformed_color(_x+tb_title_offset_x,_y+tb_title_offset_y,_param[2]+" ("+string(i)+")",1,2*sprite_get_width(_param[1])-tb_title_offset_x,1,1,0,c_white,c_white,c_white,c_white,_alpha);
			draw_text_ext_color(_x+tb_str_offset_x,_y+tb_str_offset_y,_param[3],16,200,c_white,c_white,c_white,c_white,_alpha);
			break;
		case WIN.DIALOG_DEFAULT:
			//alive_time = action_manager.cur_actions[active_win[i][0][2]][P.ALIVE_TIME];
			draw_sprite_ext(_param[2],alive_time*_param[9],_x,_y,2,2,0,c_white,_alpha);
			draw_set_font(_param[7]);
			//_string = string_copy(_param[1],0,floor(alive_time*_param[5]));
			//if floor(_param[4]) != floor(_param[4] + alive_time*_param[5]) sound_play(_param[3]);
			_param[4] += _param[5];
			if _param[4] > string_length(_param[1]) {
				with oPlayer if attack_down with other {
					end_window(i);
					break;
				}
				if alive_time % 30 < 15 {
					draw_text_ext_color(_x,_y,_param[1]+_param[8],16,_param[6],c_white,c_white,c_white,c_white,_alpha);
					break;
				}
				draw_text_ext_color(_x,_y,_param[1],16,_param[6],c_white,c_white,c_white,c_white,_alpha);
				break;
			}
			draw_text_ext_color(_x,_y,string_copy(_param[1],0,floor(_param[4])),16,_param[6],c_white,c_white,c_white,c_white,_alpha);
			break;
	}
}
//gpu_set_blendmode(bm_normal);
return true;*/

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

if mouse_button == 1 {
	if !mb_l_click { //on click
		//print_debug("MB1 CLICK!");
		var _x = 0;
		var _y = 0;
		var _param = [];
		for (var i = 0; i < array_length_1d(active_win);i++) {
			_x = active_win[i][0][0];
			_y = active_win[i][0][1];
			_param = active_win[i][1];
			switch _param[0] {
				case WIN.DEBUG:
					if _x < cursor_x && _y < cursor_y  && _x + tb_bar_x > cursor_x && _y+tb_bar_y > cursor_y  {
						win_drag = i;
						win_active = i;
					}
					break;
			}
		}
		if win_drag == -1 win_active = -1;
	}
	if win_drag != -1 {
		active_win[@win_drag][@0][@0] += cursor_x - cursor_x_p;
		active_win[@win_drag][@0][@1] += cursor_y - cursor_y_p;
	}
	//if !mb_l_click pointer_art = collision_rectangle_all(mouse_x,mouse_y,32,32,obj_stage_article);
	//for (var i = 0; i < array_length_1d(pointer_art);i++) pointer_art[i].mb_click = mouse_button;
	mb_l_click = true;
} else {
	if mb_l_click { //on release
		win_drag = -1;
		//print_debug("MB1 UN CLICK!");
	}
	mb_l_click = false;
}
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