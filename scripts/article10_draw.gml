//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))
if debug_info {
    draw_set_alpha(.3);
    draw_circle_color(x,y,grav_radius,debug_color,debug_color,c_black);
    draw_set_alpha(1);
    draw_debug_text(x,y,string(item_id));
}


if state_timer < 60 && state == 1 {
    if (follow_player.spr_dir == 1) draw_debug_text(x-name_width,y,item_name);
    else draw_debug_text(x,y,item_name);
}