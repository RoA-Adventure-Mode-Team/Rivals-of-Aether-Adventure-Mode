//
enum SI {
    SPAWN,
    IDLE,
    ACTIVE,
    DESTROY
};

if _init == 0 {
    _init = 1;
    exit;
}
state_timer++;



if state == 0 { //spawning, might be unessesary?
    state = 1;
}
if state == 1 { //trigger active
    sprite_index = sprite_list[SI.IDLE];
    switch anim_type {
        default:
            image_index = (image_index + anim_speed[state]);  
        break;
    }

    for (var i = 0; i < array_length_1d(trigger_objects); i++) {
        collis_obj  = instance_place(x,y,trigger_objects[i]);
        if collis_obj != noone {
            with obj_stage_article switch num {
                case 3:
                    window_trigger = other.window;
                    area_triggered = true;
                    break;
            }
            if destroy_on_trigger state = 2;
        }
    }
}

if state == 2 { //destroy
    sprite_index = sprite_list[SI.DESTROY];
    image_index = (image_index + anim_speed[state] );
    if image_index >= image_number {
        instance_destroy();
        exit;
    }
}



if state != state_old { //Placed at end to make sure it updates after changes
    state_timer = 0;
    image_index = 0;
    state_old = state;
    
}