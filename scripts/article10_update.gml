//article10_update, Items

if !_init {
    item_id = spawn_variables[0];
    sprite_index = spawn_variables[1];
    grav_radius = spawn_variables[2];
    grav_accel = spawn_variables[3];
    // use_type = spawn_variables[4];
    use_type = spawn_variables[4];
    item_name = spawn_variables[5];
    name_width = string_width(string(item_name));
    //prite_index = item_sprite_get(item_id,"idle");
    
    visible = true;
    // keep = true;
    _init = 1;
    pickup_cooldown = 0;
}

enum EVT {
    GRAB,
    IDLE,
    USE,
    ALTUSE,
    DESTROY,
    DROP
}

state_timer++;

if state == EVT.GRAB { //Normal Operations
    if state_timer > pickup_cooldown collis_obj = collision_circle(x,y,grav_radius,oPlayer,true,true);
    else collis_obj = noone;
    if collis_obj != noone  && !instance_exists(collis_obj.item_id) {
        vsp += grav_accel*-dsin(point_direction(x,y,collis_obj.x,collis_obj.y-collis_obj.char_height/2));//(point_distance(x,y,collis_obj.x,collis_obj.y+collis_obj.char_height/2));
        hsp += grav_accel*dcos(point_direction(x,y,collis_obj.x,collis_obj.y-collis_obj.char_height/2));//(point_distance(x,y,collis_obj.x,collis_obj.y+collis_obj.char_height/2));
        if collision_circle(x,y,32,collis_obj,true,true) != noone {
            if collis_obj.item_id != noone {
                with collis_obj.item_id {
                    set_state(EVT.ALTUSE);
                    vsp = -2;
                    keep = false;
                }
            }
            collis_obj.item_id = id;
            sound_play(asset_get("mfx_coin"));
            // if use_type == 1 {
            //     set_state(EVT.USE);
            // }
            follow_player = collis_obj.id;
            set_state(EVT.IDLE);
            vsp = 0;
            hsp = 0;
            event_flag = EVT.GRAB;
            user_event(10);//Item Custom Behavior
            
            
        }
    }
    vsp *= .95;
    hsp *= .95;
}

if state == EVT.IDLE { //Following a Player
    keep = true;
    follow_pos[0] = follow_player.x - follow_player.spr_dir*follow_offset_x;
    follow_pos[1] = follow_player.y - follow_player.char_height*3/4;
    vsp = floor(-(y-follow_pos[1])/2);
    hsp = floor(-(x-follow_pos[0])/2);
    spr_dir = follow_player.spr_dir;
    event_flag = EVT.IDLE;
    user_event(10); //Item Custom Behavior
}

if state == EVT.USE { //Used
    pickup_cooldown = 30;
    event_flag = EVT.USE;
    user_event(10); //Item Custom Behavior
    
}

if state == EVT.ALTUSE { //Rejection & Cooldown
    pickup_cooldown = 30;
    event_flag = EVT.ALTUSE;
    user_event(10); //Item Custom Behavior
}
// with oPlayer if state == PS_RESPAWN print("[art10:update] completed check");
if state == EVT.DESTROY {
    keep = false;
    if follow_player != noone follow_player.item_id = noone; //Remove the item from the follow variable if it is filled
    event_flag = EVT.DESTROY;
    user_event(10); //Item Custom Behavior
    if debug print("[ITEM] Destroyed "+string(item_id));
    instance_destroy();
    exit;
}

//item_id = id;
//event_flag = EVT.IDLE;
//user_event(10);//Item Custom Behavior
#define item_sprite_get(_num,_sprite) //Get the sprite of this article
return sprite_get("item_"+string(_num)+"_"+string(_sprite));

#define set_state(_state)
state_timer = 0;
state = _state;