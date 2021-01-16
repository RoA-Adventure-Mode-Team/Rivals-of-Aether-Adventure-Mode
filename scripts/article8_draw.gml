//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))

if debug {
    depth = -100;
    if (active_scene == 0 || cur_scene == active_scene) draw_set_alpha(1);
    else draw_set_alpha(.2);
    switch trigger_shape {
        case 0:
            draw_rectangle_color(x,y,x+trigger_w,y+trigger_h,debug_color,debug_color,debug_color,debug_color,c_black);
            break;
        case 1:
            draw_circle_color(x,y,trigger_w,debug_color,debug_color,c_black);
            break;
        case 2:
            draw_set_color(debug_color);
            draw_sprite(sprite_index,image_index,x,y);
            visible = debug;
            draw_set_color(c_white);
            break;
    
    } 
}
draw_set_alpha(1);

if hold_up with collis_obj {
    //draw_debug_text(x,y,"TESTING PROMPT");
    draw_sprite(asset_get("lead_arrow_spr"),0,x,y+10);
}

/*if array_length_1d(custom_args) > 1 && custom_args[1] != 0 {
    draw_sprite(custom_args[1],0,x,y);
}*/