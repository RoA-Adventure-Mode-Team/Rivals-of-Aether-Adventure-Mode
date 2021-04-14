//Custom Item behavior - DEPRACATED

enum EVT {
    GRAB,
    IDLE,
    USE,
    ALTUSE,
    DESTROY,
}

//Item Global Default behaviors - feel free to customize :)
switch event_flag {
    case EVT.GRAB:
        sound_play(asset_get("mfx_coin"));
        break;
    case EVT.IDLE:
        if follow_player.attack_down state = EVT.USE; //Switch to the use state
        if follow_player.taunt_down state = EVT.ALTUSE; //Switch to the use state
        break;
    case EVT.ALTUSE:
        if state_timer >= cooldown_timer {
            set_state(0);
        }
        vsp *= .98;
        hsp *= .98;
        break;
}


//Item Template

switch item_id {
    case 0: //Burger
        switch event_flag {
            case EVT.GRAB:
                break;
            case EVT.IDLE:
                break;
            case EVT.USE:
                with follow_player {
                    take_damage(player,5,-10);
                    sound_play(asset_get("sfx_syl_fspecial_bite"));
                    spawn_hit_fx(x+spr_dir*32,y-32,148); //Spicy Burger
                }
                set_state(EVT.DESTROY);
                break;
        }
        break;
}



#define set_state(_state)
state_timer = 0;
state = _state;