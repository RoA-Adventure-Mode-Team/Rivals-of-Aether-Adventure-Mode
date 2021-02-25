//
if get_gameplay_time() == 2 { //Initialize things on the first gameplay frame
    //with obj_stage_article if num == 3 other.action_manager = id;
    /*cam_pos_left = [view_get_xview(),view_get_yview()];
    cam_pos_right = [view_get_xview()+view_get_wview(),view_get_yview()+view_get_hview()];
    true_pos = [cam_pos_left[0]+view_get_wview()/2,cam_pos_left[1]+view_get_hview()/2];
    */
    render_offset = [room_width/2-cell_dim[0],room_height/2-cell_dim[1]];
    reload_rooms();
    switch_to_room_pos = cell_to_grid(follow_player.respawn_point[0],follow_player.respawn_point[1]);
    room_switch(follow_player.respawn_point[2]);
    
	old_cell_pos = cell_pos;
    last_pos[0] = follow_player.x;
    last_pos[1] = follow_player.y;
    with obj_stage_main g_cam_pos = [other.follow_point.x,other.follow_point.y];
    smoothing = 1/5;
}

//if get_gameplay_time() == 3 { //Move the cam to position
	//set_view_position(follow_player.x,follow_player.y);
	//with obj_stage_main g_cam_pos = [other.follow_point.x,other.follow_point.y];
//}



with oPlayer { //Respawn Code
	if state == PS_DEAD || state == PS_RESPAWN {
		if (state_timer == 89 && state == PS_RESPAWN) {
			visible = false;
			set_state(PS_IDLE_AIR);
			with other {
				room_switch_type = 1;
    			switch_to_room_pos = cell_to_grid(follow_player.respawn_point[0],follow_player.respawn_point[1]);
			    print_debug(string(follow_player.respawn_point));
			    room_switch(follow_player.respawn_point[2]);
		        room_switch_on = true;
		        room_switch_timer = 0;
			}
		}
	}
}
if switch_to_room != cur_room room_switch(switch_to_room);
if room_switch_on room_switch_update();

if get_gameplay_time() > 2 && room_type == 1 { //Scrolling Room
    /*cam_pos_left = [view_get_xview(),view_get_yview()];
    cam_pos_right = [view_get_xview()+view_get_wview(),view_get_yview()+view_get_hview()];
    true_pos = [cam_pos_left[0]+view_get_wview()/2,cam_pos_left[1]+view_get_hview()/2];
    */
    if !respawning && follow_player.state != PS_HITSTUN set_follow_point(follow_objects);
    //Frame Cleanups
    last_pos[0] = follow_point.x;
    last_pos[1] = follow_point.y;
    scroll_horiz = true;
    scroll_vert = true;
    pos_in_cell = grid_to_cell([follow_point.x,follow_point.y]);
}

cur_room_time++;
#define set_follow_point(_obj_array) //Set the point the world cam will follow to
var _x_avg = 0;
var _y_avg = 0;
var _count = 0;
var cam_vel_influence = obj_stage_main.cam_vel_influence;
for (var i = 0; i < array_length_1d(_obj_array);i++) {
    with _obj_array[i] {
    	avg_vel = [(cam_vel_influence*avg_vel[0]+hsp)/(cam_vel_influence+1),(cam_vel_influence*avg_vel[1]+vsp)/(cam_vel_influence+1)];
    	//else avg_vel = [hsp, vsp];
        _x_avg += x+avg_vel[0]*15;
        _y_avg += y+avg_vel[1]*10;
        //_x_avg += _obj_array[i].x+_obj_array[i].hsp*10;
        //_y_avg += _obj_array[i].y+_obj_array[i].vsp*5;
        _count++;
    }
}
_x_avg /= _count;
_y_avg /= _count;
follow_point.x = _x_avg + obj_stage_main.cam_offset[0];//+ follow_player.hsp*10;
follow_point.y = _y_avg + obj_stage_main.cam_offset[1];//+ follow_player.vsp*10; //+(follow_player.down_held > 20)*50-(follow_player.up_held > 20)*50;

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
    if debug print_debug("[RM] Adding... "+string(_room_id));
    array_push(array_room_data,room_data);
    array_push(array_room_ID,_room_id);
} else {
    array_room_data[_room_id_ind] = room_data;
    array_room_ID[_room_id_ind] = _room_id;
}
#define room_switch(_room_id) //Switches the room
if debug print_debug("[RM] Switching to... "+string(_room_id));
if _room_id != cur_room {
    cur_room_time = 0;
    var _room_id_ind = array_find_index(array_room_ID,_room_id);
    if _room_id_ind != - 1 {
        cur_room = _room_id;
        room_switch_on = true;
        room_switch_timer = 0;
        //despawn_room();
		//room_render(cur_room);
    } else {
        var _room_id_ind = array_find_index(array_room_ID,0);
        cur_room = 0;
        print_debug("[RM] Error: Room Index not found.");
        despawn_room();
        room_render(cur_room);
    }
    
} else {
	print_debug("[RM] CURRENT ROOM");
	despawn_room();
    room_render(cur_room);
}
with oPlayer set_state(PS_IDLE);
switch_to_room = cur_room;
#define room_switch_update() //Runs when a room transition is in effect
with oPlayer {
	//if other.room_switch_timer == 1 set_state(PS_SPAWN);
	//if other.room_switch_timer == other.room_switch_time set_state(PS_IDLE);
}
//cam_state = -1;
switch room_switch_type {
	case 1: //Rectangle Slide
		if room_switch_timer == floor(room_switch_time/2) {
			despawn_room();
			room_render(cur_room);
			switch_room_position(switch_to_room_pos);
			with obj_stage_article if num == 3 {
				event_id = other.room_switch_event;
				event_triggered = true;
			}
		}
		if room_switch_timer >= room_switch_time {
			switch_reset();
		}
		break;
	case 2: //Fade Out/In
		if room_switch_timer == floor(room_switch_time/2) {
			despawn_room();
			room_render(cur_room);
			switch_room_position(switch_to_room_pos);
			with obj_stage_article if num == 3 {
				event_id = other.room_switch_event;
				event_triggered = true;
			}
		}
		if room_switch_timer >= room_switch_time {
			switch_reset();
		}
		break;
	case 0:
		
		despawn_room();
		room_render(cur_room);
		switch_room_position(switch_to_room_pos);
		switch_reset();
		break;
}
room_switch_timer++;

