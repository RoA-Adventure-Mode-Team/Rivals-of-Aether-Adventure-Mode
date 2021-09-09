//article17_update, Note - DEPRECATED - Using windows
enum S {
    IDLE,
    START,
    ACTIVE,
    END
}

if !_init {
    note_spr = spawn_variables[1];
    trigger_w = spawn_variables[2];
    trigger_h = spawn_variables[3];
    set_state(S.IDLE);
    visible = true;
    _init = 1;
}

switch state {
    case S.IDLE:
        collis_obj = collision_rectangle(x,y,x+trigger_w,y+trigger_h,oPlayer, false, true);
        if collis_obj != noone {
            if collis_obj.up_down {
                set_state(S.START);
                player_obj = collis_obj;
            }
        }
        break;
    case S.START:
        break;
    case S.ACTIVE:
        if player_obj.hold_up note_position[@1] -= note_scroll[1];
        if player_obj.hold_down note_position[@1] += note_scroll[1];
        if player_obj.special_down set_state(S.END);
        break;
    case S.END:
        break;
}


#define set_state(_state)
state_timer = 0;
state = _state;
return;