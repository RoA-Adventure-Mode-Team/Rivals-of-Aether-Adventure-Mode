//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))

draw_set_alpha(.3);
if debug {
    draw_circle_color(x,y,grav_radius,debug_color,debug_color,c_black);
}
draw_set_alpha(1);