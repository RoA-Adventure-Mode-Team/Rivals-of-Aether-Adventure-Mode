//article12_draw, Dynamic Lighting, By CaptnTechnicality
if(!cant_root && draw)
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false,false,false,true);
    draw_set_alpha(0);
    draw_rectangle_color(0,0, room_width,room_height, c_white, c_white, c_white, c_white, false);
    
    draw_set_alpha(0.25);
    gpu_set_blendenable(true);
    gpu_set_blendmode(bm_add);
    with (obj_stage_article) {
        if (num == 12) {
            draw_sprite_ext(render_sprite, render_index, x, y, image_xscale*spr_dir, image_yscale, image_angle, c_white, 1);
            //if val_limit < color_get_saturation(other.bg_color_true) draw_sprite_ext(render_sprite, render_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
            draw = false;
        }
    }
    var i = 0, drawing_light;
    repeat ds_list_size(player_id.dynamic_lights) {
    	drawing_light = player_id.dynamic_lights[| i];
    	if(colour_get_value(bg_color_true) < drawing_light.darkness_threshold)
			draw_sprite_ext(drawing_light.sprite, drawing_light.image, drawing_light.x, drawing_light.y, drawing_light.xscale, drawing_light.yscale, drawing_light.angle, drawing_light.blend, drawing_light.alpha);
        i++;
	}
    gpu_set_blendenable(true);
    gpu_set_alphatestenable(true);
    gpu_set_colorwriteenable(true,true,true,true);
    gpu_set_blendmode_ext(bm_dest_color,bm_dest_alpha);
    // gml's colors are in bgr format, I am irate
    draw_rectangle_color(view_get_xview() - 100, view_get_yview() - 100, //Hard-coded: need to make static
                         view_get_xview() + view_get_wview() + 100, view_get_yview() + view_get_hview() + 100, 
                         bg_color_true, bg_color_true, bg_color_true, bg_color_true, false);
    gpu_set_blendmode_ext(bm_dest_colour,bm_one);
    with (obj_stage_article) {
        if (num == 12) {
            draw_sprite_ext(render_sprite, render_index, x, y, image_xscale*spr_dir, image_yscale, image_angle, c_white, 1);
            //if val_limit < color_get_value(other.bg_color_true) draw_sprite_ext(render_sprite, render_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
        }
    }
    i = 0;
    repeat ds_list_size(player_id.dynamic_lights) {
    	drawing_light = player_id.dynamic_lights[| i];
    	if(colour_get_value(bg_color_true) < drawing_light.darkness_threshold)
    		draw_sprite_ext(drawing_light.sprite, drawing_light.image, drawing_light.x, drawing_light.y, drawing_light.xscale, drawing_light.yscale, drawing_light.angle, drawing_light.blend, drawing_light.alpha);
        i++;
	}
    gpu_set_blendmode(bm_normal);
    gpu_set_alphatestenable(false);
    draw_set_alpha(1);
    draw = true;
}