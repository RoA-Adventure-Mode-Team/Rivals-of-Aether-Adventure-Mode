//update Foreground/Dither
if(_init)
{
    deco_image = spawn_variables[0];
    dither_type = spawn_variables[1];
    full_transparency = spawn_variables[2];
    dither_time = spawn_variables[3];
    collis_type = spawn_variables[4];
    parallax_x = spawn_variables[5];
    parallax_y = spawn_variables[6];
    static = spawn_variables[7];
    mask_index = deco_image;
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
    with obj_stage_article if num == 5 {
        other.room_manager = id;
        other.init_cam_pos = init_cam_pos;
    }
    visible = true;
    _init = 0;
}

if parallax_x != 0 || parallax_y != 0 {
    x -= x_lax;
    y -= y_lax;
    x_lax = floor(parallax_x*lax_coef*(x-room_manager.true_pos[0]));
    y_lax = floor(parallax_y*lax_coef*(y-room_manager.true_pos[1]));
    x += x_lax;
    y += y_lax;
}




if !dither_type exit;
if((collis_type == 0 && collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_top, asset_get("oPlayer"), false, true) != noone) ||
    collis_type == 1 && instance_place(x,y,oPlayer) != noone)
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