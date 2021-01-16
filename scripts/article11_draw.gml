if(!dither_type)
{
    draw_sprite(deco_image,0, x,y);
    exit;
}
if(dither_type < 3)
{
    // draw
    if(transparency_timer)
    {
        gpu_set_blendenable(false);
        gpu_set_colorwriteenable(false,false,false,true);
        draw_set_alpha(0);
        draw_rectangle_color(0,0, room_width,room_height, c_white, c_white, c_white, c_white, false);
        
        draw_set_alpha(1);
        var playback_rate = dither_time / (sprite_get_number(dither_sprite) - 2 + full_transparency);
        draw_sprite_tiled(dither_sprite, transparency_timer / playback_rate, x,y);
        gpu_set_blendenable(true);
        gpu_set_colorwriteenable(true,true,true,true);
    
        gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
        gpu_set_alphatestenable(true);
    
        draw_sprite_ext(deco_image,0, x,y,2,2,0,c_white,1);
    
        gpu_set_alphatestenable(false);
        gpu_set_blendmode(bm_normal);
    }
    else
    {
        draw_sprite_ext(deco_image,0, x,y,2,2,0,c_white,1);
    }
}
else
{
    // pattern 1
    if(transparency_timer)
    {
        var playback_rate = dither_time / (sprite_get_number(dither_sprite) - 1 + full_transparency);
        
        gpu_set_blendenable(false);
        gpu_set_colorwriteenable(false,false,false,true);
        draw_set_alpha(0);
        draw_rectangle_color(0,0, room_width,room_height, c_white, c_white, c_white, c_white, false);
        
        draw_set_alpha(1);
        draw_sprite_tiled(dither_sprite, min(transparency_timer / playback_rate, sprite_get_number(dither_sprite) - 1), x,y);
        gpu_set_blendenable(true);
        gpu_set_colorwriteenable(true,true,true,true);
        
        gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
        gpu_set_alphatestenable(true);
        draw_sprite_ext(deco_image,0, x,y - floor(transparency_timer / playback_rate) * 2,2,2,0,c_white,1);
        gpu_set_alphatestenable(false);
        gpu_set_blendmode(bm_normal);
        
        // pattern 2
        gpu_set_blendenable(false);
        gpu_set_colorwriteenable(false,false,false,true);
        draw_set_alpha(0);
        draw_rectangle_color(0,0, room_width,room_height, c_white, c_white, c_white, c_white, false);
        
        draw_set_alpha(1);
        draw_sprite_tiled_ext(dither_sprite, max(0, (transparency_timer / playback_rate) - 1), x + 4,y,2,2,c_white,1);
        gpu_set_blendenable(true);
        gpu_set_colorwriteenable(true,true,true,true);
        
        gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
        gpu_set_alphatestenable(true);
        draw_sprite_ext(deco_image,0, x,y + floor(transparency_timer / playback_rate) * 2,2,2,0,c_white,1);
        gpu_set_alphatestenable(false);
        gpu_set_blendmode(bm_normal);
    }
    else
    {
        draw_sprite(deco_image,0, x,y);
    }
}