//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))

/*if array_length_1d(custom_args) > 1 && custom_args[1] != 0 {
    draw_sprite(custom_args[1],0,x,y);
}
*/

if !debug_info exit; //Debug info; check user_event2 draw_debug_info
debug_pos = grid_to_cell([x+64,y+64]);
draw_debug_text(floor(x),floor(y),string(id)+"
["+string(debug_pos[1][0])+","+string(debug_pos[1][1])+"]:["+string(floor((debug_pos[0][0])/16))+","+string(floor((debug_pos[0][1])/16))+"]:["+string((debug_pos[0][0]) % 16)+","+string((debug_pos[0][1]) % 16)+"]");
draw_rectangle_color(x-sprite_get_xoffset(sprite_index)*2,y-sprite_get_yoffset(sprite_index)*2,
                    x-sprite_get_xoffset(sprite_index)*2+sprite_get_width(sprite_index)*2,y-sprite_get_yoffset(sprite_index)*2+sprite_get_height(sprite_index)*2,
                    c_fuchsia,c_fuchsia,c_fuchsia,c_fuchsia,true);


#define grid_to_cell(_pos) //Translate basegame grid system coordinates to in cell coordinates
with room_manager {
	_pos = [_pos[0] - render_offset[0],_pos[1] - render_offset[1]];
	var _sub_pos_x = [(_pos[0] % ((cell_dim[0]-grid_offset)*cell_size)),floor(_pos[0]/((cell_dim[0]-grid_offset)*cell_size))];
	var _sub_pos_y = [(_pos[1] % ((cell_dim[1]-grid_offset)*cell_size)),floor(_pos[1]/((cell_dim[1]-grid_offset)*cell_size))];
	if sign(_sub_pos_x[0]) == -1 _sub_pos_x[0] += ((cell_dim[0]-grid_offset)*cell_size); 
	if sign(_sub_pos_y[0]) == -1 _sub_pos_y[0] += ((cell_dim[1]-grid_offset)*cell_size);
    return [[_sub_pos_x[0], //Subcell
		    _sub_pos_y[0]],
		   [_sub_pos_x[1], //Cell
			_sub_pos_y[1]]];
}