#define switch_reset()
room_switch_type = 0;
room_switch_on = false;
cam_state = 0;
with action_manager {
	room_id = other.cur_room;
	array_push(action_queue, [other.cur_room,1,1]);
}
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
                                art = instance_create(rel_pos[0],rel_pos[1],"obj_stage_article_solid",cell_data[j][0]);
                                break;
                            case 1:
                                //obj_type = "obj_stage_article_platform";
                                art = instance_create(rel_pos[0],rel_pos[1],"obj_stage_article_platform",cell_data[j][0]);
                                break;
                            case 0:
                                //obj_type = "obj_stage_article";
                                art = instance_create(rel_pos[0],rel_pos[1],"obj_stage_article",cell_data[j][0]);
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
                        art.debug = obj_stage_main.debug;
                        
                        //if cell_data[j][6][1] == 1 cell_data[@j][@6][@0] = -1;
                        articles_spawned++;
                        
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


#define real_to_grid(_pos) //Translate real coordinates into coordinates on the basegame grid 
//return [_pos[0] - init_cam_pos[0]+true_pos[0], _pos[1] - init_cam_pos[1]+true_pos[1]]; 
//return [_pos[0] - render_offset[0], _pos[1] - render_offset[1]]; 
return _pos;
#define cell_to_real(_pos,_cell_pos) //Translate cell coordinates to real
//_pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];
return [(_pos[0]-grid_offset)*cell_size + (cell_dim[0]*_cell_pos[0]-grid_offset*(_cell_pos[0] != 0))*cell_size + render_offset[0], 
		(_pos[1]-grid_offset)*cell_size + (cell_dim[1]*_cell_pos[1]-grid_offset*(_cell_pos[1] != 0))*cell_size + render_offset[1]];
#define cell_to_grid(_pos, _cell_pos) //Translate cell coordinates to the basegame grid system
return real_to_grid(cell_to_real(_pos,_cell_pos));
#define grid_to_cell(_pos) //Translate basegame grid system coordinates to in cell coordinates
_pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];
cell_pos = [floor(_pos[0]/((cell_dim[0]-grid_offset)*cell_size)),
			-floor(_pos[1]/((cell_dim[1]-grid_offset)*cell_size))];
return [cell_dim[0]*16 - (_pos[0] % ((cell_dim[0]-grid_offset)*cell_size)),
		cell_dim[1]*16 - (_pos[1] % ((cell_dim[1]-grid_offset)*cell_size))];

#define base_to_am(_pos) //Translate base-game coordinates to AM coordinates
_pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];
return [[cell_dim[0]*16 - (_pos[0] % ((cell_dim[0]-grid_offset)*cell_size)),
		 cell_dim[1]*16 - (_pos[1] % ((cell_dim[1]-grid_offset)*cell_size))],
		[-floor(_pos[0]/((cell_dim[0]-grid_offset)*cell_size)),
		 -floor(_pos[1]/((cell_dim[1]-grid_offset)*cell_size))]];

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
	with oPlayer x = other.follow_point.x;
	//follow_player.x = follow_point.x;
}
if (_pos[1] != -1) {
	follow_point.y = _pos[1];
	with oPlayer y = other.follow_point.y;
	//follow_player.y = follow_point.y;
}
with oPlayer visible = true;
//set_view_position(follow_point.x,follow_point.y);
with obj_stage_main g_cam_pos = [other.follow_point.x,other.follow_point.y];
/*#define set_view_position_smooth(_x,_y)
//var sm_x = (((_x + true_pos[0])/2 + true_pos[0])/2 + true_pos[0])/2;
//var sm_y = (((_y + true_pos[1])/2 + true_pos[1])/2 + true_pos[1])/2;
var sm_x = true_pos[0];
var sm_y = true_pos[1];
if scroll_horiz sm_x = round(ease_linear(floor(true_pos[0]),floor(_x),1,1/smoothing));
else sm_x = round(ease_linear(floor(true_pos[0]),floor(cam_override_obj.cam_override_pos[0]),1,1/smoothing));
if scroll_vert sm_y = round(ease_linear(floor(true_pos[1]),floor(_y),1,1/smoothing));
else sm_y = round(ease_linear(floor(true_pos[1]),floor(cam_override_obj.cam_override_pos[1]),1,1/smoothing));
//var dir_x = _x - true_pos[0];
//var dir_y = _y - true_pos[1];

//set_view_position(sm_x, sm_y);
with obj_stage_main g_cam_pos = [sm_x, sm_y];
//static_position = [round(sm_x),round(sm_y)];
with obj_stage_article {
	if num == 1 && static {
		x = sm_x;
		y = sm_y;
	}
}
//set_view_position(round(sm_x), round(sm_y));
//set_view_position(sm_x, sm_y);
*/