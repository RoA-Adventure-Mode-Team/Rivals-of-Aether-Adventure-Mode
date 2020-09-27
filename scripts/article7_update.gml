//article7_update, Camera Controller

if !_init {
    trigger_shape = spawn_variables[0];
    trigger_w = spawn_variables[1];
    trigger_h = spawn_variables[2];
    lock_type = spawn_variables[3];
    if spawn_variables[4] == 0 cam_lock_x = trigger_w/2;
    else cam_lock_x = spawn_variables[4];
    if spawn_variables[5] == 0 cam_lock_y = trigger_h/2;
    else cam_lock_y = spawn_variables[5];
    cam_override_pos = [init_pos[0]+cam_lock_x,
                        init_pos[1]+cam_lock_y];
    // cam_override_pos = [init_pos[0]+cam_lock_x/cell_size,
    //                     init_pos[1]+cam_lock_y/cell_size];
                        
    active_scene = spawn_variables[6];
    _init = 1;
    //print_debug(string(cam_override_pos));
}
state_timer++;

if state == 0 && (active_scene == 0 || active_scene == room_manager.cur_scene){ //trigger active
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
    if collis_obj != noone  {
        with obj_stage_article if num == 5 {
            switch other.lock_type {
                case 0:
                    scroll_horiz = false;
                    scroll_vert = false;
                    break;
                case 1:
                    scroll_horiz = false;
                    scroll_vert = true;
                    break;
                case 2:
                    scroll_horiz = true;
                    scroll_vert = false;
                    break;
            }
            cam_override_obj = other;
            //cam_override_offset = [cam_lock_x,cam_lock_y];
            
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