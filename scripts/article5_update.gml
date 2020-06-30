//
if get_gameplay_time() == 2 {
    
    cam_pos_left = [view_get_xview(),view_get_yview()];
    cam_pos_right = [view_get_xview()+view_get_wview(),view_get_yview()+view_get_hview()];
    true_pos = [cam_pos_left[0]+view_get_wview()/2,cam_pos_left[1]+view_get_hview()/2];
    init_cam_pos = [cam_pos_left[0]+view_get_wview()/2,cam_pos_left[1]+view_get_hview()/2];
    reload_rooms();
    switch_to_room_pos = cell_to_grid(follow_player.respawn_point[0],follow_player.respawn_point[1]);
    room_switch(follow_player.respawn_point[2]);
   
    last_pos[0] = follow_player.x;
    last_pos[1] = follow_player.y;
}

if switch_to_room != cur_room room_switch(switch_to_room);
if room_switch_on room_switch_update();

with follow_player {
	if state == PS_DEAD || state == PS_RESPAWN {
		if (state_timer == 89 && state == PS_RESPAWN) {
			smoothing = 1;
			visible = false;
			set_state(PS_IDLE_AIR);
			with other {
				//var true_pos_new = cell_to_grid(other.respawn_point[0],other.respawn_point[1]);
				//true_pos = true_pos_new;
				room_switch_type = 1;
    			switch_to_room_pos = cell_to_grid(follow_player.respawn_point[0],follow_player.respawn_point[1]);
			    room_switch(follow_player.respawn_point[2]);
		        room_switch_on = true;
		        room_switch_timer = 0;
				/*follow_point.x = true_pos[0];
				follow_point.y = true_pos[1];*/
			}
		}
		if (state_timer < 89 && state == PS_RESPAWN) || state == PS_DEAD  {
			with other {
				//var true_pos_new = cell_to_grid(other.respawn_point[0],other.respawn_point[1]);
				//true_pos = true_pos_new;
				follow_player.x = init_cam_pos[0];
				follow_player.y = init_cam_pos[1];
				/*follow_point.x = true_pos[0];
				follow_point.y = true_pos[1];*/
			}
		}
	}
}

if get_gameplay_time() > 3 && room_type == 1 { //Scrolling Room
    set_view_position(init_cam_pos[0],init_cam_pos[1]);
    if !respawning set_follow_point(follow_objects);

    if follow_player.state != PS_HITSTUN room_scroll();
    //Frame Cleanups
    last_pos[0] = follow_point.x;
    last_pos[1] = follow_point.y;
    scroll_horiz = true;
    scroll_vert = true;
}

/*if get_gameplay_time() % 1 == 0 {
    e = instance_create(follow_point.x,follow_point.y,"obj_stage_article",1);
    e.num = 2; //empty script
    //ds_list_add(list_room,e);
    //ds_list_add(list_room,instance_create(follow_point.x,follow_point.y,"obj_stage_article",1));
}*/

cur_room_time++;
#define set_follow_point(_obj_array) //Set the point the room will follow to
var _x_avg = 0;
var _y_avg = 0;
var _count = 0;
for (var i = 0; i < array_length_1d(_obj_array);i++) {
    if instance_exists(_obj_array[i]) {
        _x_avg += _obj_array[i].x;
        _y_avg += _obj_array[i].y;
        _count++;
    }
}
_x_avg /= _count;
_y_avg /= _count;
follow_point.x = _x_avg;
follow_point.y = _y_avg;//+(follow_player.down_held > 20)*50-(follow_player.up_held > 20)*50;
#define room_scroll() //Scroll the whole room to the camera
horiz_dir = 0;
vert_dir = 0;
var left_off = 0;
var right_off = 0;
var up_off = 0;
var down_off = 0;

//Camera restriction checks and scrolling
if !instance_exists(cam_override_obj) {
    cam_override_obj = noone;
    scroll_vert = true;
    scroll_horiz = true;
}

