//article1_update, Simple Platform

if _init == 0 {
    if spawn_variables[0] < 1000 sprite_index = sprite_get("article1_"+string(spawn_variables[0]));
    else sprite_index = spawn_variables[0];
    spr_name = sprite_get_name(sprite_index);
    spr_ = sprite_index;
    anim_speed = spawn_variables[1]*.01;
    //NEED TO SET COLLISION IN LOAD!!!
    // if spawn_variables[3] != 0 {
    //     mask_index = sprite_index;
    //     print("SET TO SPRITE COLLISION");
    //     // sprite_change_collision_mask(sprite_get_name(sprite_index),true, 0, 0, 0, 0, 0, 0);
    //     sprite_change_collision_mask("[-3,0]ground",false, 1, 0, 0, 0, 0, 0);
    //     // sprite_change_collision_mask(sprite_get_name(sprite_index),true, 2, 0, 0, sprite_get_width(spr_), sprite_get_height(spr_), 0 );
    // }
    // if spawn_variables[3] != 0 sprite_change_collision_mask(sprite_get_name(sprite_index),true, 0, 0, 0, 0, 0, 0);
    // sprite_change_collision_mask(sprite_get_name(sprite_index),true, 0, 0, 0, 0, 0, 0);
   
    anim_speed = spawn_variables[1]*.01;
    group = spawn_variables[2];
    static  = spawn_variables[4];
    alpha_ = spawn_variables[5];
    if spawn_variables[6] != 0 image_blend = spawn_variables[6];
    else image_blend = c_white; 
    with obj_stage_article if num == 5 other.room_manager = id;
    if alpha_ != 0 image_alpha = alpha_;
    //if static image_alpha = 0;
    visible = true;
    _init = 1;
} else {
    image_index += anim_speed;
}