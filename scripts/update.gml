//
//user_event(1);

if !_init {
	with follow_player {
		other.player_name  = get_char_info(player,INFO_STR_NAME);
	}
	print_debug(player_name);
	scene_manager = instance_create(0,0,"obj_stage_article",3);
	//action_manager = scene_manager.id;
	room_manager = instance_create(0,0,"obj_stage_article",5);
	scene_manager.player_name = player_name;
	/*debug = false;
	with obj_stage_article debug = false;
	with obj_stage_article_solid debug = false;
	with obj_stage_article_platform debug = false;*/
	debug = true;
	with obj_stage_article {
		if num == 3 other.action_manager = id;
		if num == 5 other.room_manager = id;
		debug = true;
	}
	with obj_stage_article_solid debug = true;
	with obj_stage_article_platform debug = true;
	
	_init = 1;
} else {
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
		if taunt_down {
			with other {
				debug = true;
				with obj_stage_article debug = true;
				with obj_stage_article_solid debug = true;
				with obj_stage_article_platform debug = true;
			}
		}
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
	with oPlayer if other.follow_player != id  {
			spr_dir = 0;
	    	//x = other.follow_player.x;
	    	//y = other.follow_player.y;
	    	hitstop = 1000;
	    	hitpause = true;
	    	x = 0;
	    	y = 0;
	    	visible = false;
	    	instance_destroy();
	}
	
	with follow_player {
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
		//if taunt_held == 10 other.debug_console = !other.debug_console;
	}
	var wall_here;
	with oPlayer { //Fixes for various things due to article solids
		//Land Spam Fix
		if state == PS_LAND && free set_state(PS_IDLE_AIR);
		//Wall Jumps
		if state == PS_WALL_JUMP has_walljump_actual = false;
		if !free has_walljump_actual = true;
		wall_here = (right_down && place_meeting(x+22,y,obj_stage_article_solid) ) || (left_down && place_meeting(x-22,y,obj_stage_article_solid)) ;
		has_walljump = wall_here && has_walljump_actual;
		//print_debug("has_walljump_actual: "+string(has_walljump_actual));
		//Keep dash upon landing
		if state == PS_JUMPSQUAT && (prev_state == PS_DASH || prev_state == PS_DASH_START) keep_dash = true;
		if keep_dash {
			//print_debug("KEEP DASH ACTIVE");
			if !(left_held > 0 || right_held > 0) || 
			(free && (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND)) ||
			state == PS_WAVELAND || shield_pressed {
				keep_dash = false;
				//print_debug("KEEP DASH END");
			}
			if !free && state != PS_JUMPSQUAT && state != PS_WAVELAND && state != PS_DASH_START {
				if ((left_held != 0) || (right_held != 0)) {
					set_state(PS_DASH_START);
					spr_dir = (right_held > 0) - (left_held > 0);
				}
				//state_timer = 0;
				keep_dash = false;
			}
		}
	}
	
	
	var i = 0;
	
	repeat ds_list_size(active_bosses) {
		if (!instance_exists(active_bosses[| i]))
        	ds_list_remove(active_bosses,active_bosses[| i]);
        i++;
	}

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