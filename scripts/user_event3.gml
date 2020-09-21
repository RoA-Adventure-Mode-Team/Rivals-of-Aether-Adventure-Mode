// Custom Events - Scene Manager

//Called upon when event_triggered = true, for event_id in the scene manager


//Custom Event Code Here
if debug print_debug("[EM] EVENT TRIGGERED "+string(event_id));
switch event_id {
    case 4:
        create_deathbox(obj_triggered.x,obj_triggered.y,10,10,-1,true,0,6,2);
        sound_play(asset_get("mfx_coin"));
        break;
    case 2:
        sound_play(asset_get("mfx_coin"));
        room_switch(1);
        break;
    case 1:
        scene_switch(2);
        break;
    default:
        if debug print_debug("[SM] No Event Found for ["+string(event_id)+"]");
        break;
}

//


#define scene_switch(_scene_id)
with obj_stage_article if num == 3 switch_to_scene = _scene_id;

#define room_switch(_room_id)
with obj_stage_article if num == 5 switch_to_room = _room_id;

#define unload_article(_id)
with room_manager {
    var _room_id = cur_room;
        for (var k = 0; k < array_length_1d(array_room_data[_room_id]); k++) {
            for (var j = 0; j < array_length_1d(array_room_data[_room_id][k][1]); j++) { //Check objects inside the array
                if array_room_data[@_room_id][k][1][j][6][0] == _id array_room_data[@_room_id][@k][@1][@j][@6][@0] = 0;
            }
        }
}
instance_destroy(_id);