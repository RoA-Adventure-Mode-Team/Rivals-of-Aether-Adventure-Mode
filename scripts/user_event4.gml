//Custom Scene Triggers - Scene Manager

//Called upon when TG_CUSTOM is set for a scene.


switch cur_room {
    case 1:
        switch cur_scene {
            case 1:
                break;
        }
    break;
}



//



//DO NOT EDIT BELOW
#define scene_switch(_scene_id)
with obj_stage_article if num == 3 switch_to_scene = _scene_id;
#define room_switch(_room_id)
with obj_stage_article if num == 5 switch_to_room = _room_id;
