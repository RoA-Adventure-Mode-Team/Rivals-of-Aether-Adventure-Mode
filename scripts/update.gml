//
//user_event(1);
with asset_get("pHitBox") camera_shake = -1;

if debug {
	with asset_get("oPlayer") { //Debug vars
		djumps = 0; 
		has_walljump = true;
		//if player == 1 print_debug(string((collision_point(x,y+5,all,false,true)).object_index));
	}
	//print_debug(string(url));
	//with asset_get("pHitBox") visible = true;
	with obj_stage_article if num == 6 && player_controller != 0 djumps = max_djumps;
}



/*
with asset_get("oPlayer") {
	other.down_down = down_down;
	other.up_down = up_down;
}
if "cooldown" not in self cooldown = 0;

if down_down && cooldown <= 0 {
    cooldown = 15;
    repeat(1000) {
        last_ID++;
        with (last_ID) {
            if NoHasVar == undefined other.self_check = 0;
        }
    }
} else if up_down && cooldown <= 0 {
    cooldown = 15;
    repeat(1000) {
        last_ID--;
        with (last_ID) {
            if NoHasVar == undefined other.self_check = 0;
        }
    }
}
cooldown--;*/

/*with (self) {
            if NoHasVar == undefined other.self_check = 0;
        }*/