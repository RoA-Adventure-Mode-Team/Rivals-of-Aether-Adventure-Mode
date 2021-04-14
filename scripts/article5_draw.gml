//Dedicated to drawing the camera, STAGE MAIN SPACE

with obj_stage_main {
	cam_pos_left = [view_get_xview(),view_get_yview()];
	cam_pos_right = [view_get_xview()+view_get_wview(),view_get_yview()+view_get_hview()];
	true_pos = [cam_pos_left[0]+view_get_wview()/2,cam_pos_left[1]+view_get_hview()/2];
	switch cam_state {
		case -1: //nothing
			break;
		case 1: //Controlled by action manager
			with action_manager {
				other.g_cam_pos = cam_pos;
				other.cam_smooth = cam_smooth;
			}
			//print_debug(string(g_cam_pos));
			break;
		case 2: //Controlled by Camera article7
			with room_manager other.g_cam_pos = [follow_point.x,follow_point.y]; //follow_point defined in article5_update
			with cam_override_obj {
				other.cam_smooth = cam_smooth;
				switch lock_type {
	                case 0: //Lock xy
	                	other.g_cam_pos = cam_pos;
	                    break;
	                case 1: //Lock y
	                	other.g_cam_pos[1] = cam_pos[1];
	                    break;
	                case 2: //Lock x
	                	other.g_cam_pos[0] = cam_pos[0];
	                    break;
	            }
			}
			break;
		case 0:
		default: //not defined, controlled by global/room_manager - "world cam"
			with room_manager {
				other.g_cam_pos = [follow_point.x,follow_point.y]; //follow_point defined in article5_update
				other.cam_smooth = floor((other.cam_smooth+cam_smooth)/2);
			}
			
			break;
	}
	set_view_position_smooth(g_cam_pos[0],g_cam_pos[1],cam_smooth);
	// if debug draw_circle_color(g_cam_pos[0],g_cam_pos[1],5,c_blue,c_blue,false);
	//set_view_position(g_cam_pos[0],g_cam_pos[1]);

}
if debug with oPlayer {
	draw_debug_text(floor(x),floor(y),string([floor(x/16),floor(y/16)]));
	draw_debug_text(floor(x),floor(y)+16,string(get_state_name(state)));
	draw_debug_text(floor(x),floor(y)+32,string(window_timer));
}
#define set_view_position_smooth(_x,_y,_smooth)
sm_x = ease_linear(floor(true_pos[0]),floor(_x),1,_smooth);
sm_y = ease_linear(floor(true_pos[1]),floor(_y),1,_smooth);
set_view_position(round(sm_x), round(sm_y));
true_pos[0] += sm_x;
true_pos[1] += sm_y;
//set_view_position(sm_x, sm_y);
//background movements
with obj_stage_article {
	if num == 1 && static {
		//x = round(sm_x);
		//y = round(sm_y);
		x = other.sm_x;
		y = other.sm_y;
	}
}

