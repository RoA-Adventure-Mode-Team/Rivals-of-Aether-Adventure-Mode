//article10_update, Items

if !_init {
    item_id = spawn_variables[0];
    sprite_index = spawn_variables[1];
    grav_radius = spawn_variables[2];
    grav_accel = spawn_variables[3];
    auto_use = spawn_variables[4];
    item_name = spawn_variables[5];
    name_width = string_width(item_name);
    //prite_index = item_sprite_get(item_id,"idle");
}
state_timer++;

if state == 0 { //Normal Operations
    collis_obj = collision_circle(x,y,grav_radius,oPlayer,true,true);
    if collis_obj != noone  && collis_obj.item_id == noone {
        vsp += grav_accel*-dsin(point_direction(x,y,collis_obj.x,collis_obj.y-collis_obj.char_height/2));//(point_distance(x,y,collis_obj.x,collis_obj.y+collis_obj.char_height/2));
        hsp += grav_accel*dcos(point_direction(x,y,collis_obj.x,collis_obj.y-collis_obj.char_height/2));//(point_distance(x,y,collis_obj.x,collis_obj.y+collis_obj.char_height/2));
        if place_meeting(x,y,collis_obj) {
            if collis_obj.item_id != noone {
                with collis_obj.item_id {
                    set_state(2);
                    vsp = -2;
                    keep = false;
                }
            }
            collis_obj.item_id = id;
            sound_play(asset_get("mfx_coin"));
            if auto_use {
                instance_destroy();
                exit;
            }
            follow_player = collis_obj.id;
            set_state(1);
            vsp = 0;
            hsp = 0;
        }
    }
    vsp *= .95;
    hsp *= .95;
}

if state == 1 { //Following a Player
    keep = true;
    follow_pos[0] = follow_player.x - follow_player.spr_dir*follow_offset_x;
    follow_pos[1] = follow_player.y - follow_player.char_height*3/4;
    vsp = floor(-(y-follow_pos[1])/2);
    hsp = floor(-(x-follow_pos[0])/2);
    spr_dir = follow_player.spr_dir;
    /*if !follow_player.free && follow_player.down_down down_held++;
    if down_held > 20 {
        set_state(2);
        vsp = -2;
        follow_player.item_id = noone;
        down_held = 0;
    }*/
}

if state == 2 { //Rejection & Cooldown
    if state_timer >= cooldown_timer {
        set_state(0);
    }
    vsp *= .98;
    hsp *= .98;
}
item_id = id;
user_event(10);//Item Custom Behavior
#define item_sprite_get(_num,_sprite) //Get the sprite of this article
return sprite_get("item_"+string(_num)+"_"+string(_sprite));

#define set_state(_state)
state_timer = 0;
state = _state;