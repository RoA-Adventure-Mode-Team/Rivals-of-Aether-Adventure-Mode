//article8_update, Room Transition

if !_init {
    active_scene = spawn_variables[0];
    trigger_shape = spawn_variables[1];
    trigger_w = spawn_variables[2];
    trigger_h = spawn_variables[3];
    to_room = spawn_variables[4];
    room_switch_type = spawn_variables[5];
    hold_up = spawn_variables[6];
    event_id = spawn_variables[7];
    _init = 1;
}
state_timer++;

if state == 0 { //trigger active
    
    switch trigger_shape {
        case 0:
            collis_obj = collision_rectangle(x,y,x+trigger_w,y+trigger_h,oPlayer,false,true);
            break;
        case 1:
            collis_obj = collision_circle(x,y,trigger_w,oPlayer,true,true);
            break;
        case 2:
            collis_obj  = instance_place(x,y,oPlayer);
            break;
    }
    if collis_obj != noone && (!hold_up || collis_obj.up_down) with obj_stage_article if num == 5 {
        room_switch_type = other.room_switch_type;
        switch_to_room = other.to_room;
        room_switch_event = other.event_id;
    }
}

if state == 2 { //destroy
    instance_destroy();
    exit;
}



if state != state_old { //Placed at end to make sure it updates after changes
    state_timer = 0;
    image_index = 0;
    state_old = state;
    
}