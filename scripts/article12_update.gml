//article12_update, Dynamic Lighting, By CaptnTechnicality

if _init == 0 {
    with obj_stage_article if num == 5 other.room_manager = id;
    render_sprite = spawn_variables[0];
    anim_speed = spawn_variables[1]*.01;
    follow_object = spawn_variables[2];
    if follow_object == 1 //Player
        with obj_stage_main other.follow_object = follow_player;
    _init = 1;
    //print_debug("[DL] ARTICLE-ACTION INDEX: "+string(action_article_index));
} else {
    render_index = (render_index + anim_speed) % sprite_get_number(render_sprite);
    if follow_object != 0 {
        x = follow_object.x;
        y = follow_object.y;
    }
    if bg_color_true != bg_color {
        bg_color_true = merge_color(bg_color_true,bg_color,color_rate);
    }
}
draw = true;
