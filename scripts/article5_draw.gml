//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))


//draw_sprite(sprite_get("test3232"),0,0,0);

/*if array_length_1d(custom_args) > 1 && custom_args[1] != 0 {
    draw_sprite(custom_args[1],0,x,y);
}*/
set_view_position_smooth(follow_point.x,follow_point.y);
/*with oPlayer {
	with other.room_manager {
		if instance_exists(other.temp_pause) {
			paused = true;
			set_view_position_smooth(follow_point.x,follow_point.y);
		} else paused = false;
	}
}*/


#define set_view_position_smooth(_x,_y)
//var sm_x = (((_x + true_pos[0])/2 + true_pos[0])/2 + true_pos[0])/2;
//var sm_y = (((_y + true_pos[1])/2 + true_pos[1])/2 + true_pos[1])/2;
var sm_x = ease_linear(floor(true_pos[0]),floor(_x),1,5);
var sm_y = ease_linear(floor(true_pos[1]),floor(_y),1,5);
//var dir_x = _x - true_pos[0];
//var dir_y = _y - true_pos[1];

set_view_position(round(sm_x), round(sm_y));
//static_position = [round(sm_x),round(sm_y)];
with obj_stage_article {
	if num == 1 && static {
		x = round(sm_x);
		y = round(sm_y);
	}
}

