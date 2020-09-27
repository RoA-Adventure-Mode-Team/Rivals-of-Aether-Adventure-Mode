// Custom Item Code - Article 10 Update

//Called upon when an item is on screen


//Custom Item Code Here

switch item_id {
    default:
    with item_id {
        if state == 0 break;
        if state == 1 break;
    }
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