if scroll_horiz {
    left_off = follow_point.x - cam_pos_left[0] + cam_offset[0];
    right_off = cam_pos_right[0] - follow_point.x - cam_offset[0];
    if left_off < follow_offset*1.777 horiz_dir = floor(1*(follow_offset*1.777 - left_off));
    if right_off < follow_offset*1.777 horiz_dir = ceil(-1*(follow_offset*1.777 - right_off));
    
} else {
	follow_point.x = cell_to_grid(cam_override_obj.cam_override_pos,cam_override_obj.cell_pos)[0]-cell_size*2.5;
    left_off = abs(follow_point.x - cam_pos_left[0]);
    horiz_dir = (follow_offset*1.777 - left_off);
}

if scroll_vert {
    up_off = follow_point.y - cam_pos_left[1] + cam_offset[1];
    down_off = cam_pos_right[1] - follow_point.y - cam_offset[1];
    if up_off < follow_offset vert_dir = floor(1*(follow_offset - up_off));
    if down_off < follow_offset vert_dir = ceil(-1*(follow_offset - down_off));
} else {
    follow_point.y = cell_to_grid(cam_override_obj.cam_override_pos,cam_override_obj.cell_pos)[1]-cell_size*2;
    up_off = abs(follow_point.y - cam_pos_left[1]);
    vert_dir = (follow_offset - up_off);
}

horiz_dir = round(horiz_dir*smoothing);
vert_dir = round(vert_dir*smoothing);
if horiz_dir != 0 { //Cause all entities we can access to scroll
    with oPlayer x += other.horiz_dir;
    
    //BASE CAST EXCEPTIONS ARE IMPOSSIBLE - WE CANNOT EDIT THEM
    
    //
    
    with pHitBox x += other.horiz_dir;
    with obj_article1 x += other.horiz_dir;
    with obj_article2 x += other.horiz_dir;
    with obj_article3 x += other.horiz_dir;
    with obj_article_solid x += other.horiz_dir;
    with obj_article_platform x += other.horiz_dir;
    with hit_fx_obj x += other.horiz_dir;
    //We cannot move dust particles currently - will uncomment if we can later on
    /*if "new_dust_fx_obj" in self with asset_get("new_dust_fx_obj") x += other.horiz_dir;
    if "dust_fg_surface" in self with asset_get("dust_fg_surface") x += other.horiz_dir;
    if "smoke_fg_surface" in self with asset_get("smoke_fg_surface") x += other.horiz_dir;
    if "smoke_bg_surface" in self with asset_get("smoke_bg_surface") x += other.horiz_dir;*/
    with obj_stage_article x += other.horiz_dir;
    with obj_stage_article_solid x += other.horiz_dir;
    with obj_stage_article_platform x += other.horiz_dir;
    true_pos[0] += scroll_speed*horiz_dir;
}
if vert_dir != 0 { //Cause all entities we can access to scroll
    with oPlayer {
        y += other.vert_dir;
        if other.vert_dir == -1 && prev_state == PS_LAND free = 0;
    }
    with pHitBox y += other.vert_dir;
    with obj_article1 y += other.vert_dir;
    with obj_article2 y += other.vert_dir;
    with obj_article3 y += other.vert_dir;
    with obj_article_solid y += other.vert_dir;
    with obj_article_platform y += other.vert_dir;
    with hit_fx_obj y += other.vert_dir;
    //We cannot move dust particles currently - will uncomment if we can later on
    /*if "new_dust_fx_obj" in self with asset_get("new_dust_fx_obj") y += other.vert_dir;
    if "dust_fg_surface" in self with asset_get("dust_fg_surface") y += other.vert_dir;
    if "smoke_fg_surface" in self with asset_get("smoke_fg_surface") y += other.vert_dir;
    if "smoke_bg_surface" in self with asset_get("smoke_bg_surface") y += other.vert_dir;*/
    with obj_stage_article y += other.vert_dir;
    with obj_stage_article_solid y += other.vert_dir;
    with obj_stage_article_platform y += other.vert_dir;
    true_pos[1] += scroll_speed*vert_dir;
}

