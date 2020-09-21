//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))
/*with obj_stage_article if num == 3 && (other.active_scene == 0 || cur_scene == other.active_scene) {
    draw_set_alpha(1);
} draw_set_alpha(.2);*/
if debug {
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
            visible = debug;
            break;
    
    } 
    draw_set_alpha(1);
}