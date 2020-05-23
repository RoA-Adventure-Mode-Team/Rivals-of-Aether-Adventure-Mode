//

if !_init {
    anim_speed  = [.1,.1,.3];
    anim_type = 0;
    event_id = spawn_variables[0];
    active_scene = spawn_variables[1];
    trigger_obj_type = spawn_variables[2];
    trigger_player = spawn_variables[3];
    //trigger_obj_type = oPlayer;
    trigger_shape = spawn_variables[4];
    trigger_w = spawn_variables[5];
    trigger_h = spawn_variables[6];
    cur_scene = 0;
    trigger_var = noone;
    //trigger_objects = [pHitBox];
    //trigger_player = [all];
    collis_obj = noone;
    destroy_on_trigger = true;
    destroy_effect = asset_get("sfx_ice_shatter_big");
    
    
    switch trigger_obj_type {
        case 0:
            trigger_obj_type = oPlayer;
            break;
        case 1:
            trigger_obj_type = pHitBox;
            break;
        case 2: //Set yer own, customly from the scene manager
            break;
    }
    _init = 1;
}
state_timer++;



if state == 0 { //spawning, might be unessesary?
    state = 1;
}
if state == 1 { //trigger active
    with obj_stage_article if num == 3 {
        other.cur_scene = cur_scene;
    }
    switch trigger_shape {
        case 0:
            collis_obj = collision_rectangle(x,y,x+trigger_w,y+trigger_h,trigger_obj_type,false,true);
            break;
        case 1:
            collis_obj = collision_circle(x,y,trigger_w,trigger_obj_type,true,true);
            break;
        case 2:
            collis_obj  = instance_place(x,y,trigger_obj_type);
            break;
    }
    if collis_obj != noone && (trigger_player == 0 || trigger_player == collis_obj.player ) && (active_scene == 0 || cur_scene == active_scene) {
        with obj_stage_article if num == 3 {
            
            event_triggered = true;
            trigger_id = other.id;
            obj_triggered = other.collis_obj;
            event_id = other.event_id;
            if other.destroy_on_trigger other.state = 2;
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