//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))

draw_set_alpha(.3);
if debug {
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
}
draw_set_alpha(1);