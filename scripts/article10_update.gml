//article9_update, Items

if !_init {
    item_id = spawn_variables[0];
    grav_radius = spawn_variables[1];
    grav_accel = spawn_variables[2];
    sprite_index = item_sprite_get(item_id,"idle");
}
state_timer++;

if state == 0 { //Normal Operations
    collis_obj = collision_circle(x,y,grav_radius,oPlayer,true,true);
    if collis_obj != noone  && collis_obj.item_id == -1 {
        vsp += grav_accel*-dsin(point_direction(x,y,collis_obj.x,collis_obj.y-collis_obj.char_height/2));//(point_distance(x,y,collis_obj.x,collis_obj.y+collis_obj.char_height/2));
        hsp += grav_accel*dcos(point_direction(x,y,collis_obj.x,collis_obj.y-collis_obj.char_height/2));//(point_distance(x,y,collis_obj.x,collis_obj.y+collis_obj.char_height/2));
        if place_meeting(x,y,collis_obj) {
            collis_obj.item_id = id;
            if auto_use {
                instance_destroy();
                exit;
            }
            follow_player = collis_obj.id;
            state = 1; 
            vsp = 0;
            hsp = 0;
        }
    }
    vsp *= .98;
    hsp *= .98;
}

if state == 1 { //Following a Player
    keep = true;
    follow_pos[0] = follow_player.x - follow_player.spr_dir*follow_offset_x;
    follow_pos[1] = follow_player.y - follow_player.char_height*3/4;
    vsp = floor(-(y-follow_pos[1])/2);
    hsp = floor(-(x-follow_pos[0])/2);
    spr_dir = follow_player.spr_dir;
}

#define item_sprite_get(_num,_sprite) //Get the sprite of this article
return sprite_get("item_"+string(_num)+"_"+string(_sprite));