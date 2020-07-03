// update
if(collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, asset_get("oPlayer"), false, true) != noone)
{
    // if(transparency_timer == 0)
    //     sound_play(sound_get("vanish_out"));
   transparency_timer++; 
}
else
{
    // if(transparency_timer == 32)
    //     sound_play(sound_get("vanish_in"));
    transparency_timer--;
}

if(transparency_timer > 20)
    transparency_timer = 20;
if(transparency_timer < 0)
    transparency_timer = 0;