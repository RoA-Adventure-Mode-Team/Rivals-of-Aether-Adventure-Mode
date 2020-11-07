//article12_draw, lights

if(draw)
{
    gpu_set_blendenable(false);
    gpu_set_colorwriteenable(false,false,false,true);
    draw_set_alpha(0);
    draw_rectangle_color(0,0, room_width,room_height, c_white, c_white, c_white, c_white, false);
    
    draw_set_alpha(1);
    gpu_set_blendenable(true);
    gpu_set_blendmode(bm_add);
    with(obj_stage_article)
    {
        if(num == 12)
        {
            draw_sprite_ext(render_sprite, render_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
            draw = false;
        }
    }
    
    gpu_set_blendenable(true);
    gpu_set_alphatestenable(true);
    gpu_set_colorwriteenable(true,true,true,true);
    gpu_set_blendmode_ext(bm_dest_color,bm_dest_alpha);
    // gml's colors are in bgr format, I am irate
    var camera_pos;
    with(player_id)
    {
        with(room_manager)
            camera_pos = true_pos;
    }
    draw_rectangle_color(camera_pos[0] - view_get_wview() / 2, camera_pos[1] - view_get_hview() / 2, camera_pos[0] + view_get_wview() / 2, camera_pos[1] + view_get_hview() / 2, $702010, $702010, $000000, $000000, false);
    
    gpu_set_blendmode_ext(bm_dest_colour,bm_one);
    with(obj_stage_article)
    {
        if(num == 12)
        {
            draw_sprite_ext(render_sprite, render_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
        }
    }
    gpu_set_blendmode(bm_normal);
    gpu_set_alphatestenable(false);
    draw = true;
}