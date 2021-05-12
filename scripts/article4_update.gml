//article4_update, Trigger Zones

if !_init {
    action_id = spawn_variables[0];
    active_scene = spawn_variables[1];
    trigger_obj_type = spawn_variables[2];
    if spawn_variables[3] != 0 trigger_cooldown_max  = spawn_variables[3];
    if spawn_variables[3] == -1 destroy_on_trigger = true;
    //trigger_obj_type = oPlayer;
    trigger_shape = spawn_variables[4];
    trigger_w = spawn_variables[5];
    trigger_h = spawn_variables[6];
    trigger_negative = spawn_variables[7];
    with obj_stage_article if num == 3 other.action_manager = id;
    //cur_scene = 0;
    //trigger_var = noone;
    //trigger_objects = [pHitBox];
    //trigger_player = [all];
    //collis_obj = noone;
    //destroy_on_trigger = true;
    
    switch trigger_obj_type {
        case 0: //Player
            trigger_obj_type = oPlayer;
            break;
        case 1: //Hitbox
            trigger_obj_type = pHitBox;
            break;
        case 2: //Stage Article
            trigger_obj_type = object_stage_article;
            break;
    }
    _init = 1;
}

with action_manager other.cur_scene = scene_id;
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
if collis_obj != noone && (trigger_negative == 0 || ("num" in collis_obj && num == trigger_negative)) && (active_scene == 0 || cur_scene == active_scene) {
    if trigger_cooldown == 0 {
        if debug print_debug("[TZ] TRIGGERED "+string(action_id));
        with action_manager array_push(action_queue, [room_id, other.active_scene, other.action_id]);
        if destroy_on_trigger state = 2;
        trigger_cooldown = trigger_cooldown_max;
    }
} else {
    if trigger_cooldown > 0 {
        trigger_cooldown--;
        exit;
    }
}

