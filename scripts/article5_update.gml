//article5_update, Room Manager

// with oPlayer if state == PS_RESPAWN {
// 	print("[article5:update] started check");
// 	// set_state(PS_IDLE);
// }

if get_gameplay_time() == 2 { //Initialize things on the first gameplay frame
    //with obj_stage_article if num == 3 other.action_manager = id;
    /*cam_pos_left = [view_get_xview(),view_get_yview()];
    cam_pos_right = [view_get_xview()+view_get_wview(),view_get_yview()+view_get_hview()];
    true_pos = [cam_pos_left[0]+view_get_wview()/2,cam_pos_left[1]+view_get_hview()/2];
    */
    render_offset = [room_width/2-cell_dim[0],room_height/2-cell_dim[1]];
    reload_rooms();
    switch_to_room_pos = [follow_player.respawn_point[0],follow_player.respawn_point[1]];
    room_switch(follow_player.respawn_point[2]);
    
	old_cell_pos = cell_pos;
    last_pos[0] = follow_player.x;
    last_pos[1] = follow_player.y;
    with obj_stage_main g_cam_pos = [other.follow_point.x,other.follow_point.y];
    visible = true;
    smoothing = 1/5;
}

//if get_gameplay_time() == 3 { //Move the cam to position
	//set_view_position(follow_player.x,follow_player.y);
	//with obj_stage_main g_cam_pos = [other.follow_point.x,other.follow_point.y];
//}

// with oPlayer if state == PS_RESPAWN {
// 	print("[article5:update] before respawn check");
// 	// set_state(PS_IDLE);
// }
with oPlayer { //Respawn Code
	// print(respawn_point);
	if state == PS_DEAD || state == PS_RESPAWN {
		x = dead_pos[0];
		y = dead_pos[1];
		if state_timer > 89 {
			x = respawn_point[0];
			y = respawn_point[1];
		}
		
		//Refund Stonks
		// set_player_stocks(player,get_player_stocks(player)+1);
		// if state == PS_RESPAWN {
		// 	print("[article5:respawn] completed check");
		// 	// set_state(PS_IDLE);
		// }
		
		// x = (respawn_point[0][0]+respawn_point[1][0]*cell_dim[0])*cell_size;
		// y = (respawn_point[0][1]+respawn_point[1][1]*cell_dim[1])*cell_size;	
		// with other other.x = cell_to_grid(other.respawn_point[0],other.respawn_point[1])[0];
		// y = cell_to_grid(other.respawn_point[0],other.respawn_point[1])[1];
		// if (state_timer >= 89) {
		// 	set_state(PS_IDLE);
		// 	free = false;
		// 	visible = false;
		// 	x = 5500;
		// 	y = 5300;
		// 	with other {
		// 		if !room_switch_on {
		// 			print(other.player);
		// 			room_switch_type = 1;
		//   		switch_to_room_pos = cell_to_grid(other.respawn_point[0],other.respawn_point[1]);
		// 		    // print_debug(string(other.respawn_point));
		// 		    room_switch(other.respawn_point[2]);
		// 	        room_switch_oIn all n = true;
		// 	        room_switch_timer = 0;
		// 		}
		// 	}
		// }
	}
	if state == PS_SPAWN respawn_point = [x,y,other.cur_room]; //Spawn state sets checkpoint?
}
if switch_room room_switch(switch_to_room);
if room_switch_on room_switch_update();

if get_gameplay_time() > 2 { //Scrolling Room
    /*cam_pos_left = [view_get_xview(),view_get_yview()];
    cam_pos_right = [view_get_xview()+view_get_wview(),view_get_yview()+view_get_hview()];
    true_pos = [cam_pos_left[0]+view_get_wview()/2,cam_pos_left[1]+view_get_hview()/2];
    */
    if follow_player.state != PS_HITSTUN && follow_player.state != PS_DEAD && follow_player.state != PS_RESPAWN set_follow_point(follow_objects);
    // if follow_player.state == PS_RESPAWN print("[article5:follow_point & player] completed check");
    //Frame Cleanups
    last_pos[0] = follow_point.x;
    last_pos[1] = follow_point.y;
    scroll_horiz = true;
    scroll_vert = true;
    pos_in_cell = grid_to_cell([follow_point.x,follow_point.y]);
}

// with oPlayer if state == PS_RESPAWN print("[article5:update] completed check");

cur_room_time++;