pos_in_cell = grid_to_cell(true_pos);
if old_cell_pos != cell_pos && !room_switch_on {
    room_render(cur_room);
    old_cell_pos = cell_pos;
}





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
    
} 
with oPlayer set_state(PS_IDLE);
switch_to_room = cur_room;
#define room_switch_update() //Runs when a room transition is in effect
with oPlayer {
	set_state(PS_IDLE);
	vsp = 0;
	hsp = 0;
}
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
			room_switch_type = 0;
			room_switch_on = false;
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
			room_switch_type = 0;
			room_switch_on = false;
		}
		break;
	case 0:
		room_switch_type = 0;
		room_switch_on = false;
		despawn_room();
		room_render(cur_room);
		switch_room_position(switch_to_room_pos);
		break;
}
room_switch_timer++;

#define room_render(_room_id) //Renders the current room. Runs on cell change, room transitions, and respawn usually.
var articles_spawned = 0;
if _room_id < array_length_1d(array_room_data) {
    room_data = array_room_data[_room_id];
   for (var i = 0; i < array_length_1d(room_data) && articles_spawned < article_frame_limit; i++) { //For each cell
        _cell_pos = room_data[i][0];
        cell_data = room_data[i][1];
        if abs(abs(_cell_pos[0]) - abs(cell_pos[0])) < 2 && abs(abs(_cell_pos[1]) - abs(cell_pos[1])) < 2 { 
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
                        art.cell_size = cell_size;
                        art.init_pos = [cell_data[j][1],cell_data[j][2]];
                        art.cell_pos = _cell_pos;
                        cell_data[@j][@6][@0] = art.id;
                        art.custom_args = cell_data[j][6][0];
                        articles_spawned++;
                }
                
            }
        } else {
            //print_debug(string(_cell_pos)+": "+string(abs(_cell_pos[1] - cell_pos[1])));
            for (var j = 0; j < array_length_1d(cell_data); j++) {
                if cell_data[j][6][0] != 0 && cell_data[j][6][0] != -1 {
                    instance_destroy(cell_data[j][6][0]);
                    cell_data[@j][@6][@0] = 0;
                }
                
            }
                
        }
    }
} else if debug print_debug("[RM] Unfound Room ID");

#define real_to_grid(_pos) //Translate real coordinates into coordinates on the basegame grid 
return [_pos[0] - init_cam_pos[0]+true_pos[0], _pos[1] - init_cam_pos[1]+true_pos[1]];
#define cell_to_real(_pos,_cell_pos) //Translate cell coordinates to real
return [(_pos[0]-grid_offset)*cell_size + (cell_dim[0]*_cell_pos[0]-grid_offset*(_cell_pos[0] != 0))*cell_size, (_pos[1]-grid_offset)*cell_size + (cell_dim[1]*_cell_pos[1]-grid_offset*(_cell_pos[1] != 0))*cell_size];
#define cell_to_grid(_pos, _cell_pos) //Translate cell coordinates to the basegame grid system
return real_to_grid(cell_to_real(_pos,_cell_pos));
#define grid_to_cell(_pos) //Translate basegame grid system coordinates to in cell coordinates
cell_pos = [floor(_pos[0]/((cell_dim[0]-grid_offset)*cell_size)),floor(_pos[1]/((cell_dim[1]-grid_offset)*cell_size))];
return [_pos[0] % ((cell_dim[0]-grid_offset)*cell_size),_pos[1] % ((cell_dim[1]-grid_offset)*cell_size)];
#define despawn_room() //Despawns all articles in a current room. If an article was a 1 time use, it won't respawn.
var _room_id = cur_room;
for (var k = 0; k < array_length_1d(array_room_data[_room_id]); k++) {
        for (var j = 0; j < array_length_1d(array_room_data[_room_id][k][1]); j++) { //Check objects inside the array
            if array_room_data[@_room_id][k][1][j][6][0] != -1 array_room_data[@_room_id][@k][@1][@j][@6][@0] = 0; //Set to not spawned if not dead
        }
    }
with obj_stage_article if num != 3 && num != 5 instance_destroy(id);
with obj_stage_article_platform instance_destroy(id);
with obj_stage_article_solid instance_destroy(id);

#define switch_room_position(_pos) //Switches the room position in grid space (Harbige12)
if (_pos[0] != -1) {
	follow_point.x = _pos[0];
	follow_player.x = follow_point.x;
}
if (_pos[1] != -1) {
	follow_point.y = _pos[1];
	follow_player.y = follow_point.y;
}
follow_player.visible = true;

