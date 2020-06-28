//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))



//draw_debug_text(x,y,string(tile_data));
/*
var cam_left = view_get_xview();
var cam_right = view_get_wview()+view_get_xview();
var cam_up = view_get_yview();
var cam_down = view_get_hview()+view_get_yview();
if _init for (var i = 0; i < col_x; i++) for (var j = 0; j < col_y; j++ ) {
    var _x = x+i*tmap_size;
    var _y = y+j*tmap_size;
    if _x > cam_left && _x < cam_right && _y > cam_up && _y < cam_down draw_sprite(tmap_sprite,tile_data[i][j],_x,_y);
}
*/


// width = sprite_get_width(spr);
//var height = sprite_get_height(spr);
var cam_left = view_get_xview();
var cam_right = view_get_wview()+view_get_xview();
var cam_up = view_get_yview();
var cam_down = view_get_hview()+view_get_yview();

var i_start = max(floor((cam_left-x)/tmap_size), 0);
var i_end = min(ceil((cam_right-x)/tmap_size), col_x);
var j_start = max(floor((cam_up-y)/tmap_size),0);
var j_end = min(ceil((cam_down-y)/tmap_size),col_y);
for(var i = i_start; i < i_end; i++) {
    for(var j = j_start; j < j_end; j++) {
        var _x = x+i * tmap_size;
        var _y = y+j * tmap_size;
        draw_sprite(tmap_sprite, i+j, _x, _y);
    }
}