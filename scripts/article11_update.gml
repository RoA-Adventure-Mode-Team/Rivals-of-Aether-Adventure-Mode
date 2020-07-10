// update
if(_init)
{
    dither_type = spawn_variables[0];
    full_transparency = spawn_variables[1];
    dither_time = spawn_variables[2];
    switch(dither_type)
    {
        case 1:
        dither_sprite = sprite_get("dither");
        break;
        case 2:
        dither_sprite = sprite_get("brick_dither");
        break;
        case 3:
        dither_sprite = sprite_get("dbz_dither");
        break;
        default:
        dither_sprite = asset_get("empty_sprite");
        break;
    }
    _init = 0;
}

if(collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, asset_get("oPlayer"), false, true) != noone)
{
    if(transparency_timer == 0 && dither_type == 3)
        sound_play(sound_get("vanish_out"));
   transparency_timer++; 
}
else
{
    if(transparency_timer == dither_time && dither_type == 3)
        sound_play(sound_get("vanish_in"));
    transparency_timer--;
}

if(transparency_timer > dither_time)
    transparency_timer = dither_time;
if(transparency_timer < 0)
    transparency_timer = 0;