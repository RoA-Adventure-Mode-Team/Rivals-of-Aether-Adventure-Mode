//article3 - Action Manager
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
    //to_room, to_coords
    QUEST_PROG, //Quest-related actions
    //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
    SUS, //Suspend Action by ID
    //suspend_bool, action_id
    SPAWN_ART,
    //[room_format]
    CHECK, //End action upon the condition being true
    //article_group, variable, condition
}

enum P {
    LOAD,
    ROOM_ID,
    SCENE_ID,
    ACTION_ID,
    ALIVE_TIME,
    ACTION_INDEX,
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

if !_init {
	with obj_stage_article if num == 5 other.room_manager = id;
	debug = false;
    reload_scenes();
    change_scene(1);
    _init = true;
    quest_init = true;
    exit;
}

if array_length_1d(end_action_queue) > 0 process_end_queue();
if array_length_1d(end_action_index) > 0 process_end_index();
if array_length_1d(action_queue) > 0 process_action_queue();

action_tick();
scene_tick();

#define process_action_queue()
for (var i = 0; i < array_length_1d(action_queue);i++) {
	start_action(action_queue[i][0], action_queue[i][1], action_queue[i][2]);
}
action_queue = []; //clear queue;
return true;
#define process_end_queue()
for (var i = 0; i < array_length_1d(end_action_queue);i++) {
	end_action_id(action_queue[i][0], action_queue[i][1], action_queue[i][2]);
}
end_action_queue = []; //clear queue;
return true;
#define process_end_index()
for (var i = 0; i < array_length_1d(end_action_index); i++) {
	for (var j = 0; j < array_length_1d(cur_actions); j++) {
		if cur_actions[j][P.ACTION_INDEX] == end_action_index[i] 
			end_action(cur_actions[j][P.ACTION_INDEX]);
	}
}
end_action_index = []; //clear queue;
return true;
#define do_action(_action) //Action Per Frame
if _action[P.ROOM_ID] != 0 && _action[P.ROOM_ID] != room_id return false; //Only process actions effecting the current room, or the All Room
var _param = _action[P.LOAD][L.PARAM];
switch _action[P.LOAD][L.ACTION_TYPE] {
    case ACT.DIALOG: 
    	//end action if attack pressed & at end of line
    	if obj_stage_main.follow_player.attack_down && 
    	_action[P.ALIVE_TIME] * _param[10] > string_length(_param[7]) {
    		_action[@P.DIE] = true;
    	}
    	break;
    case ACT.CAMERA: //action_time, x, y, focus_type, smooth 
    	//obj_stage_main.cam_state = 1;
    	switch _param[3] {
    		case 0:
		    	cam_pos = [_param[1],_param[2]];
		    	cam_smooth = _param[4];
		    	break;
		    default:
		    	var _follow = noone;
    			with oPlayer if _param[3] == player _follow = id;
    			cam_pos = [_follow.x+_param[1],_follow.y+_param[2]];
    			cam_smooth = _param[4];
    			break;
    	}
    	if _param[0] > 0 && _action[P.ALIVE_TIME] > _param[0] {
    		obj_stage_main.cam_state = 0; //Set the cam back to normal
    		_action[@P.DIE] = true;
    	}
    	break;
    case ACT.CHECK:
    	var _param = new_action[P.LOAD][L.PARAM];
		with obj_stage_article if "action_article_index" in self && action_article_index == _param[0] if variable_instance_get(id,_param[1]) == _param[2] _action[@P.DIE] = true;
    	break;
    case ACT.CONTROL:
    	with oPlayer {
    		if _param[1] == all || _param[1] == id {
		    	if _param[2] >= 0 && state != _param[2] { 
		    		set_state(_param[2]);
		    	}
    		}
    	}
    	if _action[P.ALIVE_TIME] > _param[0] {
    		_action[@P.DIE] = true;
    	}
    	break;
    case ACT.SET:
	    switch _param[3] { //ease_type
	    	default:
	    		
		    	with obj_stage_article if "action_article_index" in self && action_article_index == _param[0] {
		    		if _action[P.ALIVE_TIME] == 1 variable_instance_set(id,"action_old_"+_param[1],variable_instance_get(id,_param[1]));
					variable_instance_set(id,_param[1],ease_linear(variable_instance_get(id,"action_old_"+_param[1]),_param[2],_action[P.ALIVE_TIME],_param[4]));
					if other.debug print_debug("[AM] EASING "+string(_param[0])+"."+string(_param[1])+" = "+string(_param[2]));
				}
				if _action[P.ALIVE_TIME] > _param[4] {
		    		_action[@P.DIE] = true;
		    	}
	    	
	    	break;
	     }
    	break;
    case ACT.ON_INPUT:
    	var _input_done = 0;
    	with oPlayer {
    		if !_param[0] || other.follow_player == id {
    			switch _param[1] {
    				case PC_TAUNT_PRESSED:
    					if taunt_down _input_done = 1;
    					break;
    				case PC_ATTACK_PRESSED:
    					if attack_down _input_done = 1;
    					break;
    				case PC_SHIELD_PRESSED:
    					if shield_down _input_done = 1;
    					break;
    				case PC_JUMP_PRESSED:
    					if jump_down _input_done = 1;
    					break;
    				case PC_DOWN_STICK_PRESSED:
    					if down_down _input_done = 1;
    					break;
    				case PC_UP_STICK_PRESSED:
    					if up_down _input_done = 1;
    					break;
    				case PC_LEFT_STICK_PRESSED:
    					if left_down _input_done = 1;
    					break;
    				case PC_RIGHT_STICK_PRESSED:
    					if right_down _input_done = 1;
    					break;
    			}
    		}
    	}
    	if _input_done _action[@P.DIE] = true;
    	break;
    case ACT.WAIT: //Does what it says
	    if _action[P.ALIVE_TIME] > _param[0] {
    		_action[@P.DIE] = true;
    	}
    	break;
    default: //type with no code here
    	//print_debug("ACTION UNDEFINED");
        break;
}


if _action[P.DIE] == true {
	end_action(_action[P.ACTION_INDEX]);
	action_ended = true; //Action ended in the do sequence
}

#define change_scene(_scene_id)
if array_length_1d(scene_array[room_id]) < _scene_id return false;
for (var i = 0; i < array_length_1d(cur_actions); i++) end_action(cur_actions[i][P.ACTION_INDEX]);
cur_scene = scene_array[room_id][_scene_id];
scene_id = _scene_id;

//for (var i = 0; i < array_length_1d(cur_scene); i++) start_action(room_id, scene_id, cur_scene[i]);

return true;

#define action_tick()
for (var i = 0; i < array_length_1d(cur_actions); i++) {
	cur_actions[@i][@P.ALIVE_TIME]++;
    do_action(cur_actions[i]);
	i -= action_ended;
	action_ended = false;
}
return true;

#define start_action(_room_id, _scene_id, _action_id)
if _scene_id > array_length_1d(action_array[_room_id]) || _action_id > array_length_1d(action_array[_room_id][_scene_id]) {
	if debug print_debug("[AM] ACTION "+string(_action_id)+" OUTSIDE INITIALIZED RANGE...");
	return false;
}
if debug print_debug("[AM] ACTION LIVE: "+string(_action_id));
var new_action = array_create(P.DIE+1);
new_action[P.LOAD] = array_clone(action_array[_room_id][_scene_id][_action_id]);
new_action[P.ROOM_ID] = _room_id;
new_action[P.SCENE_ID] = _scene_id;
new_action[P.ACTION_ID] = _action_id;
new_action[P.ACTION_INDEX] = action_index;
action_index++;
new_action[P.ALIVE_TIME] = 0;

//On action start
//print_debug(string(new_action[P.LOAD]));
switch new_action[P.LOAD][L.ACTION_TYPE] {
	case ACT.CAMERA:
			obj_stage_main.cam_state = 1;
			print_debug("[AM] CAM CONTROL SET TO "+string(_action_id));
		break;
	case ACT.WINDOW:
		var _param = new_action[P.LOAD][L.PARAM];
		var win_over = _param[3];
		with obj_stage_main {
			if array_length_1d(win_data) < _param[0] {
				print_debug("[AM] WINDOW OUTSIDE OF INITIALIZED RANGE...");
				return false;
			}
			if win_over != [] for(var i = 0; i < array_length_1d(win_over); i++) for(var j = 0; j < array_length_1d(win_over[i]); j++) win_data[@_param[0]][@(i+1)][@(j+1)] = win_over[i][j];
			array_push(active_win,[[_param[1],_param[2],new_action[P.ACTION_INDEX],0],array_clone_seriously_why_isnt_this_how_it_works(win_data[_param[0]])]); //Push window data to active windows in the right format 
								//[[pos_x,pos_y,action_id,alive_time], [meta]]
		}
		break;
	case ACT.CHECK:
    	var _param = new_action[P.LOAD][L.PARAM];
		with obj_stage_article if "action_article_index" in self && action_article_index == _param[0] if variable_instance_get(id,_param[1]) == _param[2] _action[@P.DIE] = true;
    	break;
	case ACT.SET:
		var _param = new_action[P.LOAD][L.PARAM];
		with obj_stage_article if "action_article_index" in self && action_article_index == _param[0] variable_instance_set(id,_param[1],_param[2]);
		if array_length_1d(_param) < 4 {
			if debug print_debug("[AM] SETTING "+string(_param[0])+"."+string(_param[1])+" = "+string(_param[2]));
			for (var j = 0; j < array_length_1d(new_action[P.LOAD][L.ON_EXIT]); j++) start_action(room_id, scene_id, new_action[P.LOAD][L.ON_EXIT][j]); //Add Exit Actions
			return true; //Never enters the queue
		}
		if debug print_debug("[AM] EASING "+string(_param[0])+"."+string(_param[1])+" = "+string(_param[2]));
		break;
	case ACT.MUSIC:
		var _param = new_action[P.LOAD][L.PARAM];
    	switch _param[0] {
    		case -1: //stop
				music_stop();
				break;
    		case 0: //play music
    			music_play_file(_param[1]);
    			break;
			case 1: //crossfade
				music_crossfade(false,_param[2]);
				break;
			case 2: //fadeout
				music_fade(_param[1],_param[2]);
				break;
			case 3: //volume
				// sound_volume(_param[1]);
				break;
			case 4: //pitch
				//sound_pitch(_param[1]);
				break;
    	}
    	for (var j = 0; j < array_length_1d(new_action[P.LOAD][L.ON_EXIT]); j++) start_action(room_id, scene_id, new_action[P.LOAD][L.ON_EXIT][j]); //Add Exit Actions
		return true; //Never enters the queue
	case ACT.SUS: //:oO.Oo:
		var _param = new_action[P.LOAD][L.PARAM];
		if _param[0] { // Suspend Action
			while array_length_1d(suspened_actions)-1 < room_id array_push(suspened_actions,[]);
			for (var i = 0; i < array_length_1d(cur_actions); i++) {
		    	if array_length_1d(cur_actions[i]) > 1 && cur_actions[i][P.ACTION_ID] ==  _param[1] {
		    		if debug print_debug("[AM] ACTION "+string(cur_actions[i][P.ACTION_INDEX])+":"+string(cur_actions[i][P.ACTION_ID])+" SUSPENDED");
		    		array_push(suspened_actions[room_id],cur_actions[i]);
		    		cur_actions = array_cut(cur_actions, i);
		    	}
			}
		} else { //Unsuspend Action
			for (var i = 0; i < array_length_1d(suspened_actions); i++) {
		    	if suspened_actions[room_id][i][P.ACTION_ID] == _param[1] {
		    		if debug print_debug("[AM] ACTION "+string(cur_actions[i][P.ACTION_INDEX])+":"+string(cur_actions[i][P.ACTION_ID])+" SUSPENDED");
		    		array_push(cur_actions, suspened_actions[room_id][i]);
		    		suspened_actions[room_id] = array_cut(suspened_actions[room_id], i);
		    		for (var j = 0; j < array_length_1d(new_action[P.LOAD][L.ON_EXIT]); j++) start_action(room_id, scene_id, new_action[P.LOAD][L.ON_EXIT][j]); //Add Exit Actions
					return true; //Never enters the queue
		    	}
			}
		}
		for (var j = 0; j < array_length_1d(new_action[P.LOAD][L.ON_EXIT]); j++) start_action(room_id, scene_id, new_action[P.LOAD][L.ON_EXIT][j]); //Add Exit Actions
		return true; //Never enters the queue
	case ACT.SPAWN_ART: //Spawn an article. Not counted in room!
		var _param = new_action[P.LOAD][L.PARAM];
		var _rel_pos = cell_to_real([_param[1][1],_param[1][2]],_param[0]);
		var _art;
		switch _param[1][3] {
            case 2:
                //obj_type = "obj_stage_article_solid";
                _art = instance_create(floor(_rel_pos[0]),floor(_rel_pos[1]),"obj_stage_article_solid",_param[1][0]);
                break;
            case 1:
                //obj_type = "obj_stage_article_platform";
                _art = instance_create(floor(_rel_pos[0]),floor(_rel_pos[1]),"obj_stage_article_platform",_param[1][0]);
                break;
            case 0:
                //obj_type = "obj_stage_article";
                _art = instance_create(floor(_rel_pos[0]),floor(_rel_pos[1]),"obj_stage_article",_param[1][0]);
            break;
        }
        _art.spawn_variables = _param[1][5];
        _art.depth = _param[1][4];
        _art.og_depth = _param[1][4];
        _art.cell_size = room_manager.cell_size;
        _art.init_pos = [_param[1][1],_param[1][2]];
        _art.cell_pos = room_manager._cell_pos;
        _art.action_article_index = _param[1][6][1]; //array_room_data[_room_id][i][1][j][6][1] 6D Array!
        _art.room_manager = room_manager;
        _art.debug = obj_stage_main.debug;
		for (var j = 0; j < array_length_1d(new_action[P.LOAD][L.ON_EXIT]); j++) start_action(room_id, scene_id, new_action[P.LOAD][L.ON_EXIT][j]); //Add Exit Actions
		return true; //Never enters the queue
	case ACT.SW_ROOM:
		var _param = new_action[P.LOAD][L.PARAM];
    	with room_manager {
    		if array_length_1d(_param) < 2 switch_to_room_pos = [-1,-1];
    		else switch_to_room_pos = _param[1];
    		room_switch_type = 2;
    		switch_to_room = _param[0];
    	}
    	for (var j = 0; j < array_length_1d(new_action[P.LOAD][L.ON_EXIT]); j++) start_action(room_id, scene_id, new_action[P.LOAD][L.ON_EXIT][j]); //Add Exit Actions
		return true; //Never enters the queue
	case ACT.QUEST_PROG: //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
    	var _param = new_action[P.LOAD][L.PARAM];
    	switch _param[1] {
    		case 2: //add/subtract
    			print(quest_array[_param[0]][0]);
    			print(_param[2]);
    			quest_set(_param[0],quest_array[_param[0]][0]+_param[2]);
    			break;
    		case 1: //set, override
    			quest_set(_param[0],_param[2]);
    			break;
    		default: //set, do not go backwards
    			// print(quest_array[_param[0]][0][0]);
    			if quest_array[_param[0]][0] == noone || quest_array[_param[0]][quest_array[_param[0]][0]] < _param[2] quest_set(_param[0],_param[2]);
    			break;
    	}
    	for (var j = 0; j < array_length_1d(new_action[P.LOAD][L.ON_EXIT]); j++) start_action(room_id, scene_id, new_action[P.LOAD][L.ON_EXIT][j]); //Add Exit Actions
		return true; //Never enters the queue
    	break;
    default:
        break;
}

array_push(cur_actions, new_action);
return true;

#define end_action_id(_room_id, _scene_id, _action_id) //On action End
for (var i = 0; i < array_length_1d(cur_actions); i++) {
	
    if cur_actions[i][P.ACTION_ID] == _action_id {
    	if debug print_debug("[AM] ACTION "+string(cur_actions[i][P.ACTION_INDEX])+":"+string(cur_actions[i][P.ACTION_ID])+" ENDED");
    	for (var j = 0; j < array_length_1d(cur_actions[i][P.LOAD][L.ON_EXIT]); j++) start_action(room_id, scene_id, cur_actions[i][P.LOAD][L.ON_EXIT][j]); //Add Exit Actions
        cur_actions = array_cut(cur_actions, i);
        break;
    }
}
return true;

#define end_action(_action_index) //On action End
for (var i = 0; i < array_length_1d(cur_actions); i++) {
    if cur_actions[i][P.ACTION_INDEX] == _action_index {
    	if debug print_debug("[AM] ACTION "+string(cur_actions[i][P.ACTION_INDEX])+":"+string(cur_actions[i][P.ACTION_ID])+" ENDED");
    	for (var j = 0; j < array_length_1d(cur_actions[i][P.LOAD][L.ON_EXIT]); j++) start_action(room_id, cur_actions[i][P.SCENE_ID], cur_actions[i][P.LOAD][L.ON_EXIT][j]); //Add Exit Actions
        cur_actions = array_cut(cur_actions, i);
        
        break;
    }
}
return true;

#define scene_tick()
scene_time++;
return true;

#define reload_scenes()
user_event(0); //Run scene load scripts
return true;

#define quest_set(_id,_progress)
if quest_array[_id][0]  == noone array_push(quest_active,quest_array[_id]);
quest_array[@_id][@0] = _progress;//Save current quest progress
if _progress == noone {
	if debug print_debug("[AM] Quest Reset: "+string(_id));
	array_cut(quest_active,array_find_index(quest_active,quest_array[_id][0]));
	return noone;
}
if debug print_debug("[AM] Quest Progress: "+string(_id)+" : "+string(_progress));

return quest_array[_id][_progress];

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

#define array_clone_seriously_why_isnt_this_how_it_works(_shit)
var _fuck = [];
for(var _i = 0;_i < array_length_1d(_shit);_i++) {
	if array_length_1d(_shit[_i]) > 0 array_push(_fuck,array_clone_seriously_why_isnt_this_how_it_works(_shit[_i]));
	else array_push(_fuck,_shit[_i]);
}
return _fuck;
#define cell_to_real(_pos,_cell_pos) //Translate cell coordinates to real
//_pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];
with room_manager {
	return [(_pos[0]-grid_offset)*cell_size + (cell_dim[0]*_cell_pos[0]-grid_offset*(_cell_pos[0]))*cell_size + render_offset[0], 
			(_pos[1]-grid_offset)*cell_size + (cell_dim[1]*_cell_pos[1]-grid_offset*(_cell_pos[1]))*cell_size + render_offset[1]];
}