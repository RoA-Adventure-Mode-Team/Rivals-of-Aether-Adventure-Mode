//Custom Item behavior

enum EVT {
    GRAB,
    IDLE,
    USE,
    ALTUSE,
    DESTROY,
    DROP
}

//Item Global Default behaviors - feel free to customize :)
switch event_flag {
    case EVT.GRAB:
        sound_play(asset_get("mfx_coin"));
        break;
    case EVT.IDLE:
        if follow_player.attack_down set_state(EVT.USE); //Switch to the use state
        if follow_player.taunt_down set_state(EVT.ALTUSE); //Switch to the use state
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
                    take_damage(player,5,-35);
                    sound_play(asset_get("sfx_syl_fspecial_bite"));
                    spawn_hit_fx(x+spr_dir*32,y-32,148); //Spicy Burger
                }
                set_state(EVT.DESTROY);
                break;
        }
        break;
    case 1: //Small Crate in Meadows
        switch event_flag {
            case EVT.GRAB:
                break;
            case EVT.IDLE:
                break;
            case EVT.USE:
                set_state(EVT.IDLE); //Keep the item
                break;
        }
        break;
    case 2: //Key to Sewers
        switch event_flag {
            case EVT.GRAB:
                
                break;
            case EVT.IDLE:
                break;
            case EVT.USE:
                set_state(EVT.IDLE); //Keep the item
                break;
        }
        break;
    case 3: //Full Heal
        switch event_flag {
            case EVT.GRAB:
                with follow_player {
                    take_damage(player,5,-999);
                }
                set_state(EVT.DESTROY); //Keep the item
                break;
        }
        break;
    case 4: //Shield
        switch event_flag {
            case EVT.GRAB:
                //create a new variable to track damage taken
                absorb_damage = 30;
                with follow_player {
                    other.fp_damage_old = get_player_damage(player);
                }
                break;
            case EVT.IDLE:
                with follow_player {
                    if other.fp_damage_old != get_player_damage(player) {
                        take_damage(player,5,other.fp_damage_old-get_player_damage(player));
                        other.absorb_damage -= other.fp_damage_old-get_player_damage(player);
                        hitpause = 0;
                        hitstun = 0;
                        sound_play(asset_get("mfx_coin"));
                    }
                    other.fp_damage_old = get_player_damage(player);
                }
                if absorb_damage <= 0 set_state(EVT.DESTROY);
                break;
            case EVT.USE:
                set_state(EVT.IDLE); //Keep the item, is static
                break;
        }
        break;
    case 5: //"Health" Potion
        switch event_flag {
            case EVT.GRAB:
                break;
            case EVT.IDLE:
                break;
            case EVT.USE:
                create_hitbox(AT_JAB,9,follow_player.x,follow_player.y);
                with follow_player take_damage(player,5,20);
                set_state(EVT.DESTROY); //Keep the item
                break;
        }
        break;
}



#define set_state(_state)
state_timer = 0;
state = _state;

#define start_action(_room_id, _scene_id, _action_id, _starting_id)
with action_manager array_push(action_queue,[_room_id,_scene_id,_action_id,_starting_id]);
