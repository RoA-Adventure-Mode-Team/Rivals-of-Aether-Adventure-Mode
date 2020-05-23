//

if array_length_1d(array_room_data) == 0 { //Initializations
    reload_rooms();
    room_switch(1);
}
//if cur_room == 0 room_switch(1);
/*cur_room_time++;
if cur_room_time > 500 {
    room_switch(cur_room++);
    cur_room_time = 0;
}*/

if switch_to_room != cur_room room_switch(switch_to_room);

#define reload_rooms()
cur_room = 0;
cur_room_time = 0;
array_room_ID = array_create(0);
array_room_data = array_create(0);
array_room_transition_time = 120;
array_room_name = 0;

room_add(0,[]);
user_event(1); //Room Load Event Script

//room_switch(1);

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
#define room_switch(_room_id)
if debug print_debug("[RM] Switching to... "+string(_room_id));
despawn_room();
if _room_id != cur_room {
    
    cur_room_time = 0;
    var _room_id_ind = array_find_index(array_room_ID,_room_id);
    if _room_id_ind != - 1 {
        cur_room = _room_id;
        spawn_room(_room_id_ind);
    } else {
        var _room_id_ind = array_find_index(array_room_ID,0);
        cur_room = 0;
        spawn_room(_room_id_ind);
    }
    
} 
switch_to_room = cur_room;
#define room_reload()
despawn_room();
spawn_room(cur_room);

#define spawn_room(_room_id)
if _room_id < array_length_1d(array_room_data) {
    var room_data = array_room_data[_room_id];
    for (var i = 0; i < array_length_1d(room_data); i++) {
        //if debug print_debug("[RM] RoomData:"+string(room_data[i]));
        var obj_type;
        switch room_data[i][3] {
            case 2:
                obj_type = "obj_stage_article_solid";
                break;
            case 1:
                obj_type = "obj_stage_article_platform";
                break;
            case 0:
                obj_type = "obj_stage_article";
            break;
        }
        //if debug print_debug("[RM] OBJ_TYPE: "+obj_type);
        var art = instance_create((room_data[i][1]-grid_offset)*cell_size,(room_data[i][2]-grid_offset)*cell_size,obj_type,room_data[i][0]);
        art.spawn_variables = room_data[i][5];
        art.depth = room_data[i][4];
        ds_list_add(list_room, art);
        //if debug print_debug("[RM] ListRoom: "+string(list_room));
    }
} else if debug print_debug("[RM] Unfound Room ID");
#define despawn_room()

for (var i = 0; i < ds_list_size(list_room); i++) {
    if instance_exists(list_room[| i]) instance_destroy(list_room[| i]);
}
ds_list_clear(list_room);