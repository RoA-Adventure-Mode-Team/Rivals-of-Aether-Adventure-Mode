//article4_update, Trigger Zones

if !_init {
    action_id = spawn_variables[0];
    active_scene = spawn_variables[1];
    trigger_obj_type = spawn_variables[2];
    if spawn_variables[3] != 0 trigger_cooldown_max  = spawn_variables[3];
    if spawn_variables[3] == -1 destroy_on_trigger = true;
    //trigger_obj_type = oPlayer;
    trigger_shape = spawn_variables[4];
    if trigger_shape > 1 { //If the variable looks to be an index, use it
        // visible = false;
        image_xscale = 2;
        image_yscale = 2;
        sprite_index = trigger_shape;
        sprite_index = asset_get("empty_sprite");
        mask_index = trigger_shape; 
    }
    trigger_w = spawn_variables[5];
    trigger_h = spawn_variables[6];
    if array_length_1d(spawn_variables[7]) > 0 req_item_id = spawn_variables[7][0];
    if array_length_1d(spawn_variables[7]) > 1 hold_up = spawn_variables[7][1];
    if array_length_1d(spawn_variables[7]) > 2 trigger_relative = spawn_variables[7][2];
    if array_length_1d(spawn_variables[7]) > 3 check_visibility = spawn_variables[7][3];
    with obj_stage_article if num == 3 other.action_manager = id;
    
    //cur_scene = 0;
    //trigger_var = noone;
    //trigger_objects = [pHitBox];
    //trigger_player = [all];
    //collis_obj = noone;
    //destroy_on_trigger = true;
    
    switch trigger_obj_type { //If zero select player, else use the given object index
        case 0: //Player
            trigger_obj_type = oPlayer;
            break;
        // case 1: //Hitbox
        //     trigger_obj_type = pHitBox;
        //     break;
        // case 2: //Stage Article
        //     trigger_obj_type = obj_stage_article;
        //     break;
    }
    visible = true;
    _init = 1;
}
// with oPlayer if state == PS_RESPAWN print("[article4:draw] started check");
with action_manager other.cur_scene = scene_id;
switch trigger_shape {
    case 0:
        collis_obj = collision_rectangle(x,y,x+trigger_w*spr_dir,y+trigger_h,trigger_obj_type,false,true);
        break;
    case 1:
        collis_obj = collision_circle(x,y,trigger_w*spr_dir,trigger_obj_type,true,true);
        break;
    default:
        // image_xscale = spr_dir;
        collis_obj  = instance_place(x,y,trigger_obj_type);
        break;
}
if collis_obj != noone && (!(req_item_id == 0 || (("num" in collis_obj && collis_obj.num == 10 && collis_obj.item_id == req_item_id[0])))
|| (!hold_up || collis_obj.up_down)) && (active_scene == 0 || (active_scene > 0 && cur_scene >= active_scene) || (active_scene < 0 && cur_scene <= abs(active_scene))) {
    if trigger_cooldown == 0 {
        if check_visibility != 0 {
            var _cont = 1;
           with obj_stage_article {
               if num != 1 || depth > other.collis_obj.depth continue; //only care about visible sprites via article1, and also only those sprites in front of the check.
               if place_meeting(x,y,other.collis_obj) {
                   _cont = 0; //If there's something in the way, then don't trigger
                //   print("[TZ] ARTICLE IN FRONT: "+string(num)+":"+string(depth));
               }
               
           }
           if !_cont exit;
        }
        trigger_cooldown = trigger_cooldown_max;
        if debug print_debug("[TZ] TRIGGERED ACTION "+string(action_manager.room_id)+":"+string(active_scene)+":"+string(action_id));
        if trigger_relative with action_manager array_push(action_queue, [room_id, other.active_scene, other.action_id, other.collis_obj]);
        else  with action_manager array_push(action_queue, [room_id, other.active_scene, other.action_id]);
        // with action_manager array_push(action_queue, [room_id, other.active_scene, other.action_id, other.id]);
        if req_item_id != 0 with collis_obj { //Remove Item
            if object_index == obj_stage_article && num == 10 && item_id > -1 && item_id == other.req_item_id collis_obj.state = 4; //if item, destroy
            if object_index == oPlayer && item_id > -1 && item_id.item_id == other.req_item_id item_id.state = 4; //if player, check for item and destroy
        }
        if destroy_on_trigger {
            instance_destroy();
            exit;
        }
        
    }
} else {
    if trigger_cooldown > 0 {
        trigger_cooldown--;
        exit;
    }
}

// with oPlayer if state == PS_RESPAWN print("[article4:draw] completed check");

