//article12_draw, lights

if(draw)
{
    gpu_set_blendenable(false)
    gpu_set_colorwriteenable(false,false,false,true);
    draw_set_alpha(0);
    draw_rectangle_color(0,0, room_width,room_height, c_white, c_white, c_white, c_white, false);
    draw_set_alpha(1);
    
    with(obj_stage_article)
    {
        if(num == 12)
        {
            draw_sprite_ext(render_sprite, sprite_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
            draw = false;
        }
    }
    
    gpu_set_blendenable(true);
    gpu_set_colorwriteenable(true,true,true,true);
    
    gpu_set_blendmode_ext(bm_dest_color,bm_dest_alpha);
    gpu_set_alphatestenable(true);
    // gml's colors are in bgr format, I am irate
    draw_rectangle_color(0,0, room_width,room_height, $502010, $502010, $502010, $502010, false);
    gpu_set_blendmode_ext(bm_inv_dest_alpha,bm_src_colour);
    with(obj_stage_article)
    {
        if(num == 12)
        {
            draw_sprite_ext(render_sprite, sprite_index, x, y, image_xscale, image_yscale, image_angle, c_white, 1);
        }
    }
    gpu_set_alphatestenable(false);
    gpu_set_blendmode(bm_normal);
    draw = true;
}