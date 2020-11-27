//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))
//draw_windows();
/*if array_length_1d(custom_args) > 1 && custom_args[1] != 0 {
    draw_sprite(custom_args[1],0,x,y);
}*/
//Background Controller


/*for (var i = 0; i < ds_list_size(bg_data);i++) { //bg_data = {}
    draw_sprite(bg_data[| i].sprite,cur_scene_time*bg_speed,400,400);
}*/
//
/*#define draw_windows()
var i = 0;
repeat ds_list_size(list_window) {
    if list_window[| i].visibl {
        switch list_window[| i].content_type {
            case 4: //Textbox
                draw_sprite_ext(list_window[| i].bg_sprite_index, list_window[| i].bg_image_index,list_window[| i]._x,list_window[| i]._y,1,1,0,c_white,1);
                if list_window[| i].font != "" draw_set_font(asset_get(list_window[| i].font));
                draw_text_trans_outline(list_window[| i]._x+list_window[| i]._in_x,list_window[| i]._y+list_window[| i]._in_y,string_copy(list_window[| i].text_full,1,floor(list_window[| i].vis_chars)),30,list_window[| i].text_spacing,1,1,0,c_white,c_black,1);
                break;
            case 5: //Animated Sprite 
                draw_sprite_ext(list_window[| i].bg_sprite_index, list_window[| i].bg_image_index,list_window[| i]._x,list_window[| i]._y,1,1,0,c_white,1);
                draw_sprite_ext(list_window[| i]._sprite_index, list_window[| i]._image_index,list_window[| i]._x+list_window[| i]._in_x,list_window[| i]._y+list_window[| i]._in_y,1,1,0,c_white,1);
                break;
            /*case 2: //Arrow Sprite
                draw_sprite_ext(list_window[| i]._sprite_index, list_window[| i]._image_index,list_window[| i]._x+list_window[| i]._in_x,list_window[| i]._y+list_window[| i]._in_y,1,1,0,c_white,1);
                break;
        }
    }
    i++;
}*/

#define draw_text_trans_outline(_x, _y, str, separ, w, xscale, yscale, angl, text_colour, outline_colour, alph)
for (var l = -1; l < 2; l++) for (var j = -1; j < 2; j++) draw_text_ext_transformed_color(_x+l*2,_y+j*2,str,separ, w, xscale, yscale, angl, outline_colour, outline_colour, outline_colour, outline_colour, 1);
draw_text_ext_transformed_color(_x,_y,str,separ, w, xscale, yscale, angl, text_colour, text_colour, text_colour, text_colour, 1);
