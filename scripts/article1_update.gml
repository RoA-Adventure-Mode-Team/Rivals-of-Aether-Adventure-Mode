//article1_update, Simple Platform

if _init == 0 {
    spr_name = "article1_"+string(spawn_variables[0]);
    spr_ = sprite_get(spr_name);
    if spawn_variables[3] != 0 sprite_change_collision_mask(spr_name,true, 2, 0, 0, sprite_get_width(spr_), sprite_get_height(spr_), 0 );
    sprite_index = sprite_get("article1_"+string(spawn_variables[0]));
    //if sprite_index 
    mask_index = sprite_index;
    anim_speed = spawn_variables[1]*.01;
    group = spawn_variables[2];
    /*marker[0] = spawn_variables[2];
    marker[1] = spawn_variables[3];
    wait_time_max = spawn_variables[4];
    spe = spawn_variables[5];
    current_marker = 0;
    wait_time = wait_time_max;*/
    //print_debug(string(spawn_variables));
    _init = 1;
} else {
    //visible = false;
    //print_debug(string(marker[current_marker]));
    /*if wait_time > 0 {
        wait_time--;
        hsp = 0;
        vsp = 0;
    }
    if wait_time == 0 && marker[current_marker] != 0 move_to(current_marker,spe);*/
    
    //frame_update();
    
    image_index = (image_index + anim_speed) % image_number;
    
}