//Music Find
#define set_follow_point(_obj_array) //Set the point the world cam will follow to
// var _x_avg = 0;
// var _y_avg = 0;
// var _count = 0;
// var cam_vel_influence = obj_stage_main.cam_vel_influence;
// for (var i = 0; i < array_length_1d(_obj_array);i++) {
//     with _obj_array[i] {
//     	avg_vel = [(cam_vel_influence*avg_vel[0]+hsp)/(cam_vel_influence+1),(cam_vel_influence*avg_vel[1]+vsp)/(cam_vel_influence+1)];
//     	//else avg_vel = [hsp, vsp];
//         _x_avg += x+avg_vel[0]*15;
//         _y_avg += y+avg_vel[1]*10;
//         //_x_avg += _obj_array[i].x+_obj_array[i].hsp*10;
//         //_y_avg += _obj_array[i].y+_obj_array[i].vsp*5;
//         _count++;
//     }
// }
// _x_avg /= _count;
// _y_avg /= _count;
// follow_point.x = _x_avg + obj_stage_main.cam_offset[0];//+ follow_player.hsp*10;
// follow_point.y = _y_avg + obj_stage_main.cam_offset[1];//+ follow_player.vsp*10; //+(follow_player.down_held > 20)*50-(follow_player.up_held > 20)*50;

follow_point.x = _obj_array[0].x + obj_stage_main.cam_offset[0];
follow_point.y = _obj_array[0].y + obj_stage_main.cam_offset[1];

#define reload_rooms() //Reload room data, runs on start
cur_room = 0;
cur_room_time = 0;
array_room_ID = array_create(0);
array_room_data = array_create(0);
array_room_transition_time = 120;
array_room_name = 0;

user_event(1); //Room Load Event Script

#define room_add(_room_id,room_data) //Adds a new room to the scene
var _room_id_ind = array_find_index(array_room_ID,_room_id);
if _room_id_ind == - 1 {
    // if debug print_debug("[RM] Adding... "+string(_room_id));
    array_push(array_room_data,room_data);
    array_push(array_room_ID,_room_id);
} else {
    array_room_data[_room_id_ind] = room_data;
    array_room_ID[_room_id_ind] = _room_id;
}
#define room_switch(_room_id) //Switches the room
switch_room = false; //Call once per set per frame
if debug print_debug("[RM] Switching to... "+string(_room_id));
// if _room_id != cur_room {
cur_room_time = 0;
var _room_id_ind = array_find_index(array_room_ID,_room_id);
if _room_id_ind != - 1 {
    cur_room = _room_id;
    room_switch_on = true;
    room_switch_timer = 0;
    cam_smooth = 1; //Instant cam adjustments
    //despawn_room();
	//room_render(cur_room);
} else {
    var _room_id_ind = array_find_index(array_room_ID,0);
    cur_room = 0;
    print_debug("[RM] Error: Room Index not found.");
    despawn_room();
    room_render(cur_room);
}
    
// } else {
// 	if debug print_debug("[RM] CURRENT ROOM");
// 	despawn_room();
//     room_render(cur_room);
// }
// free = false;
with oPlayer {
	set_state(PS_IDLE);
	respawn_point = [x,y,other.cur_room]; //Reset respawn every room change ^^;
}
switch_to_room = cur_room;
return;
#define room_switch_update() //Runs when a room transition is in effect
//with oPlayer {
	//if other.room_switch_timer == 1 set_state(PS_SPAWN);
	//if other.room_switch_timer == other.room_switch_time set_state(PS_IDLE);
//}
//cam_state = -1;
switch room_switch_type {
	case 1: //Rectangle Slide
		if room_switch_timer == floor(room_switch_time/2) {
			// if switch_to_room != cur_room {
			despawn_room();
			room_render(cur_room);
			// }
			switch_room_position(switch_to_room_pos);
			// with obj_stage_article if num == 3 {
			// 	event_id = other.room_switch_event;
			// 	event_triggered = true;
			// }
		}
		if room_switch_timer >= room_switch_time {
			switch_reset();
		}
		break;
	case 2: //Fade Out/In
		if room_switch_timer == floor(room_switch_time/2) {
			// if switch_to_room != cur_room {
			despawn_room();
			room_render(cur_room);
			// }
			switch_room_position(switch_to_room_pos);
			// with obj_stage_article if num == 3 {
			// 	event_id = other.room_switch_event;
			// 	event_triggered = true;
			// }
		}
		if room_switch_timer >= room_switch_time {
			switch_reset();
		}
		break;
	case 0:
		// if switch_to_room != cur_room {
		despawn_room();
		room_render(cur_room);
		// }
		switch_room_position(switch_to_room_pos);
		switch_reset();
		break;
}
room_switch_timer++;

