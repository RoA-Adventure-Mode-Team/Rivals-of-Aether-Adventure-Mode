//article13_draw, Shadows, By CaptnTechnicality
switch(type)
{
    case 0:
        gpu_set_colorwriteenable(false, false, false, true);
        draw_set_alpha(0);
        gpu_set_blendenable(false);
        
        draw_rectangle_color(0, 0, room_width, room_height, c_white, c_white, c_white, c_white, false);
        
        gpu_set_colorwriteenable(true, true, true, true);
        draw_set_alpha(1);
        gpu_set_blendenable(true);
        //print_debug("0");
    break;
    
    case 1:
        // gpu_set_blendenable(true);
        // gpu_set_alphatestenable(false);
        // gpu_set_colorwriteenable(false, false, false, true);
        // gpu_set_blendmode_ext(bm_dest_alpha, bm_src_alpha);
        // draw_sprite_tiled(sprite_get("fg_dither"), 0, 0, 0);
    
        var fog = gpu_get_fog();
        gpu_set_fog(true, color, 0, 0);
        gpu_set_colorwriteenable(true,true,true,true);
        gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
        gpu_set_alphatestenable(true);
        gpu_set_blendenable(true);
        
        with(oPlayer)
        {
            draw_sprite_ext(sprite_index, image_index, x, y, spr_dir*visible*(1+small_sprites), visible*(1+small_sprites), image_angle, c_white, 1);
        }
        with(obj_stage_article)
        {
            if(num == 6)
                draw_sprite_ext(sprite_index, image_index, x, y, spr_dir, 1, image_angle, c_white, 1);
        }
        
        gpu_set_fog(fog[0], fog[1], fog[2], fog[3]);
        gpu_set_blendmode(bm_normal);
        gpu_set_alphatestenable(false);
        //print_debug("1");
    break;
}