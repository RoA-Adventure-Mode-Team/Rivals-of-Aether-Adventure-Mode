//article2_update, Custom Marker


if !_init {
    tmap_id = spawn_variables[0];
    tmap_sprite = sprite_get("tilemap_"+string(tmap_id));
    tmap_size = sprite_get_width(tmap_sprite);
    col_x = spawn_variables[2]*2;
    col_y = spawn_variables[3]*2;
    
    //sprite_index = sprite_get("1px");
    mask_index = sprite_get("1px");
    image_xscale = col_x*tmap_size/2;
    image_yscale = col_y*tmap_size/2;
    tile_data = array_create(col_x);
    
    for (var i = 0; i < col_x; i++) {
        tile_data[@i] = [0];
        for (var j = 0; j < col_y; j++ ) {
            //var _temp = check_neighbors(x+i*tmap_size+4,y+j*tmap_size+4);
            //tile_data[@i][@j] = [(_temp % 4)*tmap_size, floor(_temp/4)*tmap_size];
            tile_data[@i][@j] = check_neighbors(x+i*tmap_size+4,y+j*tmap_size+4);
        }
    }
    // print_debug(string(tile_data));
    _init = 1;
} else {
    
}



#define check_neighbors(_x,_y)
var col_6 = (collision_point(_x+tmap_size,_y,id,false, false) != noone);
var col_4 = (collision_point(_x-tmap_size,_y,id,false, false) != noone);
var col_8 = (collision_point(_x,_y-tmap_size,id,false, false) != noone);
var col_2 = (collision_point(_x,_y+tmap_size,id,false, false) != noone);

return (col_8+col_4*2+col_6*4+col_2*8);