#define switch_reset()
room_switch_type = 0;
room_switch_on = false;
cam_state = 0;
cam_smooth = obj_stage_main.cam_smooth;
//---Moved Elsewhere
// with action_manager {
// 	room_id = other.cur_room;
// 	if scene_id != 0 array_push(action_queue, [other.cur_room,scene_id,1]); //Start the first action of the room/scene
// 	array_push(action_queue, [other.cur_room,0,1]); //Start the first action of ALL room/scene
// }
return true;
#define room_render(_room_id) //Renders the current room. Runs on cell change, room transitions, and respawn usually.
var articles_spawned = 0;
if debug print_debug("[RM] Room Render Call");
if _room_id < array_length_1d(array_room_data) {
    room_data = array_room_data[_room_id];
   for (var i = 0; i < array_length_1d(room_data) && articles_spawned < article_frame_limit; i++) { //For each cell
        _cell_pos = room_data[i][0];
        cell_data = room_data[i][1];
        //if abs(abs(_cell_pos[0]) - abs(cell_pos[0])) < 2 && abs(abs(_cell_pos[1]) - abs(cell_pos[1])) < 2 { 
            //If the cell is near enough to render
            for (var j = 0; j < array_length_1d(cell_data) && articles_spawned < article_frame_limit; j++) { //Check objects inside the array
                if cell_data[j][6][0] == 0 { //If it's not flagged as spawned yet
                    //Real coords need translating into relative
                    rel_pos = cell_to_grid([cell_data[j][1],cell_data[j][2]],_cell_pos);
                        switch cell_data[j][3] {
                            case 2:
                                //obj_type = "obj_stage_article_solid";
                                art = instance_create(floor(rel_pos[0]),floor(rel_pos[1]),"obj_stage_article_solid",cell_data[j][0]);
                                break;
                            case 1:
                                //obj_type = "obj_stage_article_platform";
                                art = instance_create(floor(rel_pos[0]),floor(rel_pos[1]),"obj_stage_article_platform",cell_data[j][0]);
                                break;
                            case 0:
                                //obj_type = "obj_stage_article";
                                art = instance_create(floor(rel_pos[0]),floor(rel_pos[1]),"obj_stage_article",cell_data[j][0]);
                            break;
                        }
                        art.spawn_variables = cell_data[j][5];
                        art.depth = cell_data[j][4];
                        art.og_depth = cell_data[j][4];
                        art.cell_size = cell_size;
                        art.init_pos = [cell_data[j][1],cell_data[j][2]];
                        art.cell_pos = _cell_pos;
                        cell_data[@j][@6][@0] = art.id;
                        art.action_article_index = cell_data[j][6][1]; //array_room_data[_room_id][i][1][j][6][1] 6D Array!
                        art.room_manager = id;
                        art.action_manager = action_manager;
                        art.debug = obj_stage_main.debug;
                        //if cell_data[j][6][1] == 1 cell_data[@j][@6][@0] = -1;
                        articles_spawned++;
                        art.visible = false;
                        // if debug print_debug("[RM] Room Article: "+string(art.init_pos));
                }
            }
        /*} else {
            //print_debug(string(_cell_pos)+": "+string(abs(_cell_pos[1] - cell_pos[1])));
            for (var j = 0; j < array_length_1d(cell_data); j++) {
                if cell_data[j][6][0] != 0 && cell_data[j][6][0] != -1 && (!("keep" in cell_data[j][6][0]) || cell_data[j][6][0].keep == false) {
                    instance_destroy(cell_data[j][6][0]);
                    cell_data[@j][@6][@0] = 0;
                }
                
            }
                
        }*/
    }
} else if debug print_debug("[RM] Unfound Room ID");

//Start new room Action Things
with action_manager {
	room_id = other.cur_room;
	if scene_id != 0 array_push(action_queue, [other.cur_room,scene_id,1]); //Start the first action of the room/scene
	array_push(action_queue, [other.cur_room,0,1]); //Start the first action of ALL room/scene
}

