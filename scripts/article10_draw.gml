// draw
gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
draw_rectangle_color(0,0, room_width,room_height, c_white, c_white, c_white, c_white, false);

draw_set_alpha(1);
draw_sprite_tiled(sprite_get("dither"), transparency_timer / 10, x,y);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);


gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
draw_sprite(deco_image,0, x,y);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);


/* DBZ VANISH
// pattern 1
draw_set_alpha(1);
draw_sprite_tiled(sprite_get("dbz_dither"), min(transparency_timer / 4, 7), x,y);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
draw_sprite(deco_image,0, x,y - floor(transparency_timer / 4) * 2);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);

// pattern 2
gpu_set_blendenable(false)
gpu_set_colorwriteenable(false,false,false,true);
draw_set_alpha(0);
draw_rectangle_color(0,0, room_width,room_height, c_white, c_white, c_white, c_white, false);

draw_set_alpha(1);
draw_sprite_tiled(sprite_get("dbz_dither"), max(0, transparency_timer / 4 - 1), x + 4,y);
gpu_set_blendenable(true);
gpu_set_colorwriteenable(true,true,true,true);

gpu_set_blendmode_ext(bm_dest_alpha,bm_inv_dest_alpha);
gpu_set_alphatestenable(true);
draw_sprite(deco_image,0, x,y + floor(transparency_timer / 4) * 2);
gpu_set_alphatestenable(false);
gpu_set_blendmode(bm_normal);
*/