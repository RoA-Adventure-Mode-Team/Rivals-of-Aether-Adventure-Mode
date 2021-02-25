//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))

/*if array_length_1d(custom_args) > 1 && custom_args[1] != 0 {
    draw_sprite(custom_args[1],0,x,y);
}
*/

if debug_info { //Debug info; check user_event2 draw_debug_info
    debug_pos = grid_to_cell([x+64,y+64]);
    draw_debug_text(floor(x),floor(y),"["+string(debug_pos[1][0])+","+string(debug_pos[1][0])+"]:["+string(floor((debug_pos[0][0])/16))+","+string(floor((debug_pos[0][1])/16))+"]:["+string((debug_pos[0][0]) % 16)+","+string((debug_pos[0][1]) % 16)+"]");
    draw_rectangle_color(x-sprite_get_xoffset(sprite_index)*2,y-sprite_get_yoffset(sprite_index)*2,
                        x-sprite_get_xoffset(sprite_index)*2+sprite_get_width(sprite_index)*2,y-sprite_get_yoffset(sprite_index)*2+sprite_get_height(sprite_index)*2,
                        c_fuchsia,c_fuchsia,c_fuchsia,c_fuchsia,true);
}

#define grid_to_cell(_pos) //Translate basegame grid system coordinates to in cell coordinates
_pos = [floor(_pos[0]),floor(_pos[1])];
with room_manager {
	_pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];

    return [[(abs(_pos[0]) % ((cell_dim[0]-grid_offset)*cell_size)),
		    (abs(_pos[1]) % ((cell_dim[1]-grid_offset)*cell_size))],
		   [floor(_pos[0]/((cell_dim[0]-grid_offset)*cell_size)),
			floor(_pos[1]/((cell_dim[1]-grid_offset)*cell_size))]];
}