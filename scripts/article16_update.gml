//article16_update, Local Sound

if !_init {
    visible = true;
    _init = 1;
    exit;
}

collis_obj = collision_circle(x,y,radius_max,oPlayer,true,true);

if collis_obj != noone {
    if !sound_playing {
        sound_play(sound,loop,
        1-0.5*sign(collis_obj.x-x),
        1-point_distance(collis_obj.x,collis_obj.y,x,y)/radius_max);
    }
}