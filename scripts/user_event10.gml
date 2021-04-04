//Custom Item behavior - DEPRACATED

enum EVT {
    GROUND,
    IDLE,
    GRAB,
    USE
}

//Item Global Default behaviors - feel free to customize :)
switch event_flag {
    case EVT.GRAB:
        sound_play(asset_get("mfx_coin"));
        break;
    case EVT.IDLE:
        if follow_player.attack_down state = EVT.USE; //Switch to the use state
        break;
}


//Item Template

switch item_id {
    case 0:
        switch event_flag {
            case EVT.GRAB:
                break;
            case EVT.IDLE:
                // take_damage(follow_player.player,5,1);
                break;
            case EVT.USE:
                instance_destroy();
                exit;
                break;
        }
        break;
}

