//article3 - Scene Manager
enum LWO {
    TXT_HUD,
    TXT_WLD,
    CAM_WLD,
    SPR_HUD,
    SPR_WLD,
    PLR_CTL
}
enum ACT {
    DIALOG,
    SPRITE,
    WAIT,
    SET
}

enum P {
    LOAD,
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

if !_init {
	debug = true;
    reload_scenes();
    error_code = change_scene(1);
    //print_debug("ERROR: "+string(error_code));
    _init = 1;
    exit;
}

action_tick();
scene_tick();


#define do_action(_action) //Action Per Frame

switch _action[P.LOAD][L.ACTION_TYPE] {
    case ACT.DIALOG: 
    	var _param = _action[P.LOAD][L.PARAM];
    	//end action if attack pressed & at end of line
    	if stage_main.follow_player.attack_down && 
    	_action[P.ALIVE_TIME] * _param[10] > string_length(_param[7]) {
    		_action[@P.DIE] = true;
    	}
    	break;
    default: //type with no code here
    	return true;
        break;
}

if _action[P.DIE] == true end_action(_action[P.ACTION_ID]);

#define change_scene(_scene_id)
if array_length_1d(scene_array[room_id]) < _scene_id return false;
for (var i = 0; i < array_length_1d(cur_actions); i++) end_action(cur_actions[i][P.ACTION_ID]);
cur_scene = scene_array[room_id][_scene_id];
scene_id = _scene_id;

for (var i = 0; i < array_length_1d(cur_scene); i++) start_action(cur_scene[i]);

return true;

#define action_tick()

for (var i = 0; i < array_length_1d(cur_actions); i++) {
    do_action(cur_actions[i]);
    cur_actions[@i][@P.ALIVE_TIME]++;
    //action_temp = cur_actions[i];
    //user_event(2); //Action ticks
}
return true;

#define start_action(_action_id)

if _action_id > array_length_1d(action_array[room_id][scene_id])-1 {
	print_debug("[AM] ACTION "+string(_action_id)+" OUTSIDE INITIALIZED RANGE...");
	return false;
}
if debug print_debug("[AM] ACTION LIVE: "+string(_action_id));
var new_action = array_create(P.DIE+1);
new_action[P.LOAD] = action_array[room_id][scene_id][_action_id];
new_action[P.ACTION_ID] = _action_id;
new_action[P.ALIVE_TIME] = 0;
//[[action_type, params, on_exit], action_id, alive_time, die]


//On action start
switch new_action[P.LOAD][L.ACTION_TYPE] {
    case ACT.DIALOG: //instance_id, obj_type, pos_x, pos_y
	    break;
    default:
        break;
}

array_push(cur_actions, new_action);
return true;

#define end_action(_action_id) //On action End
var _cur_actions = [];
for (var i = 0; i < array_length_1d(cur_actions); i++) {
    if cur_actions[i][P.ACTION_ID] == _action_id {
    	for (var j = 0; j < array_length_1d(cur_actions[i][P.LOAD][L.ON_EXIT]); j++) start_action(cur_actions[i][P.LOAD][L.ON_EXIT][j]); //Add Exit Actions
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

#define array_cut(_array, _index)
var _array_cut = array_create(array_length_1d(_array)-1);
var j = 0;
for (var i = 0; i < array_length_1d(_array); i++) {
	if i != _index {
		_array_cut[@j] = _array[i];
		j++;
	}
}
/*if debug {
	print_debug("[AM] CUT ARRAY:");
	print_debug(string(_array));
	print_debug(string(_array_cut));
}*/

return _array_cut;
