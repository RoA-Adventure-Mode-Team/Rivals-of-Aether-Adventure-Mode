// Custom Events - Scene Manager

//Called upon when event_triggered = true, for event_id in the scene manager


//Custom Event Code Here
switch event_id {
    case 2:
        sound_play(asset_get("mfx_coin"));
        room_switch(1);
        break;
    case 1:
        set_player_damage(obj_triggered.player,69);
        sound_play(asset_get("sfx_forsburn_breath"));
        //room_switch(2);
        //with obj_stage_article if num == 6 if player_controller == 0 player_controller = 1;
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