#define real_to_grid(_pos) //Translate real coordinates into coordinates on the basegame grid 
//return [_pos[0] - init_cam_pos[0]+true_pos[0], _pos[1] - init_cam_pos[1]+true_pos[1]]; 
//return [_pos[0] - render_offset[0], _pos[1] - render_offset[1]]; 
return _pos;
#define cell_to_real(_pos,_cell_pos) //Translate cell coordinates to real
//_pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];
return [(_pos[0]-grid_offset)*cell_size + (cell_dim[0]*_cell_pos[0]-grid_offset*(_cell_pos[0]))*cell_size + render_offset[0], 
		(_pos[1]-grid_offset)*cell_size + (cell_dim[1]*_cell_pos[1])*cell_size + render_offset[1]];
// return [(_pos[0]-grid_offset)*cell_size + (cell_dim[0]*_cell_pos[0]-grid_offset*(_cell_pos[0]))*cell_size + render_offset[0], 
// 		(_pos[1]-grid_offset)*cell_size + (cell_dim[1]*_cell_pos[1]-grid_offset*(_cell_pos[1]))*cell_size + render_offset[1]];
#define cell_to_grid(_pos, _cell_pos) //Translate cell coordinates to the basegame grid system
with room_manager return cell_to_real(_pos,_cell_pos);
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
// #define grid_to_cell(_pos) //Translate basegame grid system coordinates to in cell coordinates
// _pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];
// cell_pos = [floor(_pos[0]/((cell_dim[0]-grid_offset)*cell_size)),
// 			-floor(_pos[1]/((cell_dim[1]-grid_offset)*cell_size))];
// return [cell_dim[0]*16 - (_pos[0] % ((cell_dim[0]-grid_offset)*cell_size)),
// 		cell_dim[1]*16 - (_pos[1] % ((cell_dim[1]-grid_offset)*cell_size))];
#define base_to_am(_pos) //Translate base-game coordinates to AM coordinates
_pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];
return [[cell_dim[0]*16 - (_pos[0] % ((cell_dim[0]-grid_offset)*cell_size)),
		 cell_dim[1]*16 - (_pos[1] % ((cell_dim[1]-grid_offset)*cell_size))],
		[-floor(_pos[0]/((cell_dim[0]-grid_offset)*cell_size)),
		 -floor(_pos[1]/((cell_dim[1]-grid_offset)*cell_size))],cur_room];
#define am_to_base(_pos,_cell_pos)//Translate AM coordinates to base-game coordinates
return [_cell_pos[0]*cell_dim[0]+_pos[0]+render_offset[0]];

#define despawn_room() //Despawns all articles in a current room. If an article was a 1 time use, it won't respawn.
var _room_id = cur_room;
for (var k = 0; k < array_length_1d(array_room_data[_room_id]); k++) {
        for (var j = 0; j < array_length_1d(array_room_data[_room_id][k][1]); j++) { //Check objects inside the array
            if array_room_data[@_room_id][k][1][j][6][0] != -1 && (!("keep" in array_room_data[@_room_id][k][1][j][6][0]) || array_room_data[@_room_id][k][1][j][6][0].keep == false) array_room_data[@_room_id][@k][@1][@j][@6][@0] = 0; //Set to not spawned if not dead
        }
    }
with obj_stage_article {
	if num == 3 array_scene_ID = []; //Reset Scene Loads
	if num != 3 && num != 5 && (!("keep" in id) || keep == false) {
		instance_destroy(id);
	}
}
with obj_stage_article_platform instance_destroy(id);
with obj_stage_article_solid instance_destroy(id);

#define switch_room_position(_pos) //Switches the room position in grid space (Harbige12)
if (_pos[0] != -1) {
	follow_point.x = _pos[0];
	with oPlayer x = _pos[0];
	//follow_player.x = follow_point.x;
}
if (_pos[1] != -1) {
	follow_point.y = _pos[1];
	with oPlayer y = _pos[1];
	//follow_player.y = follow_point.y;
}
with oPlayer visible = true;
//set_view_position(follow_point.x,follow_point.y);
with obj_stage_main {
	g_cam_pos = _pos;
	set_view_position_smooth(_pos[0], _pos[1], 1);
}

return true;

#define set_view_position_smooth(_x,_y,_smooth)
sm_x = ease_linear(floor(true_pos[0]),floor(_x),1,_smooth);
sm_y = ease_linear(floor(true_pos[1]),floor(_y),1,_smooth);
set_view_position(round(sm_x), round(sm_y));
true_pos[0] += sm_x;
true_pos[1] += sm_y;
//set_view_position(sm_x, sm_y);
//background movements
with obj_stage_article {
	if num == 1 && static {
		//x = round(sm_x);
		//y = round(sm_y);
		x = other.sm_x;
		y = other.sm_y;
	}
}