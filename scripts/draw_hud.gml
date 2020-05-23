//draw_hud - the x position of your HUD element is 48*(i-1)

//draw_sprite_ext(sprite_get("clutch"),is_clutch,temp_x+110,temp_y-20,1,1,0,c_white,1);


//draw_set_font(asset_get("medFont"));
//draw_text_trans_outline(temp_x,temp_y,"TEST FONT",10,1000,1,1,0,c_white,c_black,1);
//draw_debug_text(temp_x-200,temp_y-470,string(cur_scene));
//draw_debug_text(temp_x-200,temp_y-430,string(cur_scene_time));
//draw_debug_text(temp_x-200,temp_y-400,string(cur_scene_time_end));
//draw_debug_text(temp_x,temp_y-420,string(move_timer));
//draw_debug_text(temp_x,temp_y-400,string(list_window[| 0].path));
//draw_debug_text(temp_x,temp_y-380,string(array_scene_data));


draw_debug_text(2,2,string(fps));
draw_debug_text(16,16,string(get_window_value(AT_JAB,1,AG_WINDOW_LENGTH)));

draw_debug_text(32,2,string(object_index));
var xx = view_get_wview()/2;
var yy = 30;
/*draw_set_font(asset_get("roaLBLFont"));
draw_set_halign(fa_left);*/


with obj_stage_article {
    switch num {
        case 3:
            other.list_window = list_window;
            //draw_sprite_ext(sprite_get("test3232"),0,xx,yy,1,1,0,c_white,1);
            break;
    }
}

draw_windows();

#define draw_windows()
var i = 0;
repeat ds_list_size(list_window) {
    if list_window[| i].visibl {
        
        switch list_window[| i].content_type {
            case 0: //Textbox
                draw_sprite_ext(list_window[| i].bg_sprite_index, list_window[| i].bg_image_index,list_window[| i]._x,list_window[| i]._y,1,1,0,c_white,1);
                if list_window[| i].font != "" draw_set_font(asset_get(list_window[| i].font));
                draw_text_trans_outline(list_window[| i]._x+list_window[| i]._in_x,list_window[| i]._y+list_window[| i]._in_y,string_copy(list_window[| i].text_full,1,floor(list_window[| i].vis_chars)),30,list_window[| i].text_spacing,1,1,0,c_white,c_black,1);
                break;
            case 1: //Animated Sprite 
                draw_sprite_ext(list_window[| i].bg_sprite_index, list_window[| i].bg_image_index,list_window[| i]._x,list_window[| i]._y,1,1,0,c_white,1);
                draw_sprite_ext(list_window[| i]._sprite_index, list_window[| i]._image_index,list_window[| i]._x+list_window[| i]._in_x,list_window[| i]._y+list_window[| i]._in_y,1,1,0,c_white,1);
                break;
            /*case 2: //Arrow Sprite
                draw_sprite_ext(list_window[| i]._sprite_index, list_window[| i]._image_index,list_window[| i]._x+list_window[| i]._in_x,list_window[| i]._y+list_window[| i]._in_y,1,1,0,c_white,1);
                break;*/
        }
    }
    i++;
}

#define draw_text_trans_outline(_x, _y, str, separ, w, xscale, yscale, angl, text_colour, outline_colour, alph)
for (i = - 1; i < 2; i++) for (j = -1; j < 2; j++) draw_text_ext_transformed_color(_x+i*2,_y+j*2,str,separ, w, xscale, yscale, angl, outline_colour, outline_colour, outline_colour, outline_colour, 1);
draw_text_ext_transformed_color(_x,_y,str,separ, w, xscale, yscale, angl, text_colour, text_colour, text_colour, text_colour, 1);
