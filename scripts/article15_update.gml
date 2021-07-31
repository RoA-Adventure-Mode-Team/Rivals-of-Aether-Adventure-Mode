//article15_update, Destructable Terrain

if !_init {
    // if spawn_variables[0] < 1000 sprite_index = sprite_get("article1_"+string(spawn_variables[0]));
    sprite_index = spawn_variables[0];
    spr_name = sprite_get_name(sprite_index);
    spr_ = sprite_index;
    mask_index = sprite_index;
    if spawn_variables[4] != 0 sprite_change_collision_mask(sprite_get_name(sprite_index),true, 0, 0, 0, 0, 0, 0);
    anim_speed = spawn_variables[1]*.01;
    group = spawn_variables[2];
    dest_sfx = spawn_variables[3];
    action_id = spawn_variables[5];
    active_scene = spawn_variables[6];
    alpha_time = spawn_variables[7];
    full_alpha = alpha_time;
    destroyed = false;
    
    with obj_stage_article if num == 3 other.action_manager = id;
    with obj_stage_article if num == 5 other.room_manager = id;
    
    _init = 1;
} else {
    image_index += anim_speed;
    if destroyed {
        alpha_time--;
        if alpha_time == 0 {
            instance_destroy();
        } else image_alpha = alpha_time/full_alpha;
        exit;
    }
    collis = instance_place(x,y,pHitBox);
    if collis != noone && collis.player != 5 && (active_scene == 0 || active_scene == cur_scene) {
        if action_id != 0 {
            if debug print_debug("[DT] TRIGGERED "+string(action_id));
            with action_manager array_push(action_queue, [room_id, other.active_scene, other.action_id]);
        }
        sound_play(dest_sfx);
        with collis {
            sound_play(sound_effect);
            spawn_hit_fx(x+hit_effect_x,y+hit_effect_y,hit_effect);
            with player_id {
                old_hsp = hsp;
                old_vsp = vsp;
                
                has_hit = true;
                hitstop = other.hitpause+other.damage*other.hitpause_growth*.05-2;
                hitpause = true;
            }
        }
        destroyed = true;
    }
}