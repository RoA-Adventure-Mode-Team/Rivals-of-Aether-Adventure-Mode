//article19_init, Floor Supporter, By floralQuaFloral

// visible = false;
sprite_index = sprite_get("projectile_supporter"); depth = -90000000;
image_xscale = 2;

var repetitions = 0, par_block = asset_get("par_block");
while repetitions < 100 && !place_meeting(x, y + 1, par_block) {
	y++;
}
image_yscale = 4; //adds a bit of thickness to the floor just in case