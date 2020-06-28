//article7_draw, Camera Controller
//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))
/*with obj_stage_article if num == 3 && (other.active_scene == 0 || cur_scene == other.active_scene) {
    draw_set_alpha(1);
} draw_set_alpha(.2);*/
draw_set_alpha(.3);
if debug {
    switch trigger_shape {
        case 0:
            draw_rectangle_color(x,y,x+trigger_w,y+trigger_h,c_blue,c_blue,c_blue,c_blue,c_black);
            break;
        case 1:
            draw_circle_color(x,y,trigger_w,c_blue,c_blue,c_black);
            break;
        case 2:
            visible = debug;
            break;
    
    } 
}
draw_set_alpha(1);
//draw_set_alpha(0);

//draw_debug_text(x+cam_lock_x,y+cam_lock_y, string(cam_override_pos));