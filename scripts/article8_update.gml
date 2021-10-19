//article8_update, Room Transition

if !_init {
    active_scene = spawn_variables[0];
    trigger_shape = spawn_variables[1];
    trigger_w = spawn_variables[2];
    trigger_h = spawn_variables[3];
    to_room = spawn_variables[4];
    extra_room_vars = spawn_variables[5]; //Room_switch_type, room_x, room_y
    hold_up = spawn_variables[6];
    action_id = spawn_variables[7];
    item_needed = spawn_variables[8];
    visible = true;
    _init = 1;
}
state_timer++;

if state == 0 { //trigger active
    with action_manager other.cur_scene = scene_id;
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
    if collis_obj != noone && (!hold_up || collis_obj.up_down) && (item_needed == 0 || (collis_obj.item_id != noone && item_needed == collis_obj.item_id.item_id))
    && (active_scene == 0 || (active_scene > 0 && cur_scene >= active_scene) || (active_scene < 0 && cur_scene <= abs(active_scene))) {
        
        with room_manager {
            switch_to_room_pos = [other.extra_room_vars[1], other.extra_room_vars[2]];
            room_switch_type = other.extra_room_vars[0];
            switch_to_room = other.to_room;
            // room_switch_event = other.action_id;
            switch_room = true;
        }
        
        if action_id != 0 {
            with action_manager array_push(action_queue, [room_id, other.active_scene, other.action_id]);
        }
        state = 2;
        if collis_obj.item_id != noone && item_needed == collis_obj.item_id.item_id {
            instance_destroy(collis_obj.item_id);
        }
        
        
        
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