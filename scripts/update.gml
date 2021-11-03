//
//user_event(1);

if !_init {
	scene_manager = instance_create(0,0,"obj_stage_article",3);
	action_manager = scene_manager.id;
	room_manager = instance_create(0,0,"obj_stage_article",5);
	
	with follow_player {
		other.player_name  = get_char_info(player,INFO_STR_NAME);
		action_manager = other.action_manager;
		room_manager = other.room_manager;
	}
	scene_manager.player_name = player_name;
	/*debug = false;
	with obj_stage_article debug = false;
	with obj_stage_article_solid debug = false;
	with obj_stage_article_platform debug = false;*/
	// debug = false;
	with obj_stage_article {
		// if num == 3 other.action_manager = id;
		// if num == 5 other.room_manager = id;
		debug = other.debug;
		og_depth = depth;
	}
	with obj_stage_article_solid {
		debug = other.debug;
		og_depth = depth;
	}
	with obj_stage_article_platform {
		debug = other.debug;
		og_depth = depth;
	}
	_init = 1;
} else {
	// with oPlayer if state == PS_RESPAWN print("[update] started check");
	if debug {
		with oPlayer { //Debug vars
			djumps = 0; 
			has_walljump = true;
		}
		//print_debug(string(url));
		with asset_get("pHitBox") visible = true;
		with obj_stage_article if num == 6 && player_controller != 0 djumps = max_djumps;
	}
	if get_gameplay_time() == 3 with oPlayer {
		
		//Fix Sylvanos's hitboxes (if we do this in other_init.gml, the game crashes??)
		//Might as well do it here...
		if url == CH_SYLVANOS {
			set_hitbox_value(AT_NSPECIAL, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 0);
			set_hitbox_value(AT_FTILT, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 0);
		}
		
		// if taunt_down {
		// 	with other {
		// 		debug = true;
		// 		with obj_stage_article debug = true;
		// 		with obj_stage_article_solid debug = true;
		// 		with obj_stage_article_platform debug = true;
		// 	}
		// }
		set_state(PS_SPAWN);
		/*spr_dir = 1;
		clear_button_buffer(PC_LEFT_HARD_PRESSED);
		clear_button_buffer(PC_RIGHT_HARD_PRESSED);
		clear_button_buffer(PC_UP_HARD_PRESSED);
		clear_button_buffer(PC_DOWN_HARD_PRESSED);
		clear_button_buffer(PC_LEFT_STRONG_PRESSED);
		clear_button_buffer(PC_RIGHT_STRONG_PRESSED);
		clear_button_buffer(PC_UP_STRONG_PRESSED);
		clear_button_buffer(PC_DOWN_STRONG_PRESSED);
		clear_button_buffer(PC_LEFT_STICK_PRESSED);
		clear_button_buffer(PC_RIGHT_STICK_PRESSED);
		clear_button_buffer(PC_UP_STICK_PRESSED);
		clear_button_buffer(PC_DOWN_STICK_PRESSED);
		clear_button_buffer(PC_JUMP_PRESSED);
		clear_button_buffer(PC_ATTACK_PRESSED);
		clear_button_buffer(PC_SHIELD_PRESSED);
		clear_button_buffer(PC_SPECIAL_PRESSED);
		clear_button_buffer(PC_STRONG_PRESSED);
		clear_button_buffer(PC_TAUNT_PRESSED);*/
	}
	with oPlayer {
		if down_down down_held++;
		else down_held = 0;
		if up_down up_held++;
		else up_held = 0;
		if left_down left_held++;
		else left_held = 0;
		if right_down right_held++;
		else right_held = 0;
		if taunt_down taunt_held++;
		else taunt_held = 0;
		if attack_down attack_held++;
		else attack_held = 0;
		if special_down special_held++;
		else special_held = 0;
		//if taunt_held == 10 other.debug_console = !other.debug_console;
	}
	var wall_here;
	
	with pHitBox if type == 2 && grounds != 1 && vsp > 0 { //Make projectiles respond correctly to floors
		//Save the old size & mask, then switch to the ones appropriate for collisons with terrain
		var saved_mask = mask_index, saved_xscale = image_xscale, saved_yscale = image_yscale;
		mask_index = (collision_sprite == 0)?sprite_index:collision_sprite;
		image_xscale = 1; image_yscale = 1;
		
		//Check for collisions; if we're about to hit a floor then spawn a temporary rectangular floor
		if place_meeting(x, y + vsp + 2, asset_get("par_block")) {
			instance_create(floor(x + hsp), floor(y), "obj_stage_article_solid", 19);
		}
		
		//Reset size and mask to normal values
		image_xscale = saved_xscale; image_yscale = saved_yscale; mask_index = saved_mask; 
	}
	
	
	with oPlayer { //Fixes for various things due to article solids
		if god {
			invincible = true;
			invince_time = 2;
		}
		//DEBUG - TESTING RESPAWN
		// if special_held == 1 {
		// 	dead_pos = [x,y];
		// 	set_state(PS_RESPAWN);
		// }
		//DEBUG - testing end of game 
		// if attack_down && taunt_down end_match();
		
		//Removing CPUs without ending the game
		if "temp_level" in self {
			visible = false;
			image_xscale = 0;
			image_yscale = 0;
			x = 200;
			y = 200;
			set_state(PS_SPAWN);
			// clear_button_buffer(PC_LEFT_HARD_PRESSED);
			// clear_button_buffer(PC_RIGHT_HARD_PRESSED);
			// clear_button_buffer(PC_UP_HARD_PRESSED);
			// clear_button_buffer(PC_DOWN_HARD_PRESSED);
			// clear_button_buffer(PC_LEFT_STRONG_PRESSED);
			// clear_button_buffer(PC_RIGHT_STRONG_PRESSED);
			// clear_button_buffer(PC_UP_STRONG_PRESSED);
			// clear_button_buffer(PC_DOWN_STRONG_PRESSED);
			// clear_button_buffer(PC_LEFT_STICK_PRESSED);
			// clear_button_buffer(PC_RIGHT_STICK_PRESSED);
			// clear_button_buffer(PC_UP_STICK_PRESSED);
			// clear_button_buffer(PC_DOWN_STICK_PRESSED);
			// clear_button_buffer(PC_JUMP_PRESSED);
			// clear_button_buffer(PC_ATTACK_PRESSED);
			// clear_button_buffer(PC_SHIELD_PRESSED);
			// clear_button_buffer(PC_SPECIAL_PRESSED);
			// clear_button_buffer(PC_STRONG_PRESSED);
			// clear_button_buffer(PC_TAUNT_PRESSED);
			continue;
		}
		//Land Spam Fix
		if state == PS_LAND && free set_state(PS_IDLE_AIR);
		//Wall Jumps
		if state == PS_WALL_JUMP has_walljump_actual = false;
		if !free has_walljump_actual = true;
		wall_here = (right_down && place_meeting(x+22,y,obj_stage_article_solid) ) || (left_down && place_meeting(x-22,y,obj_stage_article_solid));
		has_walljump = wall_here && has_walljump_actual;
		// if (place_meeting(x+22,y,obj_stage_article_solid) || place_meeting(x-22,y,obj_stage_article_solid)) && state == PS_HITSTUN && get_player_damage(player) > 150 { //Alpha splat death?
		// if get_player_damage(player) > other.max_percent || //Die on too much percent taken
		
		if death_cooldown != 0 death_cooldown--;
		if !room_manager.room_switch_on && state != PS_SPAWN && state != PS_RESPAWN && (x > view_get_wview()+view_get_xview()+other.blastzone_x  || x < view_get_xview()-other.blastzone_x  ||
			y > view_get_hview()+view_get_yview()+other.blastzone_y  || y < view_get_yview()-other.blastzone_y) { //Die on getting outside of the camera range
			if death_cooldown == 0 {
				death_cooldown = death_cooldown_max;
				dead_pos = [x,y];
				// set_state(PS_SPAWN);
				create_deathbox(x,y-32,32,32,player,true,0,2,1);
			}
		}
		
		if start_down {
			other.is_paused = !other.is_paused;
			if other.is_paused set_player_damage(player, other.paused_percent[player]);
			else other.paused_percent[player] = get_player_damage(player);
		}
		//Keep dash upon landing
		if !prev_free && free && (prev_state == PS_DASH || prev_state == PS_DASH_START) keep_dash = true;
		if keep_dash {
			if !(left_held > 0 || right_held > 0) || 
			(free && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND)) ||
			state == PS_WAVELAND || shield_pressed {
				keep_dash = false;
			}
			if !free && state != PS_JUMPSQUAT && state != PS_WAVELAND && state != PS_DASH_START && (state != PS_TECH_GROUND && state != PS_TECH_FORWARD && state != PS_TECH_BACKWARD) {
				if ((left_held != 0) || (right_held != 0)) {
					set_state(PS_DASH_START);
					spr_dir = (right_held > 0) - (left_held > 0);
				}
				//state_timer = 0;
				keep_dash = false;
			} else if (!free) keep_dash = false;
		}
		// if state == PS_AIR_DODGE && old_pos[1] - y > 16 { //SNAPPING GRRR
		// 	y = old_pos[1];
		// 	print("SNAP");
		// }
		rel_pos = [x-view_get_xview(),y-view_get_yview()];
		prev_free = free;
		if state != PS_SPAWN speedrun_timer++; //Track each player's time when not in spawn state (unmovable)
		// if state != PS_AIR_DODGE old_pos = [x,y];
		
		// if state == PS_RESPAWN print("[update:player] completed check");
	}
	
	
	var i = 0;
	
	repeat ds_list_size(active_bosses) {
		if (!instance_exists(active_bosses[| i]))
        	ds_list_remove(active_bosses,active_bosses[| i]);
        i++;
	}
	//Window Update Call
	win_call = 2;
	user_event(2);
	
	// with oPlayer if state == PS_RESPAWN print("[update:windows] completed check");
	
	/*with oPlayer {
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
	        
	        
	        
}