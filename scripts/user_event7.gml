//user_event6 extension

//Enum Declarations, DO NOT EDIT
enum TR {
    NEAR,
    MID,
    FAR,
    RANDOM,
    LOW,
    HIGH,
    WAYPOINT
}
//

//Event Enum
enum EN_EVENT {
    INIT,
    ANIMATION,
    PRE_DRAW,
    POST_DRAW,
    UPDATE,
    DEATH,
    SET_ATTACK,
    ATTACK_UPDATE,
    GOT_HIT,
    GOT_PARRIED,
    HIT_PLAYER,
    PARRY
}

//Enemy enums
enum EN {
    OU, //0
    ABRAWLER, //1
    FLEYE, //2
    ROCKO, //3
    LSBIRD, //4
    ESTALK, //5
    HOP, //6
    KEI, // 7
    GUARD, //8
    SUPPLIER, //9
    NGUARD, //10
    RYKEN = 100 //100
};
// with oPlayer if state == PS_RESPAWN print("[ue6] started check");

switch (enem_id) {
    case EN.RYKEN:
    	switch(art_event) {
    		case EN_EVENT.INIT:
    		//Initializations Here
    		
    		debug = true;
    		debug_info = true;
                
            sprite_name = "ryken";
            //player_controller = 1;
            hitpoints_max = 300;
            
            
            collision_box = asset_get("ex_guy_hurt_box");
            mask_index =  collision_box; // Collision Mask
            colis_width = bbox_right - bbox_left;
            colis_height = bbox_bottom - bbox_top;
            
            //AI Behavior
            ai_attack_timer = 0;
            ai_move_timer = 0;
            ai_jump_timer = 0;
            ai_moving_right = false;
            ai_moving_left = false;
            ai_decision_time = 10;
            short_hop = 0;
            
            //NPC Varaibles
            char_name = "Rykenburn";
            show_healthbar = false;
            is_boss = false;
            team = 1;
            patrol_type = 0;
            
            //AI Behavior Variables
            //Movement
            ai_range_low = 16; //The preferred minimum range
            ai_range_far = 64; //The preferred maximum range
            ai_move_frequency = 50;
            
            //Jumping
            ai_jump_back_frequency = 1; //How often the AI should jump back randomly.
            ai_jump_up_frequency = 1; //How often the AI should jump up randomly.
            ai_jump_fwd_frequency = 1; //How often the AI should jump forwards randomly.
            ai_jump_range_low = 64; //The preferred minimum range to jump.
            
            //Attacking
            attacks = [AT_NSPECIAL_AIR];
            
            ai_attack_frequency = 1; //How often to attack.
            ai_attack_cooldown = 0;
            ai_attack_counter = 0;
            
            able_to_crouch = false;
            able_to_shield = true;
            able_to_jump = true;
            able_to_dash = true;
            
            //Enemy Specific
            ai_hit_absorption = 0;
            ai_hit_percent = 0;
            percent = 20; //Assume early percent values?
                    
            //Animation Actions
            char_height = 40;
            char_arrow = sprite_get("char_arrow");
            anim_speed = .02;
            idle_anim_speed = .15;
            crouch_anim_speed = .1;
            walk_anim_speed = .25;
            dash_anim_speed = .2;
            pratfall_anim_speed = .25;
            full_time = 20;
            anim_type = 0; //0 is cycle; 1 is once per state
            
            //Movement Variables
            walk_speed = 3.0;
			walk_accel = 0.2;
			walk_turn_time = 6;
			initial_dash_time = 10;
			initial_dash_speed = 5;
			dash_speed = 5.75;
			dash_turn_time = 15;
			dash_turn_accel = 1;
			dash_stop_time = 6;
			dash_stop_percent = .35; //the value to multiply your hsp by when going into idle from dash or dashstop
			ground_friction = .6;
			moonwalk_accel = 1.4;
			
			jump_start_time = 5;
			jump_speed = 12;
			short_hop_speed = 7.4;
			djump_speed = 10.5;
			leave_ground_max = 7; //the maximum hsp you can have when you go from grounded to aerial without jumping
			max_jump_hsp = 6; //the maximum hsp you can have when jumping from the ground
			air_max_speed = 4; //the maximum hsp you can accelerate to when in a normal aerial state
			jump_change = 3; //maximum hsp when double jumping. If already going faster, it will not slow you down
			air_accel = .25;
			prat_fall_accel = .85; //multiplier of air_accel while in pratfall
			air_friction = .04;
			max_djumps = 1;
			double_jump_time = 32; //the number of frames to play the djump animation. Can't be less than 31.
			walljump_hsp = 7;
			walljump_vsp = 8;
			walljump_time = 32;
			max_fall = 10; //maximum fall speed without fastfalling
			fast_fall = 15; //fast fall speed
			gravity_speed = .6;
			hitstun_grav = .53;
			knockback_adj = 0.95; //the multiplier to KB dealt to you. 1 = default, >1 = lighter, <1 = heavier
			
			land_time = 4; //normal landing frames
			prat_land_time = 3;
			wave_land_time = 8;
			wave_land_adj = 1.35; //the multiplier to your initial hsp when wavelanding. Usually greater than 1
			wave_friction = .1; //grounded deceleration when wavelanding
			
			//crouch animation frames
			crouch_startup_frames = 2;
			crouch_active_frames = 6;
			crouch_recovery_frames = 2;
			
			//parry animation frames
			dodge_startup_frames = 1;
			dodge_active_frames = 1;
			dodge_recovery_frames = 3;
			
			//tech animation frames
			tech_active_frames = 3;
			tech_recovery_frames = 1;
			
			//tech roll animation frames
			techroll_startup_frames = 2;
			techroll_active_frames = 2;
			techroll_recovery_frames = 2;
			techroll_speed = 9;
			
			//airdodge animation frames
			air_dodge_startup_frames = 1;
			air_dodge_active_frames = 3;
			air_dodge_recovery_frames = 4;
			air_dodge_speed = 7.5;
			
			//roll animation frames
			roll_forward_startup_frames = 2;
			roll_forward_active_frames = 4;
			roll_forward_recovery_frames = 2;
			roll_back_startup_frames = 2;
			roll_back_active_frames = 4;
			roll_back_recovery_frames = 2;
			roll_forward_max = 9; //roll speed
			roll_backward_max = 9;
			
			land_sound = asset_get("sfx_land_heavy");
			landing_lag_sound = asset_get("sfx_land_med");
			waveland_sound = asset_get("sfx_waveland_fors");
			jump_sound = asset_get("sfx_jumpground");
			djump_sound = asset_get("sfx_jumpair");
			air_dodge_sound = asset_get("sfx_quick_dodge");
            death_sound = asset_get("sfx_death2");
            fx_enemy_abyssdeath = hit_fx_create(sprite_get("fx_enemy_abyssdeath"), 16);
            fx_enemy_abyssdeath2 = hit_fx_create(sprite_get("fx_enemy_abyssdeath2"), 16);
            
            
            //Ryken-specific variables 
            speedboost_timer = 0;
            grabbedid = noone;
			grab_timer = 0;
			grab_time_max = 30;
			
			dspecial_charge = 0;
			
			smoked_fx = hit_fx_create(sprite_get("smoke_debuff"), 12);
			smoked = false; //The smoked status effect
			smoke_hit_cooldown = 0;
			smoke_consumed = noone; //Smoke consumption
			smoke_timer_max = 600; //10 seconds
			
			max_fall_def = max_fall;
			walk_speed_def = walk_speed;
			dash_speed_def = dash_speed;
			air_max_speed_def = air_max_speed;
			smokeconsume_fx_bot = hit_fx_create(asset_get("fire_consume_top_spr"), 18);
			smokeconsume_fx_top = hit_fx_create(asset_get("fire_consume_bot_spr"), 18);
			
			//AM-specific variables
			hit_count_max = 5;
			hit_count_max_range = 4;
			hit_count_max_avg= 5;
			//Keep-'em on stage :P
			stage_l = 10106;
			stage_r = 10635;
			stage_y = 10330;
			
			
    		break;
    		case EN_EVENT.ANIMATION:
    		break;
    		case EN_EVENT.PRE_DRAW:
    		break;
    		case EN_EVENT.POST_DRAW:
    		break;
    		case EN_EVENT.UPDATE:
    		    //AI Code
    			// if (art_state != PS_ATTACK_GROUND && art_state != PS_ATTACK_AIR && !is_free && state_timer > 5) {
    			// 	if sign(ai_target.x-x) != 0 spr_dir = sign(ai_target.x-x);
    			// 	next_attack = AT_NSPECIAL;
    			// }
                if team == 0 {
                	
	    			if (player_controller == 0 && hitstun <= 0) {
	                    var t_dist = point_distance(x, y, ai_target.x, ai_target.y);
	                    var t_xd = abs(ai_target.x - x);
	                    var t_yd = abs(ai_target.y - y);
	                    var rel_y = ai_target.y - y;
	                    
	                    //Set After Team Change
	                    show_healthbar = true;
            			is_boss = true;
            			
	                    right_down = ai_moving_right;
	                    left_down = ai_moving_left;
	                    // jump_down = art_state == PS_JUMPSQUAT;
	                    if art_state == PS_JUMPSQUAT {
	                    	if short_hop {
	                    		jump_down = false;
	                    	}
	                    	short_hop = false;
	                    } else if short_hop {
	                    	jump_down = true;
	                    }
	                    left_hard_pressed = false;
	                    right_hard_pressed = false;
	                    down_hard_pressed = false;
	                    
	                    if can_fast_fall down_hard_pressed = true;
	                    var decision_random = 0;
	                    
	                    if hit_count >= hit_count_max && art_state != PS_ATTACK_GROUND && art_state != PS_ATTACK_AIR {
	                    	next_attack = AT_DSPECIAL;
	                    	hit_count = 0;
	                    	hit_count_max = hit_count_max_avg + random_func(id % 200,hit_count_max_range,true);
	                    	ai_attack_cooldown = 20;
	                    }
	                    
	                    //Moving
	                    ai_move_timer++;
	                    
	                    
	                    
	                    // if team == 1 {
	                    // 	var _colis_check = instance_position(x+32*sign(ai_target.x - x),y-2, obj_stage_article_solid);
	                    // 	if _colis_check != noone {
	                    // 		ai_move_timer = ai_move_frequency;
	                    // 		ai_target.x = 2*x-ai_target.x; //Flip to other size
	                    // 	}
	                    // }
	                    
	                    if (ai_move_timer % ai_move_frequency == 0 && !committed) {
	         //           	if team == 1 {
			    			// 	ai_target = {
			    			// 		x: init_x+random_func(id % 50, 600, true)-300,
			    			// 		y: y
			    			// 	};
			    			// }
	                    	ai_move_timer = random_func(id % 50, ai_move_frequency, true); //Randomize movement
	                        if (t_xd >= ai_range_low) {
	                            if (t_xd >= ai_range_far) { //If agro'd
	                                if (ai_target.x > x) right_hard_pressed = true;
	                                if (ai_target.x < x) left_hard_pressed = true;
	                            }
	                            if (ai_target.x > x) {
	                                ai_moving_right = true;
	                                ai_moving_left = false;
	                            } 
	                            if (ai_target.x < x) {
	                                ai_moving_right = false;
	                                ai_moving_left = true;
	                            } 
	                        }
	                        else {
	                            ai_moving_right = false;
	                            ai_moving_left = false;
	                            if (ai_target.x > x && spr_dir == -1) {
	                                right_down = true;
	                                left_down = false; 
	                            }
	                            if (ai_target.x < x && spr_dir == 1) {
	                                right_down = false;
	                                left_down = true; 
	                            }
	                        }
	                        if art_state == PS_DASH {
	                            if (right_down && ai_target.x < x) {
	                                ai_moving_right = false;
	                                ai_moving_left = false;
	                                if (ai_target.x > x && spr_dir == -1) {
	                                    right_down = true;
	                                    left_down = false; 
	                                }
	                                if (ai_target.x < x && spr_dir == 1) {
	                                    right_down = false;
	                                    left_down = true; 
	                                }
	                            }
	                            if (left_down && ai_target.x > x) {
	                                ai_moving_right = false;
	                                ai_moving_left = false;
	                                if (ai_target.x > x && spr_dir == -1) {
	                                    right_down = true;
	                                    left_down = false; 
	                                }
	                                if (ai_target.x < x && spr_dir == 1) {
	                                    right_down = false;
	                                    left_down = true; 
	                                }
	                            }
	                        }
	                    }
	                
	                    //Jumping
	                    ai_jump_timer ++;
	                    decision_random = random_func(id % 50, round(ai_decision_time), true);
	                    
	                    // if team != 1 {
	                    if (!is_free) {
	                        if (!place_meet(x + 32 * spr_dir, y + 16)) {
	                            jump_down = true;
	                            if (spr_dir == 1) {
	                                ai_moving_right = true;
	                                ai_moving_left = false;
	                            } 
	                            if (spr_dir == -1) {
	                                ai_moving_right = false;
	                                ai_moving_left = true;
	                            } 
	                        }
	                        if (decision_random == 0 && !committed) {
	                            if (ai_target.y + 24 <= y) {
	                                var jump_random = random_func(id % 50, 100, true);
	                                if (jump_random <= 25) {
	                                    var jump_random2 = random_func(id % 50, 100, true);
	                                    if (ai_jump_timer % (ai_jump_fwd_frequency  + decision_random) == 0 && jump_random2 <= 33) {
	                                        jump_down = true;
	                                        if (ai_target.x > x) {
	                                            ai_moving_right = true;
	                                            ai_moving_left = false;
	                                        } 
	                                        if (ai_target.x < x) {
	                                            ai_moving_right = false;
	                                            ai_moving_left = true;
	                                        } 
	                                    }
	                                    
	                                    if (ai_jump_timer % (ai_jump_up_frequency + decision_random) == 0 && jump_random2 > 33 && jump_random2 <= 66) {
	                                        jump_down = true;
	                                        ai_moving_right = false;
	                                        ai_moving_left = false;
	                                    }
	                                    
	                                    if (ai_jump_timer % (ai_jump_back_frequency + decision_random) == 0 && jump_random2 > 66) {
	                                        jump_down = true;
	                                        if (ai_target.x > x) {
	                                            ai_moving_right = false;
	                                            ai_moving_left = true;
	                                        } 
	                                        if (ai_target.x < x) {
	                                            ai_moving_right = true;
	                                            ai_moving_left = false;
	                                        } 
	                                    }
	                                }
	                                else {
	                                    if (ai_jump_timer % ai_decision_time == 0) {
	                                        down_hard_pressed = true;
	                                    }
	                                }
	                            }
	                        }
	                    }
	                    else {
	                        jump_down = vsp < 0;
	                        if (able_to_djump) {
	                             if (ai_jump_timer % (ai_decision_time + decision_random) == 0) {
	                                 jump_down = true;
	                                if (ai_target.x > x) {
	                                    ai_moving_right = true;
	                                    ai_moving_left = false;
	                                } 
	                                if (ai_target.x < x) {
	                                    ai_moving_right = false;
	                                    ai_moving_left = true;
	                                } 
	                             }
	                        }
	                    }
	                    // }
	                    
	                    //Attacking
	                    //KEEEL
	                    if (ai_target.state == PS_HITSTUN) {
	                    	ai_attack_timer = 20;
	                    }
	                    if (ai_attack_timer > 0) {
	                    	ai_attack_timer --;
	                    	if (art_state != PS_ATTACK_GROUND && art_state != PS_ATTACK_AIR) {
	                    		if ((ai_target.x < x && spr_dir == 1) || (ai_target.x > x && spr_dir = -1)) {
	                                spr_dir = -spr_dir;
	                            }
	                            var decision_random2 = random_func((id % 50) + 2, 100, true);
	                            // if (rel_y <= -64) jump_down = true;
	                            if (rel_y <= -96) jump_down = true;
	                            else if (rel_y <= -64 && !is_free) short_hop = true;
		                    	else {
		                    		if t_xd <= 128 {
			                    		if (t_yd >= 80 && decision_random2 <= 60) {
			                    			if is_free next_attack = AT_UAIR;
			                    			else {
			                    				if decision_random2 <= 30 next_attack = AT_UTILT;
			                    				else next_attack = AT_USPECIAL;
			                    			}
			                    		}
			                    		// else if (t_xd <= 32) next_attack = AT_NSPECIAL;
			                    		else {
			                    			if (t_xd <= 96) {
				                    			if is_free next_attack = AT_FAIR;
				                    			else if (t_yd <= 20) next_attack = AT_DTILT;
				                    			else next_attack = AT_DTILT;
			                    			}
			                    		}
		                    		}
		                    	}
		                    }
	                    }
	                    
	                    //Default behavior
	                    if (ai_attack_timer == 0 && ai_attack_cooldown <= 0) {
	                        decision_random = random_func(id % 50, round(ai_attack_frequency), true);
	                        var decision_random2 = random_func((id % 50) + 2, 100, true);
	                        if (decision_random == 0 && !committed) {
	                        	if (t_xd <= 64 && t_yd <= 64) {
	                        		if		decision_random2 <= 20 next_attack = AT_NSPECIAL;
	                        		else if decision_random2 <= 40 next_attack = AT_JAB;
	                        		else if decision_random2 <= 60 next_attack = AT_DTILT;
	                        		else if decision_random2 <= 80 next_attack = AT_UTILT;
	                        		else if decision_random2 <= 100 next_attack = AT_FTILT;
	                        	}
	                        	var player_dmg;
	                        	with obj_stage_main player_dmg = get_player_damage(other.ai_target.player);
	                            if (t_xd <= 300 && t_xd >= 64 && t_yd <= 80 && player_dmg >= 60) {
	                                // if  player_dmg >= 60 next_attack = AT_FSPECIAL;
	                                next_attack = AT_FSPECIAL;
	                            }
	                            if (t_xd <= 128 && rel_y <= -64 && rel_y >= -240) {
	                                if  player_dmg >= 60 next_attack = AT_USPECIAL;
	                                else if is_free next_attack = AT_UAIR;
	                                else jump_down = true;
	                            }
	                            
	                            if ((ai_target.x < x && spr_dir == 1) || (ai_target.x > x && spr_dir = -1)) {
	                                spr_dir = -spr_dir;
	                            }
	                            ai_attack_cooldown = 20;
	                        }
	                       
	                        
	                    }
	                    else {
	                        // if (art_state != PS_ATTACK_GROUND && art_state != PS_ATTACK_AIR)
	                       ai_attack_cooldown --;
	                    }
	                } else { //If in hitstun
	                	if hit_count >= hit_count_max*1.5 { //Cheese protection :)
	                    	next_attack = AT_DSPECIAL;
	                    	hit_count = 0;
	                    	hit_count_max = hit_count_max_avg + random_func(id % 200,hit_count_max_range,true);
	                    	ai_attack_cooldown = 20;
	                    }
	                }
                }
    			
    			//Character Code Execution
    			if (speedboost_timer > 0) {
                	if (state == PS_ATTACK_AIR || state == PS_ATTACK_GROUND)
                		speedboost_timer --;
                	walk_speed = walk_speed_def * 1.5;
                	dash_speed = dash_speed_def * 1.5;
                	air_max_speed = air_max_speed_def * 1.5;
                }
                else {
                	walk_speed = walk_speed_def;
                	dash_speed = dash_speed_def;
                	air_max_speed = air_max_speed_def;
                }
    // 			if(grabbedid != noone){
    //             	grabbedid.ungrab++;
    //             	if(grabbedid.ungrab == 4){
    //             		grabbedid.state = PS_TUMBLE;
    //             		grabbedid.ungrab = 0;
    //             		grabbedid = noone;
    //             	}
    //             	else {
    //                     grabbedid.hitstop = 2;
    //                     grabbedid.hitpause = true;
    //                     grabbedid.state = PS_HITSTUN;
    //                     grabbedid.hsp = 0;
    //                     grabbedid.vsp = 0;
    //             	}
    //             }
    		break;
    		case EN_EVENT.DEATH:
    		break;
    		case EN_EVENT.SET_ATTACK: //Have all nessessary attacks, plus a few extra/edited
    			 with (obj_stage_main) {
                    switch (other.attack) {
                    	case AT_JAB:
                    		set_attack_value(AT_JAB, AG_SPRITE, sprite_get("enemy_100_jab"));
							set_attack_value(AT_JAB, AG_HURTBOX_SPRITE, sprite_get("enemy_100_jab_hurt"));
							set_attack_value(AT_JAB, AG_NUM_WINDOWS, 3);
							
							set_window_value(AT_JAB, 1, AG_WINDOW_LENGTH, 6);
							set_window_value(AT_JAB, 1, AG_WINDOW_ANIM_FRAMES, 2);
							set_window_value(AT_JAB, 1, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_JAB, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_medium1"));
							set_window_value(AT_JAB, 1, AG_WINDOW_SFX_FRAME, 5);
							
							set_window_value(AT_JAB, 2, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_JAB, 2, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_JAB, 2, AG_WINDOW_ANIM_FRAME_START, 2);
							set_window_value(AT_JAB, 2, AG_WINDOW_HSPEED, 2.5);
							
							set_window_value(AT_JAB, 3, AG_WINDOW_LENGTH, 10);
							set_window_value(AT_JAB, 3, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_JAB, 3, AG_WINDOW_ANIM_FRAME_START, 2);
							set_window_value(AT_JAB, 3, AG_WINDOW_HAS_WHIFFLAG, 1);
							set_window_value(AT_JAB, 3, AG_WINDOW_CANCEL_TYPE, 1);
							set_window_value(AT_JAB, 3, AG_WINDOW_CANCEL_FRAME, 4);
							
							
							set_num_hitboxes(AT_JAB, 1);
							
							set_hitbox_value(AT_JAB, 1, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_JAB, 1, HG_WINDOW, 2);
							set_hitbox_value(AT_JAB, 1, HG_LIFETIME, 3);
							set_hitbox_value(AT_JAB, 1, HG_HITBOX_X, 46);
							set_hitbox_value(AT_JAB, 1, HG_HITBOX_Y, -36);
							set_hitbox_value(AT_JAB, 1, HG_WIDTH, 76);
							set_hitbox_value(AT_JAB, 1, HG_HEIGHT, 42);
							set_hitbox_value(AT_JAB, 1, HG_PRIORITY, 6);
							set_hitbox_value(AT_JAB, 1, HG_DAMAGE, 8);
							set_hitbox_value(AT_JAB, 1, HG_ANGLE, 65);
							set_hitbox_value(AT_JAB, 1, HG_BASE_KNOCKBACK, 6);
							set_hitbox_value(AT_JAB, 1, HG_KNOCKBACK_SCALING, 0.2);
							set_hitbox_value(AT_JAB, 1, HG_BASE_HITPAUSE, 15);
							set_hitbox_value(AT_JAB, 1, HG_HITPAUSE_SCALING, 0.15);
							set_hitbox_value(AT_JAB, 1, HG_VISUAL_EFFECT, 301);
							set_hitbox_value(AT_JAB, 1, HG_HIT_SFX, asset_get("sfx_blow_medium1"));
							set_hitbox_value(AT_JAB, 1, HG_ANGLE_FLIPPER, 6);
							set_hitbox_value(AT_JAB, 1, HG_FORCE_FLINCH, 3);
                    		break;	
                    	case AT_UTILT:
                    		set_attack_value(AT_UTILT, AG_SPRITE, sprite_get("enemy_100_utilt"));
							set_attack_value(AT_UTILT, AG_HURTBOX_SPRITE, sprite_get("enemy_100_utilt_hurt"));
							
							set_attack_value(AT_UTILT, AG_NUM_WINDOWS, 3);
							set_window_value(AT_UTILT, 1, AG_WINDOW_LENGTH, 8);
							set_window_value(AT_UTILT, 1, AG_WINDOW_ANIM_FRAMES, 3);
							set_window_value(AT_UTILT, 1, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_UTILT, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_medium2"));
							set_window_value(AT_UTILT, 1, AG_WINDOW_SFX_FRAME, 7);
							
							set_window_value(AT_UTILT, 2, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_UTILT, 2, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_UTILT, 2, AG_WINDOW_ANIM_FRAME_START, 3);
							set_window_value(AT_UTILT, 2, AG_WINDOW_HSPEED, 0.5);
							
							set_window_value(AT_UTILT, 3, AG_WINDOW_LENGTH, 10);
							set_window_value(AT_UTILT, 3, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_UTILT, 3, AG_WINDOW_ANIM_FRAME_START, 4);
							set_window_value(AT_UTILT, 3, AG_WINDOW_HAS_WHIFFLAG, 1);
							
							
							set_num_hitboxes(AT_UTILT, 1);
							set_hitbox_value(AT_UTILT, 1, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_UTILT, 1, HG_WINDOW, 2);
							set_hitbox_value(AT_UTILT, 1, HG_LIFETIME, 3);
							set_hitbox_value(AT_UTILT, 1, HG_HITBOX_X, 14);
							set_hitbox_value(AT_UTILT, 1, HG_HITBOX_Y, -60);
							set_hitbox_value(AT_UTILT, 1, HG_WIDTH, 54);
							set_hitbox_value(AT_UTILT, 1, HG_HEIGHT, 112);
							set_hitbox_value(AT_UTILT, 1, HG_PRIORITY, 4);
							set_hitbox_value(AT_UTILT, 1, HG_DAMAGE, 7);
							set_hitbox_value(AT_UTILT, 1, HG_ANGLE, 90);
							set_hitbox_value(AT_UTILT, 1, HG_ANGLE_FLIPPER, 7);
							set_hitbox_value(AT_UTILT, 1, HG_HITSTUN_MULTIPLIER, 1.2);
							set_hitbox_value(AT_UTILT, 1, HG_BASE_KNOCKBACK, 9);
							set_hitbox_value(AT_UTILT, 1, HG_KNOCKBACK_SCALING, 0.2);
							set_hitbox_value(AT_UTILT, 1, HG_BASE_HITPAUSE, 15);
							set_hitbox_value(AT_UTILT, 1, HG_VISUAL_EFFECT, 304);
							set_hitbox_value(AT_UTILT, 1, HG_VISUAL_EFFECT_Y_OFFSET, -16);
							set_hitbox_value(AT_UTILT, 1, HG_HIT_SFX, asset_get("sfx_blow_medium3"));
                    		break;
                    	case AT_DTILT:
                    		set_attack_value(AT_DTILT, AG_SPRITE, sprite_get("enemy_100_dtilt"));
							set_attack_value(AT_DTILT, AG_HURTBOX_SPRITE, sprite_get("enemy_100_dtilt_hurt"));
							set_attack_value(AT_DTILT, AG_NUM_WINDOWS, 3);
							
							set_window_value(AT_DTILT, 1, AG_WINDOW_LENGTH, 8);
							set_window_value(AT_DTILT, 1, AG_WINDOW_ANIM_FRAMES, 2);
							set_window_value(AT_DTILT, 1, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_DTILT, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_medium1"));
							set_window_value(AT_DTILT, 1, AG_WINDOW_SFX_FRAME, 7);
							
							set_window_value(AT_DTILT, 2, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_DTILT, 2, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_DTILT, 2, AG_WINDOW_ANIM_FRAME_START, 2);
							set_window_value(AT_DTILT, 2, AG_WINDOW_HSPEED, 2);
							
							set_window_value(AT_DTILT, 3, AG_WINDOW_LENGTH, 12);
							set_window_value(AT_DTILT, 3, AG_WINDOW_ANIM_FRAMES, 7);
							set_window_value(AT_DTILT, 3, AG_WINDOW_ANIM_FRAME_START, 3);
							set_window_value(AT_DTILT, 3, AG_WINDOW_HAS_WHIFFLAG, 1);
							
							
							set_num_hitboxes(AT_DTILT, 1);
							set_hitbox_value(AT_DTILT, 1, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_DTILT, 1, HG_WINDOW, 2);
							set_hitbox_value(AT_DTILT, 1, HG_LIFETIME, 3);
							set_hitbox_value(AT_DTILT, 1, HG_HITBOX_X, 48);
							set_hitbox_value(AT_DTILT, 1, HG_HITBOX_Y, -14);
							set_hitbox_value(AT_DTILT, 1, HG_WIDTH, 98);
							set_hitbox_value(AT_DTILT, 1, HG_HEIGHT, 32);
							set_hitbox_value(AT_DTILT, 1, HG_SHAPE, 2);
							set_hitbox_value(AT_DTILT, 1, HG_PRIORITY, 3);
							set_hitbox_value(AT_DTILT, 1, HG_DAMAGE, 9);
							set_hitbox_value(AT_DTILT, 1, HG_ANGLE, 85);
							set_hitbox_value(AT_DTILT, 1, HG_BASE_KNOCKBACK, 9);
							set_hitbox_value(AT_DTILT, 1, HG_KNOCKBACK_SCALING, 0.2);
							set_hitbox_value(AT_DTILT, 1, HG_BASE_HITPAUSE, 9);
							set_hitbox_value(AT_DTILT, 1, HG_HITPAUSE_SCALING, 0.5);
							set_hitbox_value(AT_DTILT, 1, HG_VISUAL_EFFECT, 301);
							set_hitbox_value(AT_DTILT, 1, HG_ANGLE_FLIPPER, 7);
							set_hitbox_value(AT_DTILT, 1, HG_HIT_SFX, asset_get("sfx_blow_medium3"));
                    		break;
                    	case AT_FTHROW:
                    		set_attack_value(AT_FTHROW, AG_CATEGORY, 2);
							set_attack_value(AT_FTHROW, AG_SPRITE, sprite_get("enemy_100_fthrow"));
							set_attack_value(AT_FTHROW, AG_HURTBOX_SPRITE, sprite_get("enemy_100_fthrow_hurt"));
							set_attack_value(AT_FTHROW, AG_AIR_SPRITE, sprite_get("enemy_100_fthrow_air"));
							set_attack_value(AT_FTHROW, AG_HURTBOX_AIR_SPRITE, sprite_get("enemy_100_fthrow_air_hurt"));
							set_attack_value(AT_FTHROW, AG_USES_CUSTOM_GRAVITY, 1);
							
							set_attack_value(AT_FTHROW, AG_NUM_WINDOWS, 5);
							set_window_value(AT_FTHROW, 1, AG_WINDOW_LENGTH, 12);
							set_window_value(AT_FTHROW, 1, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_FTHROW, 1, AG_WINDOW_VSPEED_TYPE, 1);
							set_window_value(AT_FTHROW, 1, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_FTHROW, 1, AG_WINDOW_CUSTOM_GRAVITY, 0);
							set_window_value(AT_FTHROW, 1, AG_WINDOW_INVINCIBILITY, 1);
							
							//Throw 1
							set_window_value(AT_FTHROW, 2, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_FTHROW, 2, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_FTHROW, 2, AG_WINDOW_ANIM_FRAME_START, 4);
							set_window_value(AT_FTHROW, 2, AG_WINDOW_VSPEED_TYPE, 1);
							set_window_value(AT_FTHROW, 2, AG_WINDOW_HSPEED, 1);
							set_window_value(AT_FTHROW, 2, AG_WINDOW_HSPEED_TYPE, 2);
							set_window_value(AT_FTHROW, 2, AG_WINDOW_INVINCIBILITY, 1);
							set_window_value(AT_FTHROW, 2, AG_WINDOW_CUSTOM_GRAVITY, 0);
							
							set_window_value(AT_FTHROW, 3, AG_WINDOW_LENGTH, 12);
							set_window_value(AT_FTHROW, 3, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_FTHROW, 3, AG_WINDOW_ANIM_FRAME_START, 5);
							set_window_value(AT_FTHROW, 3, AG_WINDOW_CUSTOM_GRAVITY, 0.1);
							set_window_value(AT_FTHROW, 3, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
							set_window_value(AT_FTHROW, 3, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.04);
							set_window_value(AT_FTHROW, 3, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.2);
							
							//Smoked throw
							set_window_value(AT_FTHROW, 4, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_FTHROW, 4, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_FTHROW, 4, AG_WINDOW_ANIM_FRAME_START, 4);
							set_window_value(AT_FTHROW, 4, AG_WINDOW_VSPEED_TYPE, 1);
							set_window_value(AT_FTHROW, 4, AG_WINDOW_HSPEED, 1);
							set_window_value(AT_FTHROW, 4, AG_WINDOW_HSPEED_TYPE, 2);
							set_window_value(AT_FTHROW, 4, AG_WINDOW_INVINCIBILITY, 1);
							set_window_value(AT_FTHROW, 4, AG_WINDOW_CUSTOM_GRAVITY, 0);
							
							set_window_value(AT_FTHROW, 5, AG_WINDOW_LENGTH, 18);
							set_window_value(AT_FTHROW, 5, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_FTHROW, 5, AG_WINDOW_ANIM_FRAME_START, 5);
							set_window_value(AT_FTHROW, 5, AG_WINDOW_CUSTOM_GRAVITY, 0.1);
							set_window_value(AT_FTHROW, 5, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
							set_window_value(AT_FTHROW, 5, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.04);
							set_window_value(AT_FTHROW, 5, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.2);
							
							
							set_num_hitboxes(AT_FTHROW, 2);
							
							//Normal
							set_hitbox_value(AT_FTHROW, 1, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_FTHROW, 1, HG_WINDOW, 2);
							set_hitbox_value(AT_FTHROW, 1, HG_LIFETIME, 3);
							set_hitbox_value(AT_FTHROW, 1, HG_HITBOX_X, 48);
							set_hitbox_value(AT_FTHROW, 1, HG_HITBOX_Y, -16);
							set_hitbox_value(AT_FTHROW, 1, HG_WIDTH, 80);
							set_hitbox_value(AT_FTHROW, 1, HG_HEIGHT, 64);
							set_hitbox_value(AT_FTHROW, 1, HG_ANGLE, 45);
							set_hitbox_value(AT_FTHROW, 1, HG_PRIORITY, 2);
							set_hitbox_value(AT_FTHROW, 1, HG_DAMAGE, 8);
							set_hitbox_value(AT_FTHROW, 1, HG_BASE_KNOCKBACK, 6);
							set_hitbox_value(AT_FTHROW, 1, HG_KNOCKBACK_SCALING, 0.8);
							set_hitbox_value(AT_FTHROW, 1, HG_BASE_HITPAUSE, 8);
							set_hitbox_value(AT_FTHROW, 1, HG_HITPAUSE_SCALING, 0.8);
							set_hitbox_value(AT_FTHROW, 1, HG_HIT_SFX, asset_get("sfx_swipe_medium2"));
							set_hitbox_value(AT_FTHROW, 1, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_FTHROW, 1, HG_HITSTUN_MULTIPLIER, 1.2);
							set_hitbox_value(AT_FTHROW, 1, HG_TECHABLE, 1);
							set_hitbox_value(AT_FTHROW, 1, HG_VISUAL_EFFECT, 1);
							
							//Smoked
							set_hitbox_value(AT_FTHROW, 2, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_FTHROW, 2, HG_WINDOW, 4);
							set_hitbox_value(AT_FTHROW, 2, HG_LIFETIME, 3);
							set_hitbox_value(AT_FTHROW, 2, HG_HITBOX_X, 48);
							set_hitbox_value(AT_FTHROW, 2, HG_HITBOX_Y, -16);
							set_hitbox_value(AT_FTHROW, 2, HG_WIDTH, 80);
							set_hitbox_value(AT_FTHROW, 2, HG_HEIGHT, 64);
							set_hitbox_value(AT_FTHROW, 2, HG_ANGLE, 40);
							set_hitbox_value(AT_FTHROW, 2, HG_PRIORITY, 3);
							set_hitbox_value(AT_FTHROW, 2, HG_DAMAGE, 11);
							set_hitbox_value(AT_FTHROW, 2, HG_BASE_KNOCKBACK, 11);
							set_hitbox_value(AT_FTHROW, 2, HG_KNOCKBACK_SCALING, .9);
							set_hitbox_value(AT_FTHROW, 2, HG_BASE_HITPAUSE, 12);
							set_hitbox_value(AT_FTHROW, 2, HG_HITPAUSE_SCALING, 1);
							set_hitbox_value(AT_FTHROW, 2, HG_HIT_SFX, asset_get("sfx_burnconsume"));
							set_hitbox_value(AT_FTHROW, 2, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_FTHROW, 2, HG_HITSTUN_MULTIPLIER, 1);
							set_hitbox_value(AT_FTHROW, 2, HG_TECHABLE, 1);
							set_hitbox_value(AT_FTHROW, 2, HG_VISUAL_EFFECT, other.smokeconsume_fx_bot);
							set_hitbox_value(AT_FTHROW, 2, HG_VISUAL_EFFECT_Y_OFFSET, 32);

                    		break;
                    	case AT_UTHROW:
                    		set_attack_value(AT_UTHROW, AG_CATEGORY, 2);
							set_attack_value(AT_UTHROW, AG_SPRITE, sprite_get("enemy_100_uthrow"));
							set_attack_value(AT_UTHROW, AG_AIR_SPRITE, sprite_get("enemy_100_uthrow_air"));
							set_attack_value(AT_UTHROW, AG_HURTBOX_SPRITE, sprite_get("enemy_100_uthrow_hurt"));
							set_attack_value(AT_UTHROW, AG_HURTBOX_AIR_SPRITE, sprite_get("enemy_100_uthrow_air_hurt"));
							set_attack_value(AT_UTHROW, AG_USES_CUSTOM_GRAVITY, 1);
							
							set_attack_value(AT_UTHROW, AG_NUM_WINDOWS, 5);
							set_window_value(AT_UTHROW, 1, AG_WINDOW_LENGTH, 11);
							set_window_value(AT_UTHROW, 1, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_UTHROW, 1, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_UTHROW, 1, AG_WINDOW_VSPEED_TYPE, 1);
							set_window_value(AT_UTHROW, 1, AG_WINDOW_INVINCIBILITY, 1);
							set_window_value(AT_UTHROW, 1, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_UTHROW, 1, AG_WINDOW_SFX_FRAME, 10);
							 
							
							//Throw 1
							set_window_value(AT_UTHROW, 2, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_UTHROW, 2, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_UTHROW, 2, AG_WINDOW_ANIM_FRAME_START, 4);
							set_window_value(AT_UTHROW, 2, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_UTHROW, 2, AG_WINDOW_VSPEED_TYPE, 1);
							set_window_value(AT_UTHROW, 2, AG_WINDOW_INVINCIBILITY, 1);
							
							
							
							
							set_window_value(AT_UTHROW, 3, AG_WINDOW_LENGTH, 8);
							set_window_value(AT_UTHROW, 3, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_UTHROW, 3, AG_WINDOW_ANIM_FRAME_START, 5);
							set_window_value(AT_UTHROW, 3, AG_WINDOW_VSPEED_TYPE, 2);
							set_window_value(AT_UTHROW, 3, AG_WINDOW_CUSTOM_GRAVITY, 0.1);
							set_window_value(AT_UTHROW, 3, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
							set_window_value(AT_UTHROW, 3, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.04);
							set_window_value(AT_UTHROW, 3, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.2);
							
							//Smoked Throw
							set_window_value(AT_UTHROW, 4, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_UTHROW, 4, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_UTHROW, 4, AG_WINDOW_ANIM_FRAME_START, 4);
							set_window_value(AT_UTHROW, 4, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_UTHROW, 4, AG_WINDOW_VSPEED_TYPE, 1);
							set_window_value(AT_UTHROW, 4, AG_WINDOW_INVINCIBILITY, 1);
							
							set_window_value(AT_UTHROW, 5, AG_WINDOW_LENGTH, 12);
							set_window_value(AT_UTHROW, 5, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_UTHROW, 5, AG_WINDOW_ANIM_FRAME_START, 5);
							set_window_value(AT_UTHROW, 5, AG_WINDOW_VSPEED_TYPE, 2);
							set_window_value(AT_UTHROW, 5, AG_WINDOW_CUSTOM_GRAVITY, 0.1);
							set_window_value(AT_UTHROW, 5, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
							set_window_value(AT_UTHROW, 5, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.04);
							set_window_value(AT_UTHROW, 5, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.2);
							
							set_num_hitboxes(AT_UTHROW, 2);
							
							//Normal
							set_hitbox_value(AT_UTHROW, 1, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_UTHROW, 1, HG_WINDOW, 2);
							set_hitbox_value(AT_UTHROW, 1, HG_LIFETIME, 3);
							set_hitbox_value(AT_UTHROW, 1, HG_HITBOX_X, 12);
							set_hitbox_value(AT_UTHROW, 1, HG_HITBOX_Y, -48);
							set_hitbox_value(AT_UTHROW, 1, HG_WIDTH, 80);
							set_hitbox_value(AT_UTHROW, 1, HG_HEIGHT, 64);
							set_hitbox_value(AT_UTHROW, 1, HG_ANGLE, 90);
							set_hitbox_value(AT_UTHROW, 1, HG_PRIORITY, 2);
							set_hitbox_value(AT_UTHROW, 1, HG_DAMAGE, 8);
							set_hitbox_value(AT_UTHROW, 1, HG_BASE_KNOCKBACK, 7);
							set_hitbox_value(AT_UTHROW, 1, HG_KNOCKBACK_SCALING, 0.4);
							set_hitbox_value(AT_UTHROW, 1, HG_BASE_HITPAUSE, 7);
							set_hitbox_value(AT_UTHROW, 1, HG_HITPAUSE_SCALING, 0.5);
							set_hitbox_value(AT_UTHROW, 1, HG_HIT_SFX, asset_get("sfx_swipe_medium2"));
							set_hitbox_value(AT_UTHROW, 1, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_UTHROW, 1, HG_HITSTUN_MULTIPLIER, 1.2);
							set_hitbox_value(AT_UTHROW, 1, HG_VISUAL_EFFECT, 1);
							
							//Smoked
							set_hitbox_value(AT_UTHROW, 2, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_UTHROW, 2, HG_WINDOW, 4);
							set_hitbox_value(AT_UTHROW, 2, HG_LIFETIME, 3);
							set_hitbox_value(AT_UTHROW, 2, HG_HITBOX_X, 12);
							set_hitbox_value(AT_UTHROW, 2, HG_HITBOX_Y, -48);
							set_hitbox_value(AT_UTHROW, 2, HG_WIDTH, 80);
							set_hitbox_value(AT_UTHROW, 2, HG_HEIGHT, 64);
							set_hitbox_value(AT_UTHROW, 2, HG_ANGLE, 90);
							set_hitbox_value(AT_UTHROW, 2, HG_PRIORITY, 3);
							set_hitbox_value(AT_UTHROW, 2, HG_DAMAGE, 12);
							set_hitbox_value(AT_UTHROW, 2, HG_BASE_KNOCKBACK, 8);
							set_hitbox_value(AT_UTHROW, 2, HG_KNOCKBACK_SCALING, 1.05);
							set_hitbox_value(AT_UTHROW, 2, HG_BASE_HITPAUSE, 18);
							set_hitbox_value(AT_UTHROW, 2, HG_HITPAUSE_SCALING, 0.3);
							set_hitbox_value(AT_UTHROW, 2, HG_HIT_SFX, asset_get("sfx_burnconsume"));
							set_hitbox_value(AT_UTHROW, 2, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_UTHROW, 2, HG_HITSTUN_MULTIPLIER, 1.4);
							set_hitbox_value(AT_UTHROW, 2, HG_VISUAL_EFFECT, other.smokeconsume_fx_bot);
							set_hitbox_value(AT_UTHROW, 2, HG_VISUAL_EFFECT_Y_OFFSET, 32);

                    		break;
                    	case AT_NSPECIAL:
                    	    set_attack_value(AT_NSPECIAL, AG_CATEGORY, 2);
                            set_attack_value(AT_NSPECIAL, AG_SPRITE, sprite_get("enemy_100_nspecial"));
                            set_attack_value(AT_NSPECIAL, AG_HURTBOX_SPRITE, sprite_get("enemy_100_nspecial_hurt"));
                            set_attack_value(AT_NSPECIAL, AG_AIR_SPRITE, sprite_get("enemy_100_nspecial_air"));
                            set_attack_value(AT_NSPECIAL, AG_HURTBOX_AIR_SPRITE, sprite_get("enemy_100_nspecial_hurt"));
                            set_attack_value(AT_NSPECIAL, AG_OFF_LEDGE, 1);
                            set_attack_value(AT_NSPECIAL, AG_LANDING_LAG, 22);
                            set_attack_value(AT_NSPECIAL, AG_NUM_WINDOWS, 11);
                            
                            //Grab windows
                            set_window_value(AT_NSPECIAL, 1, AG_WINDOW_LENGTH, 12);
                            set_window_value(AT_NSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 3);
                            set_window_value(AT_NSPECIAL, 1, AG_WINDOW_HAS_SFX, 1);
                            set_window_value(AT_NSPECIAL, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_medium1"));
                            set_window_value(AT_NSPECIAL, 1, AG_WINDOW_SFX_FRAME, 4);
                            set_window_value(AT_NSPECIAL, 1, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
                            set_window_value(AT_NSPECIAL, 1, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.1);
                            set_window_value(AT_NSPECIAL, 1, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.3);
                            
                            set_window_value(AT_NSPECIAL, 2, AG_WINDOW_LENGTH, 3);
                            set_window_value(AT_NSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 1);
                            set_window_value(AT_NSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 3);
                            set_window_value(AT_NSPECIAL, 2, AG_WINDOW_HSPEED, 0.25);
                            set_window_value(AT_NSPECIAL, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
                            set_window_value(AT_NSPECIAL, 2, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.9);
                            set_window_value(AT_NSPECIAL, 2, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.3);
                            
                            set_window_value(AT_NSPECIAL, 3, AG_WINDOW_LENGTH, 28);
                            set_window_value(AT_NSPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 4);
                            set_window_value(AT_NSPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 4);
                            set_window_value(AT_NSPECIAL, 3, AG_WINDOW_HAS_WHIFFLAG, 1);
                            
                            //Successful Grab
                            set_window_value(AT_NSPECIAL, 4, AG_WINDOW_LENGTH, 26);
                            set_window_value(AT_NSPECIAL, 4, AG_WINDOW_ANIM_FRAMES, 6);
                            set_window_value(AT_NSPECIAL, 4, AG_WINDOW_ANIM_FRAME_START, 9);
                            set_window_value(AT_NSPECIAL, 4, AG_WINDOW_INVINCIBILITY, 1);
                            
                            //Idle
                            set_window_value(AT_NSPECIAL, 5, AG_WINDOW_TYPE, 9);
                            set_window_value(AT_NSPECIAL, 5, AG_WINDOW_LENGTH, 32);
                            set_window_value(AT_NSPECIAL, 5, AG_WINDOW_ANIM_FRAMES, 4);
                            set_window_value(AT_NSPECIAL, 5, AG_WINDOW_ANIM_FRAME_START, 15);
                            
                            //Walk
                            set_window_value(AT_NSPECIAL, 6, AG_WINDOW_TYPE, 9);
                            set_window_value(AT_NSPECIAL, 6, AG_WINDOW_LENGTH, 48);
                            set_window_value(AT_NSPECIAL, 6, AG_WINDOW_ANIM_FRAMES, 8);
                            set_window_value(AT_NSPECIAL, 6, AG_WINDOW_ANIM_FRAME_START, 19);
                            set_window_value(AT_NSPECIAL, 6, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
                            set_window_value(AT_NSPECIAL, 6, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.04);
                            
                            //Start Jump
                            set_window_value(AT_NSPECIAL, 7, AG_WINDOW_LENGTH, 5);
                            set_window_value(AT_NSPECIAL, 7, AG_WINDOW_ANIM_FRAMES, 1);
                            set_window_value(AT_NSPECIAL, 7, AG_WINDOW_ANIM_FRAME_START, 27);
                            
                            
                            
                            //Jump
                            set_window_value(AT_NSPECIAL, 9, AG_WINDOW_TYPE, 9);
                            set_window_value(AT_NSPECIAL, 8, AG_WINDOW_LENGTH, 24);
                            set_window_value(AT_NSPECIAL, 8, AG_WINDOW_ANIM_FRAMES, 4);
                            set_window_value(AT_NSPECIAL, 8, AG_WINDOW_ANIM_FRAME_START, 28);
                            set_window_value(AT_NSPECIAL, 8, AG_WINDOW_HAS_SFX, 1);
                            //why wont this work? the world may never know
                            set_window_value(AT_NSPECIAL, 8, AG_WINDOW_SFX, asset_get("sfx_jumpground"));
                            set_window_value(AT_NSPECIAL, 8, AG_WINDOW_SFX_FRAME, 1);
                            
                            
                            
                            //Jump fall
                            set_window_value(AT_NSPECIAL, 9, AG_WINDOW_TYPE, 9);
                            set_window_value(AT_NSPECIAL, 9, AG_WINDOW_LENGTH, 24);
                            set_window_value(AT_NSPECIAL, 9, AG_WINDOW_ANIM_FRAMES, 1);
                            set_window_value(AT_NSPECIAL, 9, AG_WINDOW_ANIM_FRAME_START, 31);
                            
                            //Land
                            set_window_value(AT_NSPECIAL, 10, AG_WINDOW_LENGTH, 5);
                            set_window_value(AT_NSPECIAL, 10, AG_WINDOW_ANIM_FRAMES, 1);
                            set_window_value(AT_NSPECIAL, 10, AG_WINDOW_ANIM_FRAME_START, 27);
                            
                            //Grab Release
                            set_window_value(AT_NSPECIAL, 11, AG_WINDOW_LENGTH, 30);
                            set_window_value(AT_NSPECIAL, 11, AG_WINDOW_ANIM_FRAMES, 6);
                            set_window_value(AT_NSPECIAL, 11, AG_WINDOW_ANIM_FRAME_START, 32);
                            set_window_value(AT_NSPECIAL, 11, AG_WINDOW_VSPEED_TYPE, 2);
                            set_window_value(AT_NSPECIAL, 11, AG_WINDOW_HSPEED, -8);
                            set_window_value(AT_NSPECIAL, 11, AG_WINDOW_HSPEED_TYPE, 2);
                            set_window_value(AT_NSPECIAL, 11, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
                            set_window_value(AT_NSPECIAL, 11, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.7);
                            set_window_value(AT_NSPECIAL, 11, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.7);
                            
                            
                            set_num_hitboxes(AT_NSPECIAL, 1);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_HITBOX_GROUP, -1);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_HITBOX_TYPE, 1);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_WINDOW, 2);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_LIFETIME, 3);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_HITBOX_X, 34 + (96));
                            set_hitbox_value(AT_NSPECIAL, 1, HG_HITBOX_Y, -27);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_WIDTH, 48 + (160));
                            set_hitbox_value(AT_NSPECIAL, 1, HG_HEIGHT, 36);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_SHAPE, 2);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_PRIORITY, 3);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_DAMAGE, 3);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_ANGLE, 90);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_BASE_KNOCKBACK, 3);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_BASE_HITPAUSE, 6);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_HITSTUN_MULTIPLIER, 1.2);
                            set_hitbox_value(AT_NSPECIAL, 1, HG_HIT_SFX, asset_get("sfx_blow_heavy1"));
                            set_hitbox_value(AT_NSPECIAL, 1, HG_IGNORES_PROJECTILES, 1);

                    	    break;
                    	case AT_FSPECIAL:
                    		set_attack_value(AT_FSPECIAL, AG_CATEGORY, 2);
							set_attack_value(AT_FSPECIAL, AG_SPRITE, sprite_get("enemy_100_fspecial"));
							set_attack_value(AT_FSPECIAL, AG_AIR_SPRITE, sprite_get("enemy_100_fspecial_air"));
							set_attack_value(AT_FSPECIAL, AG_HURTBOX_SPRITE, sprite_get("enemy_100_fspecial_hurt"));
							set_attack_value(AT_FSPECIAL, AG_HURTBOX_AIR_SPRITE, sprite_get("enemy_100_fspecial_air_hurt"));
							set_attack_value(AT_FSPECIAL, AG_OFF_LEDGE, 1);
							set_attack_value(AT_FSPECIAL, AG_USES_CUSTOM_GRAVITY, 1);
							
							set_attack_value(AT_FSPECIAL, AG_NUM_WINDOWS, 9);
							
							//Grabbing
							set_window_value(AT_FSPECIAL, 1, AG_WINDOW_LENGTH, 20);
							set_window_value(AT_FSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 5);
							// set_window_value(AT_FSPECIAL, 1, AG_WINDOW_HAS_SFX, 1);
							// set_window_value(AT_FSPECIAL, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_heavy2"));
							// set_window_value(AT_FSPECIAL, 1, AG_WINDOW_SFX_FRAME, 19);
							set_window_value(AT_FSPECIAL, 1, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_FSPECIAL, 1, AG_WINDOW_SFX, asset_get("sfx_zetter_fireball_fire"));
							set_window_value(AT_FSPECIAL, 1, AG_WINDOW_SFX_FRAME, 1);
							set_window_value(AT_FSPECIAL, 1, AG_WINDOW_HSPEED_TYPE, 2);
							set_window_value(AT_FSPECIAL, 1, AG_WINDOW_VSPEED_TYPE, 2);
							set_window_value(AT_FSPECIAL, 1, AG_WINDOW_CUSTOM_GRAVITY, 0.1);
							
							set_window_value(AT_FSPECIAL, 2, AG_WINDOW_LENGTH, 12);
							set_window_value(AT_FSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 6);
							set_window_value(AT_FSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 5);
							set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_FSPECIAL, 2, AG_WINDOW_SFX, asset_get("sfx_swipe_heavy2"));
							set_window_value(AT_FSPECIAL, 2, AG_WINDOW_SFX_FRAME, 1);
							set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED, 15);
							set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_FSPECIAL, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
							set_window_value(AT_FSPECIAL, 2, AG_WINDOW_CUSTOM_GRAVITY, 0.02);
							
							set_window_value(AT_FSPECIAL, 3, AG_WINDOW_LENGTH, 35);
							set_window_value(AT_FSPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 6);
							set_window_value(AT_FSPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 11);
							set_window_value(AT_FSPECIAL, 3, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
							set_window_value(AT_FSPECIAL, 3, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.4);
							set_window_value(AT_FSPECIAL, 3, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.5);
							set_window_value(AT_FSPECIAL, 3, AG_WINDOW_CUSTOM_GRAVITY, 0.55);
							
							//Grab Success
							set_window_value(AT_FSPECIAL, 4, AG_WINDOW_LENGTH, 12);
							set_window_value(AT_FSPECIAL, 4, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_FSPECIAL, 4, AG_WINDOW_ANIM_FRAME_START, 18);
							set_window_value(AT_FSPECIAL, 4, AG_WINDOW_HSPEED, 3);
							set_window_value(AT_FSPECIAL, 4, AG_WINDOW_VSPEED, -6);
							set_window_value(AT_FSPECIAL, 4, AG_WINDOW_HSPEED_TYPE, 2);
							set_window_value(AT_FSPECIAL, 4, AG_WINDOW_VSPEED_TYPE, 2);
							set_window_value(AT_FSPECIAL, 4, AG_WINDOW_CUSTOM_GRAVITY, 0.4);
							
							set_window_value(AT_FSPECIAL, 5, AG_WINDOW_TYPE, 9);
							set_window_value(AT_FSPECIAL, 5, AG_WINDOW_LENGTH, 5);
							set_window_value(AT_FSPECIAL, 5, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_FSPECIAL, 5, AG_WINDOW_ANIM_FRAME_START, 22);
							set_window_value(AT_FSPECIAL, 5, AG_WINDOW_VSPEED, 4.5);
							set_window_value(AT_FSPECIAL, 5, AG_WINDOW_VSPEED_TYPE, 0);
							set_window_value(AT_FSPECIAL, 5, AG_WINDOW_CUSTOM_GRAVITY, 1);
							
							set_window_value(AT_FSPECIAL, 6, AG_WINDOW_LENGTH, 15);
							set_window_value(AT_FSPECIAL, 6, AG_WINDOW_ANIM_FRAMES, 5);
							set_window_value(AT_FSPECIAL, 6, AG_WINDOW_ANIM_FRAME_START, 23);
							set_window_value(AT_FSPECIAL, 6, AG_WINDOW_HSPEED_TYPE, 2);
							set_window_value(AT_FSPECIAL, 6, AG_WINDOW_VSPEED_TYPE, 2);
							set_window_value(AT_FSPECIAL, 6, AG_WINDOW_CUSTOM_GRAVITY, 0.55);
							
							set_window_value(AT_FSPECIAL, 7, AG_WINDOW_LENGTH, 12);
							set_window_value(AT_FSPECIAL, 7, AG_WINDOW_ANIM_FRAMES, 3);
							set_window_value(AT_FSPECIAL, 7, AG_WINDOW_ANIM_FRAME_START, 28);
							set_window_value(AT_FSPECIAL, 7, AG_WINDOW_HSPEED, -1);
							set_window_value(AT_FSPECIAL, 7, AG_WINDOW_VSPEED, -6);
							set_window_value(AT_FSPECIAL, 7, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
							set_window_value(AT_FSPECIAL, 7, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.01);
							set_window_value(AT_FSPECIAL, 7, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.01);
							set_window_value(AT_FSPECIAL, 7, AG_WINDOW_CUSTOM_GRAVITY, 0.2);
							
							//Smoke Consume
							set_window_value(AT_FSPECIAL, 8, AG_WINDOW_LENGTH, 15);
							set_window_value(AT_FSPECIAL, 8, AG_WINDOW_ANIM_FRAMES, 5);
							set_window_value(AT_FSPECIAL, 8, AG_WINDOW_ANIM_FRAME_START, 23);
							set_window_value(AT_FSPECIAL, 8, AG_WINDOW_HSPEED_TYPE, 2);
							set_window_value(AT_FSPECIAL, 8, AG_WINDOW_VSPEED_TYPE, 2);
							set_window_value(AT_FSPECIAL, 8, AG_WINDOW_CUSTOM_GRAVITY, 0.55);
							
							set_window_value(AT_FSPECIAL, 9, AG_WINDOW_LENGTH, 16);
							set_window_value(AT_FSPECIAL, 9, AG_WINDOW_ANIM_FRAMES, 3);
							set_window_value(AT_FSPECIAL, 9, AG_WINDOW_ANIM_FRAME_START, 28);
							set_window_value(AT_FSPECIAL, 9, AG_WINDOW_HSPEED, -1);
							set_window_value(AT_FSPECIAL, 9, AG_WINDOW_VSPEED, -7);
							set_window_value(AT_FSPECIAL, 9, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
							set_window_value(AT_FSPECIAL, 9, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.01);
							set_window_value(AT_FSPECIAL, 9, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.01);
							set_window_value(AT_FSPECIAL, 9, AG_WINDOW_CUSTOM_GRAVITY, 0.2);
							
							set_num_hitboxes(AT_FSPECIAL, 6);
							
							set_hitbox_value(AT_FSPECIAL, 1, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_FSPECIAL, 1, HG_WINDOW, 2);
							set_hitbox_value(AT_FSPECIAL, 1, HG_LIFETIME, 12);
							set_hitbox_value(AT_FSPECIAL, 1, HG_HITBOX_X, 43);
							set_hitbox_value(AT_FSPECIAL, 1, HG_HITBOX_Y, -34);
							set_hitbox_value(AT_FSPECIAL, 1, HG_WIDTH, 42 + ( 24));
							set_hitbox_value(AT_FSPECIAL, 1, HG_HEIGHT, 42 + ( 24));
							set_hitbox_value(AT_FSPECIAL, 1, HG_PRIORITY, 3);
							set_hitbox_value(AT_FSPECIAL, 1, HG_DAMAGE, 3);
							set_hitbox_value(AT_FSPECIAL, 1, HG_ANGLE, 90);
							set_hitbox_value(AT_FSPECIAL, 1, HG_BASE_KNOCKBACK, 3);
							set_hitbox_value(AT_FSPECIAL, 1, HG_BASE_HITPAUSE, 6);
							set_hitbox_value(AT_FSPECIAL, 1, HG_HITSTUN_MULTIPLIER, 1.2);
							set_hitbox_value(AT_FSPECIAL, 1, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_FSPECIAL, 1, HG_HIT_SFX, asset_get("sfx_blow_heavy1"));
							
							set_hitbox_value(AT_FSPECIAL, 2, HG_PARENT_HITBOX, 1);
							set_hitbox_value(AT_FSPECIAL, 2, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_FSPECIAL, 2, HG_WINDOW, 2);
							set_hitbox_value(AT_FSPECIAL, 2, HG_LIFETIME, 3);
							set_hitbox_value(AT_FSPECIAL, 2, HG_HITBOX_X, 9);
							set_hitbox_value(AT_FSPECIAL, 2, HG_HITBOX_Y, -31);
							set_hitbox_value(AT_FSPECIAL, 2, HG_WIDTH, 32 + ( 112));
							set_hitbox_value(AT_FSPECIAL, 2, HG_HEIGHT, 32 + ( 112));
							set_hitbox_value(AT_FSPECIAL, 2, HG_PRIORITY, 1);
							
							//Normal
							set_hitbox_value(AT_FSPECIAL, 3, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_FSPECIAL, 3, HG_WINDOW, 6);
							set_hitbox_value(AT_FSPECIAL, 3, HG_WINDOW_CREATION_FRAME, 3);
							set_hitbox_value(AT_FSPECIAL, 3, HG_LIFETIME, 3);
							set_hitbox_value(AT_FSPECIAL, 3, HG_HITBOX_X, 16);
							set_hitbox_value(AT_FSPECIAL, 3, HG_HITBOX_Y, -16);
							set_hitbox_value(AT_FSPECIAL, 3, HG_WIDTH, 68);
							set_hitbox_value(AT_FSPECIAL, 3, HG_HEIGHT, 32);
							set_hitbox_value(AT_FSPECIAL, 3, HG_SHAPE, 2);
							set_hitbox_value(AT_FSPECIAL, 3, HG_PRIORITY, 4);
							set_hitbox_value(AT_FSPECIAL, 3, HG_DAMAGE, 4);
							set_hitbox_value(AT_FSPECIAL, 3, HG_ANGLE, 100);
							set_hitbox_value(AT_FSPECIAL, 3, HG_BASE_KNOCKBACK, 3);
							set_hitbox_value(AT_FSPECIAL, 3, HG_BASE_HITPAUSE, 6);
							set_hitbox_value(AT_FSPECIAL, 3, HG_HITPAUSE_SCALING, 0.4);
							set_hitbox_value(AT_FSPECIAL, 3, HG_HITSTUN_MULTIPLIER, 1.2);
							set_hitbox_value(AT_FSPECIAL, 3, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_FSPECIAL, 3, HG_HITBOX_GROUP, 1);
							set_hitbox_value(AT_FSPECIAL, 3, HG_HIT_SFX, asset_get("sfx_blow_heavy2"));
							set_hitbox_value(AT_FSPECIAL, 3, HG_TECHABLE, 2);
							
							set_hitbox_value(AT_FSPECIAL, 4, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_FSPECIAL, 4, HG_WINDOW, 6);
							set_hitbox_value(AT_FSPECIAL, 4, HG_WINDOW_CREATION_FRAME, 14);
							set_hitbox_value(AT_FSPECIAL, 4, HG_LIFETIME, 3);
							set_hitbox_value(AT_FSPECIAL, 4, HG_HITBOX_X, 16);
							set_hitbox_value(AT_FSPECIAL, 4, HG_HITBOX_Y, -26);
							set_hitbox_value(AT_FSPECIAL, 4, HG_WIDTH, 56);
							set_hitbox_value(AT_FSPECIAL, 4, HG_HEIGHT, 56);
							set_hitbox_value(AT_FSPECIAL, 4, HG_PRIORITY, 4);
							set_hitbox_value(AT_FSPECIAL, 4, HG_DAMAGE, 7);
							set_hitbox_value(AT_FSPECIAL, 4, HG_ANGLE, 70);
							set_hitbox_value(AT_FSPECIAL, 4, HG_BASE_KNOCKBACK, 10 + ( 2));
							set_hitbox_value(AT_FSPECIAL, 4, HG_KNOCKBACK_SCALING, 0.35);
							set_hitbox_value(AT_FSPECIAL, 4, HG_BASE_HITPAUSE, 1);
							set_hitbox_value(AT_FSPECIAL, 4, HG_HITSTUN_MULTIPLIER, 1.2);
							set_hitbox_value(AT_FSPECIAL, 4, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_FSPECIAL, 4, HG_HITBOX_GROUP, 2);
							set_hitbox_value(AT_FSPECIAL, 4, HG_EXTRA_CAMERA_SHAKE, -1);
							set_hitbox_value(AT_FSPECIAL, 4, HG_TECHABLE, 1);
							
							//Smoked
							set_hitbox_value(AT_FSPECIAL, 5, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_FSPECIAL, 5, HG_WINDOW, 8);
							set_hitbox_value(AT_FSPECIAL, 5, HG_WINDOW_CREATION_FRAME, 3);
							set_hitbox_value(AT_FSPECIAL, 5, HG_LIFETIME, 3);
							set_hitbox_value(AT_FSPECIAL, 5, HG_HITBOX_X, 16);
							set_hitbox_value(AT_FSPECIAL, 5, HG_HITBOX_Y, -14);
							set_hitbox_value(AT_FSPECIAL, 5, HG_WIDTH, 68);
							set_hitbox_value(AT_FSPECIAL, 5, HG_HEIGHT, 24);
							set_hitbox_value(AT_FSPECIAL, 5, HG_SHAPE, 2);
							set_hitbox_value(AT_FSPECIAL, 5, HG_PRIORITY, 4);
							set_hitbox_value(AT_FSPECIAL, 5, HG_DAMAGE, 4);
							set_hitbox_value(AT_FSPECIAL, 5, HG_ANGLE, 100);
							set_hitbox_value(AT_FSPECIAL, 5, HG_BASE_KNOCKBACK, 3);
							set_hitbox_value(AT_FSPECIAL, 5, HG_BASE_HITPAUSE, 8);
							set_hitbox_value(AT_FSPECIAL, 5, HG_HITPAUSE_SCALING, 0.4);
							set_hitbox_value(AT_FSPECIAL, 5, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_FSPECIAL, 5, HG_HITBOX_GROUP, 1);
							set_hitbox_value(AT_FSPECIAL, 5, HG_HIT_SFX, asset_get("sfx_burnconsume"));
							set_hitbox_value(AT_FSPECIAL, 5, HG_TECHABLE, 1);
							set_hitbox_value(AT_FSPECIAL, 5, HG_VISUAL_EFFECT, other.smokeconsume_fx_bot);
							set_hitbox_value(AT_FSPECIAL, 5, HG_VISUAL_EFFECT_Y_OFFSET, 32);
							
							set_hitbox_value(AT_FSPECIAL, 6, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_FSPECIAL, 6, HG_WINDOW, 8);
							set_hitbox_value(AT_FSPECIAL, 6, HG_WINDOW_CREATION_FRAME, 14);
							set_hitbox_value(AT_FSPECIAL, 6, HG_LIFETIME, 3);
							set_hitbox_value(AT_FSPECIAL, 6, HG_HITBOX_X, 16);
							set_hitbox_value(AT_FSPECIAL, 6, HG_HITBOX_Y, -26);
							set_hitbox_value(AT_FSPECIAL, 6, HG_WIDTH, 56);
							set_hitbox_value(AT_FSPECIAL, 6, HG_HEIGHT, 56);
							set_hitbox_value(AT_FSPECIAL, 6, HG_PRIORITY, 4);
							set_hitbox_value(AT_FSPECIAL, 6, HG_DAMAGE, 12);
							set_hitbox_value(AT_FSPECIAL, 6, HG_ANGLE, 45);
							set_hitbox_value(AT_FSPECIAL, 6, HG_EXTRA_CAMERA_SHAKE, -1);
							set_hitbox_value(AT_FSPECIAL, 6, HG_BASE_KNOCKBACK, 7 + ( 3));
							set_hitbox_value(AT_FSPECIAL, 6, HG_KNOCKBACK_SCALING, 1);
							set_hitbox_value(AT_FSPECIAL, 6, HG_HITSTUN_MULTIPLIER, 1.2);
							set_hitbox_value(AT_FSPECIAL, 6, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_FSPECIAL, 6, HG_HITBOX_GROUP, 2);
							set_hitbox_value(AT_FSPECIAL, 6, HG_TECHABLE, 1);
                    		break;
                    	case AT_DSPECIAL:
                    	    set_attack_value(AT_DSPECIAL, AG_CATEGORY, 2);
                            set_attack_value(AT_DSPECIAL, AG_SPRITE, sprite_get("enemy_100_dspecial"));
                            set_attack_value(AT_DSPECIAL, AG_HURTBOX_SPRITE, sprite_get("enemy_100_dspecial_hurt"));
                            set_attack_value(AT_DSPECIAL, AG_AIR_SPRITE, sprite_get("enemy_100_dspecial_air"));
                            set_attack_value(AT_DSPECIAL, AG_HURTBOX_AIR_SPRITE, sprite_get("enemy_100_dspecial_air_hurt"));
                            set_attack_value(AT_DSPECIAL, AG_LANDING_LAG, 6);
                            set_attack_value(AT_DSPECIAL, AG_NUM_WINDOWS, 12);
                            
                            set_window_value(AT_DSPECIAL, 1, AG_WINDOW_LENGTH, 14); //- (has_rune("F") * 10));
                            set_window_value(AT_DSPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 3);
                            
                            set_window_value(AT_DSPECIAL, 2, AG_WINDOW_LENGTH, 20); //- (has_rune("F") * 10));
                            set_window_value(AT_DSPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 4);
                            set_window_value(AT_DSPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 3);
                            set_window_value(AT_DSPECIAL, 2, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
                            set_window_value(AT_DSPECIAL, 2, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.7);
                            set_window_value(AT_DSPECIAL, 2, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.2);
                            
                            set_window_value(AT_DSPECIAL, 3, AG_WINDOW_LENGTH, 5);
                            set_window_value(AT_DSPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 1);
                            set_window_value(AT_DSPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 7);
                            set_window_value(AT_DSPECIAL, 3, AG_WINDOW_HAS_SFX, 1);
                            set_window_value(AT_DSPECIAL, 3, AG_WINDOW_SFX,  sound_get("sfx_ryk_steam_burst"));
                            set_window_value(AT_DSPECIAL, 3, AG_WINDOW_SFX_FRAME, 3);
                            set_window_value(AT_DSPECIAL, 3, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
                            set_window_value(AT_DSPECIAL, 3, AG_WINDOW_CUSTOM_GROUND_FRICTION, 0.7);
                            set_window_value(AT_DSPECIAL, 3, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.2);
                            set_window_value(AT_DSPECIAL, 3, AG_WINDOW_VSPEED_TYPE, 2);
                            
                            set_window_value(AT_DSPECIAL, 4, AG_WINDOW_LENGTH, 32);
                            set_window_value(AT_DSPECIAL, 4, AG_WINDOW_ANIM_FRAMES, 5);
                            set_window_value(AT_DSPECIAL, 4, AG_WINDOW_ANIM_FRAME_START, 8);
                            set_window_value(AT_DSPECIAL, 4, AG_WINDOW_HAS_WHIFFLAG, 1);
                            
                            set_window_value(AT_DSPECIAL, 5, AG_WINDOW_LENGTH, 5);
                            set_window_value(AT_DSPECIAL, 5, AG_WINDOW_ANIM_FRAMES, 1);
                            set_window_value(AT_DSPECIAL, 5, AG_WINDOW_ANIM_FRAME_START, 7);
                            set_window_value(AT_DSPECIAL, 5, AG_WINDOW_HAS_SFX, 1);
                            set_window_value(AT_DSPECIAL, 5, AG_WINDOW_SFX,  sound_get("sfx_ryk_steam_burst"));
                            set_window_value(AT_DSPECIAL, 5, AG_WINDOW_SFX_FRAME, 3);
                            set_window_value(AT_DSPECIAL, 5, AG_WINDOW_HSPEED_TYPE, 2);
                            set_window_value(AT_DSPECIAL, 5, AG_WINDOW_VSPEED_TYPE, 2);
                            
                            set_window_value(AT_DSPECIAL, 6, AG_WINDOW_LENGTH, 40);
                            set_window_value(AT_DSPECIAL, 6, AG_WINDOW_ANIM_FRAMES, 5);
                            set_window_value(AT_DSPECIAL, 6, AG_WINDOW_ANIM_FRAME_START, 8);
                            set_window_value(AT_DSPECIAL, 6, AG_WINDOW_HAS_WHIFFLAG, 1);
                            set_window_value(AT_DSPECIAL, 6, AG_WINDOW_CUSTOM_GRAVITY, 0.4);
                            
                            
                            
                            set_window_value(AT_DSPECIAL, 7, AG_WINDOW_LENGTH, 10);
                            set_window_value(AT_DSPECIAL, 7, AG_WINDOW_ANIM_FRAMES, 5);
                            set_window_value(AT_DSPECIAL, 7, AG_WINDOW_ANIM_FRAME_START, 8);
                            set_window_value(AT_DSPECIAL, 7, AG_WINDOW_HAS_WHIFFLAG, 1);
                            set_window_value(AT_DSPECIAL, 7, AG_WINDOW_VSPEED_TYPE, 1);
                            set_window_value(AT_DSPECIAL, 7, AG_WINDOW_HSPEED_TYPE, 2);
                            //set_window_value(AT_DSPECIAL, 7, AG_WINDOW_CUSTOM_GRAVITY, 0.4);
                            set_window_value(AT_DSPECIAL, 7, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
                            set_window_value(AT_DSPECIAL, 7, AG_WINDOW_CUSTOM_GROUND_FRICTION, .02);
                            set_window_value(AT_DSPECIAL, 7, AG_WINDOW_HAS_SFX, 1);
                            set_window_value(AT_DSPECIAL, 7, AG_WINDOW_SFX,  asset_get("sfx_swipe_heavy2"));
                            
                            
                            set_num_hitboxes(AT_DSPECIAL, 2);
                            
                            set_hitbox_value(AT_DSPECIAL, 1, HG_HITBOX_TYPE, 1);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_WINDOW, 3);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_LIFETIME, 3);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_HITBOX_X, 0);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_HITBOX_Y, -46);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_WIDTH, 112);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_HEIGHT, 112);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_PRIORITY, 1);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_DAMAGE, 2);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_ANGLE, 90);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_BASE_KNOCKBACK, 8.5);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_KNOCKBACK_SCALING, 0.3);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_BASE_HITPAUSE, 3);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_HIT_SFX, asset_get("sfx_forsburn_reappear_hit"));
                            set_hitbox_value(AT_DSPECIAL, 1, HG_ANGLE_FLIPPER, 3);
                            set_hitbox_value(AT_DSPECIAL, 1, HG_HITSTUN_MULTIPLIER, 0.7);
                            
                            set_hitbox_value(AT_DSPECIAL, 2, HG_HITBOX_TYPE, 1);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_WINDOW, 5);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_LIFETIME, 3);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_HITBOX_X, 0);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_HITBOX_Y, -46);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_WIDTH, 144);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_HEIGHT, 144);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_PRIORITY, 1);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_DAMAGE, 10);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_ANGLE, 90);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_BASE_KNOCKBACK, 9);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_KNOCKBACK_SCALING, 0.4);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_BASE_HITPAUSE, 8);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_HITPAUSE_SCALING, 0.6);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_HIT_SFX, asset_get("sfx_forsburn_reappear_hit"));
                            set_hitbox_value(AT_DSPECIAL, 2, HG_ANGLE_FLIPPER, 3);
                            set_hitbox_value(AT_DSPECIAL, 2, HG_HITSTUN_MULTIPLIER, 0.7);
                    		break;
                    	case AT_USPECIAL:
                    		set_attack_value(AT_USPECIAL, AG_CATEGORY, 2);
							set_attack_value(AT_USPECIAL, AG_SPRITE, sprite_get("enemy_100_uspecial"));
							set_attack_value(AT_USPECIAL, AG_HURTBOX_SPRITE, sprite_get("enemy_100_uspecial_hurt"));
							set_attack_value(AT_USPECIAL, AG_HAS_LANDING_LAG, 1);
							set_attack_value(AT_USPECIAL, AG_OFF_LEDGE, 1);
							set_attack_value(AT_USPECIAL, AG_LANDING_LAG, 12);
							set_attack_value(AT_USPECIAL, AG_USES_CUSTOM_GRAVITY, 1);
							
							set_attack_value(AT_USPECIAL, AG_NUM_WINDOWS, 11);
							set_window_value(AT_USPECIAL, 1, AG_WINDOW_LENGTH, 8);
							set_window_value(AT_USPECIAL, 1, AG_WINDOW_ANIM_FRAMES, 5);
							set_window_value(AT_USPECIAL, 1, AG_WINDOW_ANIM_FRAME_START, 1);
							set_window_value(AT_USPECIAL, 1, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_USPECIAL, 2, AG_WINDOW_VSPEED, -4);
							set_window_value(AT_USPECIAL, 1, AG_WINDOW_VSPEED_TYPE, 1);
							set_window_value(AT_USPECIAL, 1, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_USPECIAL, 1, AG_WINDOW_SFX, asset_get("sfx_zetter_upb_hit"));
							set_window_value(AT_USPECIAL, 1, AG_WINDOW_SFX_FRAME, 7);
							
							set_window_value(AT_USPECIAL, 2, AG_WINDOW_LENGTH, 12);
							set_window_value(AT_USPECIAL, 2, AG_WINDOW_ANIM_FRAMES, 3);
							set_window_value(AT_USPECIAL, 2, AG_WINDOW_ANIM_FRAME_START, 6);
							set_window_value(AT_USPECIAL, 2, AG_WINDOW_HSPEED, 2);
							set_window_value(AT_USPECIAL, 2, AG_WINDOW_VSPEED, -12);
							set_window_value(AT_USPECIAL, 2, AG_WINDOW_HSPEED_TYPE, 2);
							set_window_value(AT_USPECIAL, 2, AG_WINDOW_VSPEED_TYPE, 1);
							set_window_value(AT_USPECIAL, 2, AG_WINDOW_CUSTOM_GRAVITY, 0.55);
							
							set_window_value(AT_USPECIAL, 3, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_USPECIAL, 3, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_USPECIAL, 3, AG_WINDOW_ANIM_FRAME_START, 8);
							set_window_value(AT_USPECIAL, 3, AG_WINDOW_VSPEED, -4);
							set_window_value(AT_USPECIAL, 3, AG_WINDOW_VSPEED_TYPE, 2);
							set_window_value(AT_USPECIAL, 3, AG_WINDOW_CUSTOM_GRAVITY, 0.35);
							set_window_value(AT_USPECIAL, 3, AG_WINDOW_HAS_WHIFFLAG, 1);
							
							set_window_value(AT_USPECIAL, 4, AG_WINDOW_LENGTH, 12);
							set_window_value(AT_USPECIAL, 4, AG_WINDOW_ANIM_FRAMES, 3);
							set_window_value(AT_USPECIAL, 4, AG_WINDOW_ANIM_FRAME_START, 9);
							set_window_value(AT_USPECIAL, 4, AG_WINDOW_CUSTOM_GRAVITY, 0.2);
							set_window_value(AT_USPECIAL, 4, AG_WINDOW_TYPE, 7);
							
							set_window_value(AT_USPECIAL, 5, AG_WINDOW_TYPE, 9);
							set_window_value(AT_USPECIAL, 5, AG_WINDOW_LENGTH, 4);
							set_window_value(AT_USPECIAL, 5, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_USPECIAL, 5, AG_WINDOW_ANIM_FRAME_START, 12);
							set_window_value(AT_USPECIAL, 5, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_USPECIAL, 5, AG_WINDOW_VSPEED_TYPE, 1);
							set_window_value(AT_USPECIAL, 5, AG_WINDOW_INVINCIBILITY, 2);
							set_window_value(AT_USPECIAL, 5, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_USPECIAL, 5, AG_WINDOW_SFX, asset_get("sfx_ell_small_missile_fire"));
							set_window_value(AT_USPECIAL, 5, AG_WINDOW_SFX_FRAME, 3);
							
							set_window_value(AT_USPECIAL, 6, AG_WINDOW_LENGTH, 5);
							set_window_value(AT_USPECIAL, 6, AG_WINDOW_ANIM_FRAMES, 2);
							set_window_value(AT_USPECIAL, 6, AG_WINDOW_ANIM_FRAME_START, 16);
							set_window_value(AT_USPECIAL, 6, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_USPECIAL, 6, AG_WINDOW_VSPEED_TYPE, 1);
							
							set_window_value(AT_USPECIAL, 7, AG_WINDOW_LENGTH, 2);
							set_window_value(AT_USPECIAL, 7, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_USPECIAL, 7, AG_WINDOW_ANIM_FRAME_START, 19);
							set_window_value(AT_USPECIAL, 7, AG_WINDOW_HSPEED, -2);
							set_window_value(AT_USPECIAL, 7, AG_WINDOW_VSPEED, -5);
							set_window_value(AT_USPECIAL, 7, AG_WINDOW_HSPEED_TYPE, 2);
							set_window_value(AT_USPECIAL, 7, AG_WINDOW_VSPEED_TYPE, 2);
							
							set_window_value(AT_USPECIAL, 8, AG_WINDOW_LENGTH, 24);
							set_window_value(AT_USPECIAL, 8, AG_WINDOW_ANIM_FRAMES, 5);
							set_window_value(AT_USPECIAL, 8, AG_WINDOW_ANIM_FRAME_START, 20);
							set_window_value(AT_USPECIAL, 8, AG_WINDOW_CUSTOM_GRAVITY, 0.1);
							
							set_window_value(AT_USPECIAL, 9, AG_WINDOW_LENGTH, 5);
							set_window_value(AT_USPECIAL, 9, AG_WINDOW_ANIM_FRAMES, 2);
							set_window_value(AT_USPECIAL, 9, AG_WINDOW_ANIM_FRAME_START, 16);
							set_window_value(AT_USPECIAL, 9, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_USPECIAL, 9, AG_WINDOW_VSPEED_TYPE, 1);
							
							set_window_value(AT_USPECIAL, 10, AG_WINDOW_LENGTH, 2);
							set_window_value(AT_USPECIAL, 10, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_USPECIAL, 10, AG_WINDOW_ANIM_FRAME_START, 19);
							set_window_value(AT_USPECIAL, 10, AG_WINDOW_HSPEED, -1);
							set_window_value(AT_USPECIAL, 10, AG_WINDOW_VSPEED, -3.5);
							set_window_value(AT_USPECIAL, 10, AG_WINDOW_HSPEED_TYPE, 2);
							set_window_value(AT_USPECIAL, 10, AG_WINDOW_VSPEED_TYPE, 2);
							
							set_window_value(AT_USPECIAL, 11, AG_WINDOW_LENGTH, 32);
							set_window_value(AT_USPECIAL, 11, AG_WINDOW_ANIM_FRAMES, 5);
							set_window_value(AT_USPECIAL, 11, AG_WINDOW_ANIM_FRAME_START, 20);
							set_window_value(AT_USPECIAL, 11, AG_WINDOW_CUSTOM_GRAVITY, 0.1);
							
							
							set_num_hitboxes(AT_USPECIAL, 7);
							set_hitbox_value(AT_USPECIAL, 1, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_USPECIAL, 1, HG_WINDOW, 2);
							set_hitbox_value(AT_USPECIAL, 1, HG_LIFETIME, 3);
							set_hitbox_value(AT_USPECIAL, 1, HG_HITBOX_X, 40);
							set_hitbox_value(AT_USPECIAL, 1, HG_HITBOX_Y, -48);
							set_hitbox_value(AT_USPECIAL, 1, HG_WIDTH, 68 + ( 48));
							set_hitbox_value(AT_USPECIAL, 1, HG_HEIGHT, 48 + ( 48));
							set_hitbox_value(AT_USPECIAL, 1, HG_PRIORITY, 3);
							set_hitbox_value(AT_USPECIAL, 1, HG_DAMAGE, 3);
							set_hitbox_value(AT_USPECIAL, 1, HG_ANGLE, 75);
							set_hitbox_value(AT_USPECIAL, 1, HG_BASE_KNOCKBACK, 7);
							set_hitbox_value(AT_USPECIAL, 1, HG_KNOCKBACK_SCALING, 0.9);
							set_hitbox_value(AT_USPECIAL, 1, HG_BASE_HITPAUSE, 7);
							set_hitbox_value(AT_USPECIAL, 1, HG_HITPAUSE_SCALING, 0.8);
							set_hitbox_value(AT_USPECIAL, 1, HG_HIT_SFX, asset_get("sfx_blow_heavy1"));
							set_hitbox_value(AT_USPECIAL, 1, HG_TECHABLE, 1);
							set_hitbox_value(AT_USPECIAL, 1, HG_THROWS_ROCK, 2);
							set_hitbox_value(AT_USPECIAL, 1, HG_EXTRA_CAMERA_SHAKE, -1);
							
							set_hitbox_value(AT_USPECIAL, 2, HG_PARENT_HITBOX, 1);
							set_hitbox_value(AT_USPECIAL, 2, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_USPECIAL, 2, HG_WINDOW, 2);
							set_hitbox_value(AT_USPECIAL, 2, HG_WINDOW_CREATION_FRAME, 4);
							set_hitbox_value(AT_USPECIAL, 2, HG_LIFETIME, 6);
							set_hitbox_value(AT_USPECIAL, 2, HG_HITBOX_X, 32);
							set_hitbox_value(AT_USPECIAL, 2, HG_HITBOX_Y, -64);
							set_hitbox_value(AT_USPECIAL, 2, HG_WIDTH, 44 + ( 112));
							set_hitbox_value(AT_USPECIAL, 2, HG_HEIGHT, 48 + ( 112));
							
							set_hitbox_value(AT_USPECIAL, 3, HG_PARENT_HITBOX, 1);
							set_hitbox_value(AT_USPECIAL, 3, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_USPECIAL, 3, HG_WINDOW, 2);
							set_hitbox_value(AT_USPECIAL, 3, HG_WINDOW_CREATION_FRAME, 8);
							set_hitbox_value(AT_USPECIAL, 3, HG_LIFETIME, 6);
							set_hitbox_value(AT_USPECIAL, 3, HG_HITBOX_X, 32);
							set_hitbox_value(AT_USPECIAL, 3, HG_HITBOX_Y, -64);
							set_hitbox_value(AT_USPECIAL, 3, HG_WIDTH, 44 + ( 112));
							set_hitbox_value(AT_USPECIAL, 3, HG_HEIGHT, 48 + ( 112));
							
							set_hitbox_value(AT_USPECIAL, 4, HG_PARENT_HITBOX, 1);
							set_hitbox_value(AT_USPECIAL, 4, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_USPECIAL, 4, HG_WINDOW, 3);
							set_hitbox_value(AT_USPECIAL, 4, HG_LIFETIME, 1);
							set_hitbox_value(AT_USPECIAL, 4, HG_HITBOX_X, 32);
							set_hitbox_value(AT_USPECIAL, 4, HG_HITBOX_Y, -72);
							set_hitbox_value(AT_USPECIAL, 4, HG_WIDTH, 60);
							set_hitbox_value(AT_USPECIAL, 4, HG_HEIGHT, 60);
							set_hitbox_value(AT_USPECIAL, 4, HG_DAMAGE, 7);
							
							set_hitbox_value(AT_USPECIAL, 5, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_USPECIAL, 5, HG_WINDOW, 5);
							set_hitbox_value(AT_USPECIAL, 5, HG_LIFETIME, 3);
							set_hitbox_value(AT_USPECIAL, 5, HG_HITBOX_X, 42);
							set_hitbox_value(AT_USPECIAL, 5, HG_HITBOX_Y, -43);
							set_hitbox_value(AT_USPECIAL, 5, HG_WIDTH, 56);
							set_hitbox_value(AT_USPECIAL, 5, HG_HEIGHT, 56);
							set_hitbox_value(AT_USPECIAL, 5, HG_PRIORITY, 2);
							set_hitbox_value(AT_USPECIAL, 5, HG_DAMAGE, 1);
							set_hitbox_value(AT_USPECIAL, 5, HG_ANGLE, 65);
							set_hitbox_value(AT_USPECIAL, 5, HG_BASE_KNOCKBACK, 5);
							set_hitbox_value(AT_USPECIAL, 5, HG_BASE_HITPAUSE, 5);
							set_hitbox_value(AT_USPECIAL, 5, HG_VISUAL_EFFECT, 3);
							set_hitbox_value(AT_USPECIAL, 5, HG_HITBOX_GROUP, -1);
							set_hitbox_value(AT_USPECIAL, 5, HG_EXTRA_CAMERA_SHAKE, -1);
							
							set_hitbox_value(AT_USPECIAL, 6, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_USPECIAL, 6, HG_WINDOW, 6);
							set_hitbox_value(AT_USPECIAL, 6, HG_WINDOW_CREATION_FRAME, 2);
							set_hitbox_value(AT_USPECIAL, 6, HG_LIFETIME, 3);
							set_hitbox_value(AT_USPECIAL, 6, HG_HITBOX_X, 37);
							set_hitbox_value(AT_USPECIAL, 6, HG_HITBOX_Y, -42);
							set_hitbox_value(AT_USPECIAL, 6, HG_WIDTH, 76);
							set_hitbox_value(AT_USPECIAL, 6, HG_HEIGHT, 76);
							set_hitbox_value(AT_USPECIAL, 6, HG_PRIORITY, 2);
							set_hitbox_value(AT_USPECIAL, 6, HG_DAMAGE, 4 + ( 4));
							set_hitbox_value(AT_USPECIAL, 6, HG_ANGLE, 361);
							set_hitbox_value(AT_USPECIAL, 6, HG_BASE_KNOCKBACK, 5);
							set_hitbox_value(AT_USPECIAL, 6, HG_KNOCKBACK_SCALING, 1.08);
							set_hitbox_value(AT_USPECIAL, 6, HG_EFFECT, 9);
							set_hitbox_value(AT_USPECIAL, 6, HG_BASE_HITPAUSE, 18);
							set_hitbox_value(AT_USPECIAL, 6, HG_VISUAL_EFFECT, 148);
							set_hitbox_value(AT_USPECIAL, 6, HG_HIT_SFX,  asset_get("sfx_zetter_downb"));
							set_hitbox_value(AT_USPECIAL, 6, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_USPECIAL, 6, HG_HITBOX_GROUP, 1);
							
							set_hitbox_value(AT_USPECIAL, 7, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_USPECIAL, 7, HG_WINDOW, 9);
							set_hitbox_value(AT_USPECIAL, 7, HG_WINDOW_CREATION_FRAME, 2);
							set_hitbox_value(AT_USPECIAL, 7, HG_LIFETIME, 3);
							set_hitbox_value(AT_USPECIAL, 7, HG_HITBOX_X, 37);
							set_hitbox_value(AT_USPECIAL, 7, HG_HITBOX_Y, -42);
							set_hitbox_value(AT_USPECIAL, 7, HG_WIDTH, 76);
							set_hitbox_value(AT_USPECIAL, 7, HG_HEIGHT, 76);
							set_hitbox_value(AT_USPECIAL, 7, HG_PRIORITY, 2);
							set_hitbox_value(AT_USPECIAL, 7, HG_DAMAGE, 6 + ( 4));
							set_hitbox_value(AT_USPECIAL, 7, HG_ANGLE, 55);
							set_hitbox_value(AT_USPECIAL, 7, HG_BASE_KNOCKBACK, 6);
							set_hitbox_value(AT_USPECIAL, 7, HG_KNOCKBACK_SCALING, 1.2);
							set_hitbox_value(AT_USPECIAL, 7, HG_EFFECT, 9);
							set_hitbox_value(AT_USPECIAL, 7, HG_BASE_HITPAUSE, 8);
							set_hitbox_value(AT_USPECIAL, 7, HG_HITPAUSE_SCALING, 1);
							set_hitbox_value(AT_USPECIAL, 7, HG_VISUAL_EFFECT, other.smokeconsume_fx_bot);
							set_hitbox_value(AT_USPECIAL, 7, HG_VISUAL_EFFECT_Y_OFFSET, 64);
							set_hitbox_value(AT_USPECIAL, 7, HG_HIT_SFX,  asset_get("sfx_burnconsume"));
							set_hitbox_value(AT_USPECIAL, 7, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_USPECIAL, 7, HG_HITBOX_GROUP, 1);
                    		break;
                    	case AT_NAIR:
                    		set_attack_value(AT_NAIR, AG_CATEGORY, 1);
							set_attack_value(AT_NAIR, AG_SPRITE, sprite_get("enemy_100_nair"));
							set_attack_value(AT_NAIR, AG_HURTBOX_SPRITE, sprite_get("enemy_100_nair_hurt"));
							set_attack_value(AT_NAIR, AG_HAS_LANDING_LAG, 1);
							set_attack_value(AT_NAIR, AG_LANDING_LAG, 5);
							set_attack_value(AT_NAIR, AG_NUM_WINDOWS, 6);
							
							set_window_value(AT_NAIR, 1, AG_WINDOW_LENGTH, 7);
							set_window_value(AT_NAIR, 1, AG_WINDOW_ANIM_FRAMES, 3);
							set_window_value(AT_NAIR, 1, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_NAIR, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_medium1"));
							set_window_value(AT_NAIR, 1, AG_WINDOW_SFX_FRAME, 4);
							
							set_window_value(AT_NAIR, 2, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_NAIR, 2, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_NAIR, 2, AG_WINDOW_ANIM_FRAME_START, 3);
							
							set_window_value(AT_NAIR, 3, AG_WINDOW_LENGTH, 2);
							set_window_value(AT_NAIR, 3, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_NAIR, 3, AG_WINDOW_ANIM_FRAME_START, 4);
							
							set_window_value(AT_NAIR, 4, AG_WINDOW_LENGTH, 4);
							set_window_value(AT_NAIR, 4, AG_WINDOW_ANIM_FRAMES, 2);
							set_window_value(AT_NAIR, 4, AG_WINDOW_ANIM_FRAME_START, 5);
							set_window_value(AT_NAIR, 4, AG_WINDOW_VSPEED, -1);
							set_window_value(AT_NAIR, 4, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_NAIR, 4, AG_WINDOW_SFX, asset_get("sfx_swipe_medium2"));
							set_window_value(AT_NAIR, 4, AG_WINDOW_SFX_FRAME, 2);
							
							set_window_value(AT_NAIR, 5, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_NAIR, 5, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_NAIR, 5, AG_WINDOW_ANIM_FRAME_START, 7);
							set_window_value(AT_NAIR, 5, AG_WINDOW_HITPAUSE_FRAME, 8);
							
							set_window_value(AT_NAIR, 6, AG_WINDOW_LENGTH, 15);
							set_window_value(AT_NAIR, 6, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_NAIR, 6, AG_WINDOW_ANIM_FRAME_START, 8);
							set_window_value(AT_NAIR, 6, AG_WINDOW_HAS_WHIFFLAG, 1);
							
							
							set_num_hitboxes(AT_NAIR, 2);
							
							set_hitbox_value(AT_NAIR, 1, HG_HITBOX_GROUP, 0);
							set_hitbox_value(AT_NAIR, 1, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_NAIR, 1, HG_WINDOW, 2);
							set_hitbox_value(AT_NAIR, 1, HG_LIFETIME, 3);
							set_hitbox_value(AT_NAIR, 1, HG_HITBOX_X, 42);
							set_hitbox_value(AT_NAIR, 1, HG_HITBOX_Y, -30);
							set_hitbox_value(AT_NAIR, 1, HG_WIDTH, 70);
							set_hitbox_value(AT_NAIR, 1, HG_HEIGHT, 48);
							set_hitbox_value(AT_NAIR, 1, HG_PRIORITY, 2);
							set_hitbox_value(AT_NAIR, 1, HG_DAMAGE, 5);
							set_hitbox_value(AT_NAIR, 1, HG_ANGLE, 75);
							set_hitbox_value(AT_NAIR, 1, HG_BASE_KNOCKBACK, 5);
							set_hitbox_value(AT_NAIR, 1, HG_BASE_HITPAUSE, 5);
							set_hitbox_value(AT_NAIR, 1, HG_HIT_SFX, asset_get("sfx_blow_medium1"));
							
							set_hitbox_value(AT_NAIR, 2, HG_HITBOX_GROUP, 1);
							set_hitbox_value(AT_NAIR, 2, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_NAIR, 2, HG_WINDOW, 5);
							set_hitbox_value(AT_NAIR, 2, HG_LIFETIME, 3);
							set_hitbox_value(AT_NAIR, 2, HG_HITBOX_X, 32);
							set_hitbox_value(AT_NAIR, 2, HG_HITBOX_Y, -44);
							set_hitbox_value(AT_NAIR, 2, HG_WIDTH, 76);
							set_hitbox_value(AT_NAIR, 2, HG_HEIGHT, 54);
							set_hitbox_value(AT_NAIR, 2, HG_PRIORITY, 3);
							set_hitbox_value(AT_NAIR, 2, HG_DAMAGE, 6);
							set_hitbox_value(AT_NAIR, 2, HG_ANGLE, 50);
							set_hitbox_value(AT_NAIR, 2, HG_BASE_KNOCKBACK, 7);
							set_hitbox_value(AT_NAIR, 2, HG_KNOCKBACK_SCALING, 0.8);
							set_hitbox_value(AT_NAIR, 2, HG_BASE_HITPAUSE, 6);
							set_hitbox_value(AT_NAIR, 2, HG_HITPAUSE_SCALING, 0.65);
							set_hitbox_value(AT_NAIR, 2, HG_HIT_SFX, asset_get("sfx_blow_medium2"));

                    		break;
                    	
                    	case AT_FAIR:
                    		set_attack_value(AT_FAIR, AG_CATEGORY, 1);
							set_attack_value(AT_FAIR, AG_SPRITE, sprite_get("enemy_100_fair"));
							set_attack_value(AT_FAIR, AG_HURTBOX_SPRITE, sprite_get("enemy_100_fair_hurt"));
							set_attack_value(AT_FAIR, AG_HAS_LANDING_LAG, 1);
							set_attack_value(AT_FAIR, AG_LANDING_LAG, 5);
							
							set_attack_value(AT_FAIR, AG_NUM_WINDOWS, 3);
							set_window_value(AT_FAIR, 1, AG_WINDOW_LENGTH, 11);
							set_window_value(AT_FAIR, 1, AG_WINDOW_ANIM_FRAMES, 3);
							set_window_value(AT_FAIR, 1, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_FAIR, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_heavy2"));
							set_window_value(AT_FAIR, 1, AG_WINDOW_SFX_FRAME, 10);
							
							set_window_value(AT_FAIR, 2, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_FAIR, 2, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_FAIR, 2, AG_WINDOW_ANIM_FRAME_START, 3);
							set_window_value(AT_FAIR, 2, AG_WINDOW_VSPEED, -0.5);
							set_window_value(AT_FAIR, 2, AG_WINDOW_SFX, asset_get("0"));
							
							set_window_value(AT_FAIR, 3, AG_WINDOW_LENGTH, 20);
							set_window_value(AT_FAIR, 3, AG_WINDOW_ANIM_FRAMES, 5);
							set_window_value(AT_FAIR, 3, AG_WINDOW_ANIM_FRAME_START, 4);
							set_window_value(AT_FAIR, 3, AG_WINDOW_HAS_WHIFFLAG, 1);
							
							
							set_num_hitboxes(AT_FAIR, 2);
							set_hitbox_value(AT_FAIR, 1, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_FAIR, 1, HG_WINDOW, 2);
							set_hitbox_value(AT_FAIR, 1, HG_LIFETIME, 3);
							set_hitbox_value(AT_FAIR, 1, HG_HITBOX_X, 28);
							set_hitbox_value(AT_FAIR, 1, HG_HITBOX_Y, -36);
							set_hitbox_value(AT_FAIR, 1, HG_WIDTH, 72);
							set_hitbox_value(AT_FAIR, 1, HG_HEIGHT, 52);
							set_hitbox_value(AT_FAIR, 1, HG_PRIORITY, 1);
							set_hitbox_value(AT_FAIR, 1, HG_DAMAGE, 11);
							set_hitbox_value(AT_FAIR, 1, HG_ANGLE, 361);
							set_hitbox_value(AT_FAIR, 1, HG_BASE_KNOCKBACK, 6);
							set_hitbox_value(AT_FAIR, 1, HG_KNOCKBACK_SCALING, 1);
							set_hitbox_value(AT_FAIR, 1, HG_BASE_HITPAUSE, 8);
							set_hitbox_value(AT_FAIR, 1, HG_HITPAUSE_SCALING, 0.8);
							set_hitbox_value(AT_FAIR, 1, HG_VISUAL_EFFECT, 304);
							set_hitbox_value(AT_FAIR, 1, HG_HIT_SFX,  asset_get("sfx_blow_heavy1"));
							
							set_hitbox_value(AT_FAIR, 2, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_FAIR, 2, HG_WINDOW, 3);
							set_hitbox_value(AT_FAIR, 2, HG_LIFETIME, 3);
							set_hitbox_value(AT_FAIR, 2, HG_HITBOX_X, 28);
							set_hitbox_value(AT_FAIR, 2, HG_HITBOX_Y, -36);
							set_hitbox_value(AT_FAIR, 2, HG_WIDTH, 68);
							set_hitbox_value(AT_FAIR, 2, HG_HEIGHT, 52);
							set_hitbox_value(AT_FAIR, 2, HG_PRIORITY, 1);
							set_hitbox_value(AT_FAIR, 2, HG_DAMAGE, 11);
							set_hitbox_value(AT_FAIR, 2, HG_ANGLE, 361);
							set_hitbox_value(AT_FAIR, 2, HG_BASE_KNOCKBACK, 6);
							set_hitbox_value(AT_FAIR, 2, HG_KNOCKBACK_SCALING, 1);
							set_hitbox_value(AT_FAIR, 2, HG_BASE_HITPAUSE, 8);
							set_hitbox_value(AT_FAIR, 2, HG_HITPAUSE_SCALING, 0.8);
							set_hitbox_value(AT_FAIR, 2, HG_VISUAL_EFFECT, 301);
							set_hitbox_value(AT_FAIR, 2, HG_HIT_SFX,  asset_get("sfx_blow_medium2"));
                    		break;
                    	case AT_UAIR:
                    		set_attack_value(AT_UAIR, AG_CATEGORY, 1);
							set_attack_value(AT_UAIR, AG_SPRITE, sprite_get("enemy_100_uair"));
							set_attack_value(AT_UAIR, AG_HURTBOX_SPRITE, sprite_get("enemy_100_uair_hurt"));
							set_attack_value(AT_UAIR, AG_HAS_LANDING_LAG, 1);
							set_attack_value(AT_UAIR, AG_LANDING_LAG, 3);
							
							set_attack_value(AT_UAIR, AG_NUM_WINDOWS, 6);
							
							set_window_value(AT_UAIR, 1, AG_WINDOW_LENGTH, 8);
							set_window_value(AT_UAIR, 1, AG_WINDOW_ANIM_FRAMES, 3);
							set_window_value(AT_UAIR, 1, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_UAIR, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));
							set_window_value(AT_UAIR, 1, AG_WINDOW_SFX_FRAME, 7);
							
							set_window_value(AT_UAIR, 2, AG_WINDOW_LENGTH, 3);
							set_window_value(AT_UAIR, 2, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_UAIR, 2, AG_WINDOW_ANIM_FRAME_START, 3);
							
							set_window_value(AT_UAIR, 3, AG_WINDOW_LENGTH, 16);
							set_window_value(AT_UAIR, 3, AG_WINDOW_ANIM_FRAMES, 2);
							set_window_value(AT_UAIR, 3, AG_WINDOW_ANIM_FRAME_START, 6);
							set_window_value(AT_UAIR, 3, AG_WINDOW_HAS_WHIFFLAG, 1);
							
							set_window_value(AT_UAIR, 4, AG_WINDOW_LENGTH, 8);
							set_window_value(AT_UAIR, 4, AG_WINDOW_ANIM_FRAMES, 3);
							set_window_value(AT_UAIR, 4, AG_WINDOW_ANIM_FRAME_START, 10);
							set_window_value(AT_UAIR, 4, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_UAIR, 4, AG_WINDOW_VSPEED_TYPE, 1);
							
							//Normal
							set_window_value(AT_UAIR, 5, AG_WINDOW_LENGTH, 6);
							set_window_value(AT_UAIR, 5, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_UAIR, 5, AG_WINDOW_ANIM_FRAME_START, 12);
							set_window_value(AT_UAIR, 5, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_UAIR, 5, AG_WINDOW_VSPEED_TYPE, 1);
							
							set_window_value(AT_UAIR, 6, AG_WINDOW_LENGTH, 10);
							set_window_value(AT_UAIR, 6, AG_WINDOW_ANIM_FRAMES, 6);
							set_window_value(AT_UAIR, 6, AG_WINDOW_ANIM_FRAME_START, 15);
							set_window_value(AT_UAIR, 6, AG_WINDOW_HSPEED_TYPE, 2);
							set_window_value(AT_UAIR, 6, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
							set_window_value(AT_UAIR, 6, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.1);
							set_window_value(AT_UAIR, 6, AG_WINDOW_VSPEED_TYPE, 1);
							
							//Smoke consume
							set_window_value(AT_UAIR, 7, AG_WINDOW_LENGTH, 6);
							set_window_value(AT_UAIR, 7, AG_WINDOW_ANIM_FRAMES, 4);
							set_window_value(AT_UAIR, 7, AG_WINDOW_ANIM_FRAME_START, 12);
							set_window_value(AT_UAIR, 7, AG_WINDOW_HSPEED_TYPE, 1);
							set_window_value(AT_UAIR, 7, AG_WINDOW_CUSTOM_GRAVITY, 0);
							set_window_value(AT_UAIR, 7, AG_WINDOW_VSPEED_TYPE, 1);
							
							set_window_value(AT_UAIR, 8, AG_WINDOW_LENGTH, 18);
							set_window_value(AT_UAIR, 8, AG_WINDOW_ANIM_FRAMES, 6);
							set_window_value(AT_UAIR, 8, AG_WINDOW_ANIM_FRAME_START, 15);
							set_window_value(AT_UAIR, 8, AG_WINDOW_HSPEED_TYPE, 2);
							set_window_value(AT_UAIR, 8, AG_WINDOW_HAS_CUSTOM_FRICTION, 1);
							set_window_value(AT_UAIR, 8, AG_WINDOW_CUSTOM_AIR_FRICTION, 0.1);
							set_window_value(AT_UAIR, 8, AG_WINDOW_CUSTOM_GRAVITY, 0);
							set_window_value(AT_UAIR, 8, AG_WINDOW_VSPEED_TYPE, 1);
							
							
							set_num_hitboxes(AT_UAIR, 3);
							set_hitbox_value(AT_UAIR, 1, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_UAIR, 1, HG_WINDOW, 2);
							set_hitbox_value(AT_UAIR, 1, HG_LIFETIME, 3);
							set_hitbox_value(AT_UAIR, 1, HG_HITBOX_X, 22);
							set_hitbox_value(AT_UAIR, 1, HG_HITBOX_Y, -72);
							set_hitbox_value(AT_UAIR, 1, HG_WIDTH, 64 + (144));
							set_hitbox_value(AT_UAIR, 1, HG_HEIGHT, 64 + (144));
							set_hitbox_value(AT_UAIR, 1, HG_PRIORITY, 3);
							set_hitbox_value(AT_UAIR, 1, HG_DAMAGE, 6);
							set_hitbox_value(AT_UAIR, 1, HG_ANGLE, 90);
							set_hitbox_value(AT_UAIR, 1, HG_BASE_KNOCKBACK, 3);
							set_hitbox_value(AT_UAIR, 1, HG_BASE_HITPAUSE, 8);
							// set_hitbox_value(AT_UAIR, 1, HG_EXTRA_HITPAUSE, 15);
							set_hitbox_value(AT_UAIR, 1, HG_HIT_SFX, asset_get("sfx_blow_heavy1"));
							set_hitbox_value(AT_UAIR, 1, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_UAIR, 1, HG_SDI_MULTIPLIER, 0);
							set_hitbox_value(AT_UAIR, 1, HG_TECHABLE, 1);
							
							//Regular throw
							set_hitbox_value(AT_UAIR, 2, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_UAIR, 2, HG_WINDOW, 5);
							set_hitbox_value(AT_UAIR, 2, HG_WINDOW_CREATION_FRAME, 5);
							set_hitbox_value(AT_UAIR, 2, HG_LIFETIME, 3);
							set_hitbox_value(AT_UAIR, 2, HG_HITBOX_X, -12);
							set_hitbox_value(AT_UAIR, 2, HG_HITBOX_Y, -48);
							set_hitbox_value(AT_UAIR, 2, HG_WIDTH, 48);
							set_hitbox_value(AT_UAIR, 2, HG_HEIGHT, 48);
							set_hitbox_value(AT_UAIR, 2, HG_PRIORITY, 1);
							set_hitbox_value(AT_UAIR, 2, HG_DAMAGE, 6);
							set_hitbox_value(AT_UAIR, 2, HG_ANGLE, 135);
							set_hitbox_value(AT_UAIR, 2, HG_BASE_KNOCKBACK, 7);
							set_hitbox_value(AT_UAIR, 2, HG_KNOCKBACK_SCALING, 0.2);
							set_hitbox_value(AT_UAIR, 2, HG_BASE_HITPAUSE, 8);
							set_hitbox_value(AT_UAIR, 2, HG_HITPAUSE_SCALING, 0.2);
							set_hitbox_value(AT_UAIR, 2, HG_HIT_SFX, asset_get("sfx_swipe_medium1"));
							set_hitbox_value(AT_UAIR, 2, HG_EFFECT, 9);
							set_hitbox_value(AT_UAIR, 2, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_UAIR, 2, HG_TECHABLE, 2);
							set_hitbox_value(AT_UAIR, 2, HG_HITBOX_GROUP, 1);
							
							//Smoke consume throw
							set_hitbox_value(AT_UAIR, 3, HG_HITBOX_TYPE, 1);
							set_hitbox_value(AT_UAIR, 3, HG_WINDOW, 7);
							set_hitbox_value(AT_UAIR, 3, HG_WINDOW_CREATION_FRAME, 5);
							set_hitbox_value(AT_UAIR, 3, HG_LIFETIME, 3);
							set_hitbox_value(AT_UAIR, 3, HG_HITBOX_X, -12);
							set_hitbox_value(AT_UAIR, 3, HG_HITBOX_Y, -48);
							set_hitbox_value(AT_UAIR, 3, HG_WIDTH, 48);
							set_hitbox_value(AT_UAIR, 3, HG_HEIGHT, 48);
							set_hitbox_value(AT_UAIR, 3, HG_PRIORITY, 1);
							set_hitbox_value(AT_UAIR, 3, HG_DAMAGE, 9);
							set_hitbox_value(AT_UAIR, 3, HG_ANGLE, 145);
							set_hitbox_value(AT_UAIR, 3, HG_BASE_KNOCKBACK, 7);
							set_hitbox_value(AT_UAIR, 3, HG_KNOCKBACK_SCALING, 1);
							set_hitbox_value(AT_UAIR, 3, HG_BASE_HITPAUSE, 18);
							set_hitbox_value(AT_UAIR, 3, HG_HITPAUSE_SCALING, 0.5);
							set_hitbox_value(AT_UAIR, 3, HG_HIT_SFX, asset_get("sfx_burnconsume"));
							set_hitbox_value(AT_UAIR, 3, HG_EFFECT, 9);
							set_hitbox_value(AT_UAIR, 3, HG_IGNORES_PROJECTILES, 1);
							set_hitbox_value(AT_UAIR, 3, HG_TECHABLE, 2);
							set_hitbox_value(AT_UAIR, 3, HG_HITBOX_GROUP, 1);
							set_hitbox_value(AT_UAIR, 3, HG_VISUAL_EFFECT, other.smokeconsume_fx_bot);
							set_hitbox_value(AT_UAIR, 3, HG_VISUAL_EFFECT_Y_OFFSET, 32);

                    }
    			 }
    		break;
    		case EN_EVENT.ATTACK_UPDATE:
    			var _win_length;
	    		with obj_stage_main _win_length = get_window_value(other.attack, other.window, AG_WINDOW_LENGTH);
	    		
	    		if (attack == AT_NSPECIAL) {
					if (window == 1) {
					    super_armor = true; //Apply armor
					    if window_timer == 1 {
					    	grab_timer = 0;
					    	grabbedid = noone;
					    }
					}
				    if (window == 3 && grabbedid == noone) {
				        if (window_timer >= _win_length) {
				        	window = 25;
				        	window_timer = 0;
				        }
				    }
				    
				    if (window <= 4) {
				    	can_fast_fall = false;
				    }
				    if (grabbedid != noone) {
				    	djumps = max_djumps;
					    grabbedid.ungrab = 0;
				        grabbedid.spr_dir = -spr_dir;
				        grabbedid.depth = depth + 1;
				        
				        if (window > 4) {
				        	
				        	//Grab timer
				        	grab_timer ++;
				        	
				        	var grab_damage = 0;
				        	with (grabbedid) {
				        		var mashed_this_frame = false;
				        		grab_damage = get_player_damage(player);
				        		
				        		/*
				        		if (!mashed_this_frame) {
				        			if (attack_pressed || special_pressed || jump_pressed 
				        			|| shield_pressed || up_pressed || down_pressed || left_pressed || right_pressed
				        			|| up_strong_pressed || down_strong_pressed || left_strong_pressed || right_strong_pressed) {
				        				mashed_this_frame = true;
				        				other.grab_timer += 6;
				        			}
				        		
					        		//CPU Mashing 
					        		if (variable_instance_exists(id, "ai_target")) {
					        			if (get_training_cpu_action() == CPU_FIGHT)
					        			if (other.grab_timer % (10 - temp_level) == 0) {
					        				mashed_this_frame = true;
					        				other.grab_timer += 6;
					        			}
					        		}
				        		}
				        		*/
				        	}
				        	
				        	//Throwing
				        // 	if (special_pressed || attack_pressed || left_strong_pressed || right_strong_pressed || up_strong_pressed) {
				        // 		if (up_down || up_strong_pressed) {
				            var _rando = random_func(id % 50,3,true);
			                if _rando > 1 {
			        			set_attack(AT_UTHROW);
			        			// next_attack = AT_UTHROW;
			        // 			hurtboxID.sprite_index = get_attack_value(AT_UTHROW, AG_HURTBOX_SPRITE);
			        			// hurtbox_spr.sprite_index = sprite_get("enemy_100_uthrow_hurt");
			        			grab_timer = 0;
			    				djumps = 0;
			        		}
			        		else {
			        			set_attack(AT_FTHROW);
			        			// next_attack = AT_FTHROW;
			        // 			hurtboxID.sprite_index = get_attack_value(AT_FTHROW, AG_HURTBOX_SPRITE);
			        			// hurtbox_spr.sprite_index = sprite_get("enemy_100_fthrow_hurt");
			        			grab_timer = 0;
			    				djumps = 0;
			    				
			    				if (_rando/2 == floor(_rando/2)) {
			    				    spr_dir = -1;
			    				} else {
			    				    spr_dir = 1;
			    				}
			    			}
			    				
			    	// 			if (left_down || left_strong_pressed) spr_dir = -1;
			    	// 			if (right_down || right_strong_pressed) spr_dir = 1;
			     //   		}
				        // 	}
				        	
				        	if (grab_timer > (grab_time_max + ease_linear(0, 90, grab_damage, 100) + (has_rune("M") * 180)) / (1 + (0.5 * grabbedid.smoked))) {
				        		window = 11;
				        		window_timer = 0;
				        		grab_timer = 0;
				        		
						        grabbedid.x = x + spr_dir * 48;
						        grabbedid.y = y + 2;
				        		
						        grabbedid.hitstun = 30;
						        grabbedid.hitpause = true;
						        grabbedid.state = PS_HITSTUN;
						        grabbedid.hsp = 8 * spr_dir;
						        grabbedid.vsp = 0;
								grabbedid.ungrab = 0;
								grabbedid = noone;
				        	}
				        }
				    	
				    	if (window == 4	) {
					        var window_mult = 6 / _win_length;
					        var window_frames = floor((window_timer - 1) * window_mult);
					        
					        if (window_frames == 0) {
						        grabbedid.x = x + spr_dir * 24;
						        grabbedid.y = y;
					        }
					        if (window_frames == 1) {
						        grabbedid.x = x + spr_dir * 22;
						        grabbedid.y = y - 4;
					        }
					        if (window_frames == 2) {
						        grabbedid.x = x + spr_dir * 4;
						        grabbedid.y = y - 64;
					        }
					        if (window_frames == 3) {
						        grabbedid.x = x + spr_dir;
						        grabbedid.y = y - 66;
					        }
					        if (window_frames == 4) {
						        grabbedid.x = x + spr_dir * 8;
						        grabbedid.y = y - 54;
					        }
					        if (window_frames == 5) {
						        grabbedid.x = x + spr_dir * 10;
						        grabbedid.y = y - 56;
					        }
					        
					        if (window_timer >= _win_length - 1) {
					            window = 5;
					            window_timer = 0;
					        }
				    	}
				    	
				    	//Idling
				    	if (window == 5) {
					        var window_mult = 4 / _win_length;
					        var window_frames = floor((window_timer - 1) * window_mult);
					        
					    	if (window_frames == 0 || window_frames == 1) {
						        grabbedid.x = x + spr_dir * 10;
						        grabbedid.y = y - 56;
					        }
					        
					    	if (window_frames == 2 || window_frames == 3) {
						        grabbedid.x = x + spr_dir * 10;
						        grabbedid.y = y - 54;
					        }
					        
					        if (left_down || right_down) {
					        	window = 6;
					        	window_timer = 0;
					        }
					        
					        if (is_free) {
					        	window = 9;
					        	window_timer = 0;
					        }
					        
					        if (jump_down) {
					        	window = 7;
					        	window_timer = 0;
					        }
				    	}
				    	
				    	//Walking
				    	if (window == 6) {
				    		var carry_spd = walk_speed + (4);
				            hsp = clamp(hsp -walk_accel*left_down + walk_accel*right_down, -carry_spd, carry_spd);
				            
				            if (hsp > 0)
				            	spr_dir = 1;
				            if (hsp < 0)
				            	spr_dir = -1;
				            
					        var window_mult = 8 / _win_length;
					        var window_frames = floor((window_timer - 1) * window_mult);
					        
					    	if (window_frames == 0 || window_frames == 4) {
						        grabbedid.x = x + spr_dir * 12;
						        grabbedid.y = y - 56;
					        }
					        
					    	if (window_frames == 1 || window_frames == 5) {
						        grabbedid.x = x + spr_dir * 14;
						        grabbedid.y = y - 56;
					        }	
					        
					        if (window_frames == 2 || window_frames == 6) {
						        grabbedid.x = x + spr_dir * 14;
						        grabbedid.y = y - 54;
					        }
					        
					    	if (window_frames == 3 || window_frames == 7) {
						        grabbedid.x = x + spr_dir * 12;
						        grabbedid.y = y - 54;
					        }
					        
					        if !(left_down || right_down) {
					        	window = 5;
					        	window_timer = 0;
					        }
					        
					        if (is_free) {
					        	window = 9;
					        	window_timer = 0;
					        }
					        
					        if (jump_down) {
					        	window = 7;
					        	window_timer = 0;
					        }
				    	}
				    	
				    	//Jumpsquat 
				    	if (window == 7) {
					        grabbedid.x = x + spr_dir * 14;
					        grabbedid.y = y - 52;
					        
					        if (window_timer >= _win_length - 1) {
					            window = 8;
					            window_timer = 0;
					            if (jump_down) vsp = -jump_speed;
				                else vsp = -short_hop_speed;
					        }
					        
					        if (is_free) {
					        	window = 9;
					        	window_timer = 0;
					        }
				    	}
				    	
				    	//Jumping
				    	if (window == 8) {
					        var window_mult = 4 / _win_length;
					        var window_frames = floor((window_timer - 1) * window_mult);
					        
					    	if (window_frames == 0) {
						        grabbedid.x = x + spr_dir * 14;
						        grabbedid.y = y - 58;
					        }
					        
					    	if (window_frames == 1) {
						        grabbedid.x = x + spr_dir * 14;
						        grabbedid.y = y - 56;
					        }	
					        
					        if (window_frames == 2) {
						        grabbedid.x = x + spr_dir * 14;
						        grabbedid.y = y - 54;
					        }
					        
					    	if (window_frames == 3) {
						        grabbedid.x = x + spr_dir * 12;
						        grabbedid.y = y - 54;
					        }
					        
					        if (vsp > 0) {
					        	window = 9;
					        	window_timer = 0;
					        }
					        
					        if (!is_free) {
					        	window = 10;
					        	window_timer = 0;
					        }
				    	}
				    	//Falling
				    	if (window == 9) {
					        grabbedid.x = x + spr_dir * 12;
					        grabbedid.y = y - 54;
					        
					        if (!is_free) {
					        	window = 10;
					        	window_timer = 0;
					        }
				    	}
				    	//Landing 
				    	if (window == 10) {
					        grabbedid.x = x + spr_dir * 14;
					        grabbedid.y = y - 52;
					        
					        if (window_timer >= _win_length - 1) {
					            window = 5;
					            window_timer = 0;
					        }
					        
					        if (!is_free) {
					        	window = 9;
					        	window_timer = 0;
					        }
				    	}
				    }
					//Landing 
					if (window == 11) {
						if (window_timer == 1) {
							hsp = -8 * spr_dir;
						}
					}
				}
				
				//Nspecial Throws
				if (attack == AT_FTHROW) {
					move_cooldown[AT_NSPECIAL] = 30;
					can_fast_fall = false;
				    if (window == 3 || window == 5) {
				        if (window_timer >= _win_length) {
				        	window = 25;
				        	window_timer = 0;
				        }
				    }
				    
				    if (grabbedid != noone) {
					    grabbedid.ungrab = 0;
				        grabbedid.spr_dir = -spr_dir;
				        grabbedid.depth = depth + 1;
				        
						if (window == 1) {
					        var window_mult = 4 / _win_length;
					        var window_frames = floor((window_timer - 1) * window_mult);
					        
					    	if (window_frames == 0) {
						        grabbedid.x = x + spr_dir * 8;
						        grabbedid.y = y - 58;
					        }
					        
					    	if (window_frames == 1) {
						        grabbedid.x = x + spr_dir * 4;
						        grabbedid.y = y - 56;
					        }	
					        
					        if (window_frames == 2) {
						        grabbedid.x = x + spr_dir * -12;
						        grabbedid.y = y - 50;
					        }
					        
					    	if (window_frames == 3) {
						        grabbedid.x = x + spr_dir * -8;
						        grabbedid.y = y - 52;
					        }
				    	}
				    	
				    	if (window == 1 && window_timer == 1) {
				    		smoke_consumed = noone;
				    	}
				    	
				    	if (window == 1 && window_timer >= _win_length) {
				    		if (smoke_consumed != noone) {
				    			window = 4;
				    			window_timer = 0;
				    			smoke_consumed = noone;
				    		}
				    	}
				    	
				    	if (window == 4 && window_timer >= _win_length) {
				    		window = 5;
				        	window_timer = 0;
				    	}
				    	
				    	if (window == 2 || window == 4) {
				    		if (window_timer == 1) {
						        grabbedid.x = x + spr_dir * 48;
						        grabbedid.y = y - 16;
								grab_timer = 0;
								grabbedid = noone;
				    		}
				    	}
				    }
				}
				
				if (attack == AT_UTHROW) {
					move_cooldown[AT_NSPECIAL] = 30;
					can_fast_fall = false;
				    if (window == 3 || window == 5) {
				        if (window_timer >= _win_length) {
				        	window = 25;
				        	window_timer = 0;
				        }
				    }
				    
				    if (grabbedid != noone) {
					    grabbedid.ungrab = 0;
				        grabbedid.spr_dir = -spr_dir;
				        grabbedid.depth = depth - 0.1;
				        
						if (window == 1) {
					        var window_mult = 4 / _win_length;
					        var window_frames = floor((window_timer - 1) * window_mult);
					        
					    	if (window_frames == 0) {
						        grabbedid.x = x - spr_dir * 8;
						        grabbedid.y = y - 4;
					        }
					        
					    	if (window_frames == 1) {
						        grabbedid.x = x - spr_dir * 16;
						        grabbedid.y = y - 8;
					        }	
					        
					        if (window_frames == 2) {
						        grabbedid.x = x - spr_dir * 18;
						        grabbedid.y = y - 10;
					        }
					        
					    	if (window_frames == 3) {
						        grabbedid.x = x - spr_dir * 8;
						        grabbedid.y = y - 4;
					        }
				    	}
				    	
				    	if (window == 1 && window_timer == 1) {
				    		smoke_consumed = noone;
				    	}
				    	
				    	if (window == 1 && window_timer >= _win_length) {
				    		if (smoke_consumed != noone) {
				    			window = 4;
				    			window_timer = 0;
				    			smoke_consumed = noone;
				    		}
				    	}
				    	
				    	if (window == 4 && window_timer >= _win_length) {
				    		window = 5;
				        	window_timer = 0;
				    	}
				    	
				    	if (window == 2 || window == 4) {
				    		if (window_timer == 1) {
						        grabbedid.x = x + spr_dir * 12;
						        grabbedid.y = y - 48;
								grab_timer = 0;
								grabbedid = noone;
				    		}
				    	}
				    }
				}
	    		
	    		//Specials
	    		if (attack == AT_FSPECIAL){
	    			if window == 1 {
	    				super_armor = true;
	    				if window_timer == 1 grabbedid = noone;
	    			}
					if (window == 3) {
				        if (window_timer >= _win_length) {
				        	// grabbedid = noone;
				        	window = 25;
				        	window_timer = 0;
				        }
				    }
				    
					if (window == 7 || window == 9) {
				        if (window_timer >= _win_length){
				        	// grabbedid = noone;
				        	window = 25;
				        	window_timer = 0;
				        }
				    }
				        
					if (window == 4 && window_timer == 1) {
						hsp = 3 * spr_dir;
						vsp = -8;
					}
				    
				    if (grabbedid != noone) {
				    	off_edge = false;
					    grabbedid.ungrab = 0;
				        grabbedid.spr_dir = -spr_dir;
				        grabbedid.depth = depth - 0.1;
				    	
				    	if (window == 5 && !is_free) {
				    		// max_fall = 99;
				    		//Always assuming smoked
				    		// if (smoke_consumed != noone) {
			    			window = 8;
			    			window_timer = 0;
			    			smoke_consumed = noone;
			    			// max_fall = max_fall_def;
				    		// }
				    		// else {
				    		// 	window = 6;
				    		// 	window_timer = 0;
				    		// 	smoke_consumed = noone;
				    		// 	max_fall = max_fall_def;
				    		// }
				    	}
				    	
				        
						if (window == 4) {
					        var window_mult = 6 / _win_length;
					        var window_frames = floor((window_timer - 1) * window_mult); 
					        var grabbed_center = (grabbedid.bbox_bottom - grabbedid.bbox_top);
					        
					    	if (window_frames == 0) {
						        grabbedid.x = x + spr_dir * 38;
						        grabbedid.y = y - 6;
					        }
					        
					    	if (window_frames == 1) {
						        grabbedid.x = x + spr_dir * 40;
						        grabbedid.y = y - 8;
					        }	
					        
					        if (window_frames == 2) {
						        grabbedid.x = x + spr_dir * 44;
						        grabbedid.y = y - 6;
					        }
					        
					    	if (window_frames == 3) {
						        grabbedid.x = x + spr_dir * 44;
						        grabbedid.y = y - 4;
					        }
					        
					    	if (window_frames == 4) {
						        grabbedid.x = x + spr_dir * 46;
						        grabbedid.y = y;
					        }
				    	}
						if (window == 5) {
					        grabbedid.x = x + spr_dir * 48;
					        grabbedid.y = y + 2;
					        if (y >= room_height - abs(vsp)) {
						        grabbedid.x = x;
						        grabbedid.y = room_height + 256;
					        }
						}
				    	
				    	if (window == 1 && window_timer == 1) {
				    		smoke_consumed = noone;
				    	}
				    	
				    	if (window == 7 || window == 9) {
				    		if (window_timer == 1) {
						        grabbedid.x = x + spr_dir * 26;
						        grabbedid.y = y;
								grab_timer = 0;
								// grabbedid.ungrab = true;
								grabbedid = noone;
		
				    		}
				    	}
				    	
						if (window == 6 || window == 8) {
					        grabbedid.x = x + spr_dir * 26;
					        grabbedid.y = y;
				    	}
				    	
				//     	if (shield_pressed && window <= 5 && vsp > 0.5) {
				// 			move_cooldown[AT_FSPECIAL] = 15;
				//             window = 25;
				//             window_timer = 0;
				// 			grab_timer = 0;
				//             vsp -= 8;
				//             hsp /= 2.5;
				// 			grabbedid.hsp = hsp;
				// 			grabbedid.vsp = vsp * 2;
				// 			grabbedid = noone;
				//             attack_end();
				//             djumps = 0;
				//             clear_button_buffer(PC_SHIELD_PRESSED);
				//     	}
				    }
				    else {
				    	can_wall_jump = true;
				    }
			    	can_fast_fall = false;
				}
				
				if (attack == AT_USPECIAL){
				  can_fast_fall = false;
				  can_move = false;
				  can_wall_jump = true;
				  if window == 1 && window_timer == 1 {
					grabbedid = noone;
				  }
				    if (window == 4) {
						grab_timer = 0;
						can_move = true;
				        if (window_timer >= _win_length) {
				        	// grabbedid = noone;
				        	set_state(PS_PRATFALL); //next_state = PS_PRATFALL;
				        }
				    }
				    
				    if (window == 8 || window == 11) {
						can_move = true;
				        if (window_timer >= _win_length) {
				        	// grabbedid = noone;
				        	window = 25;
				        	window_timer = 0;
				        }
				    }
				    
				    if (grabbedid != noone) {
					    grabbedid.ungrab = 0;
				        grabbedid.spr_dir = -spr_dir;
				        grabbedid.depth = depth + 1;
				        
						if (window == 5 || window == 6) {
					        grabbedid.x = x + spr_dir * 44;
					        grabbedid.y = y - 40;
				    	}
				    	
				    	if (window == 6 && window_timer == 1) {
				    		smoke_consumed = noone;
				    	}
				    	
				    	if (window == 5 && window_timer >= _win_length) {	
				    			grab_timer ++;
					    		window_timer = 0;
					    		djumps = 0;
				        		if (grab_timer >= 3) {
				        			//Always assuming smoked
				        			// if (smoke_consumed != noone) {
						    			window = 9;
						    		// 	smoke_consumed = noone;
						    		// }
						    		// else
					    			// 	window = 6;
					        	}
				    		
				    	}
				    	
				    	if (window == 6 || window == 9) {
				    		if (window_timer == 4) {
						        grabbedid.x = x + spr_dir * 44;
						        grabbedid.y = y - 40;
								grab_timer = 0;
								grabbedid = noone;
				    		}
				    	}
				    }
				}
				
				if (attack == AT_DSPECIAL){
					if (window == 1) {
						super_armor = true;
						dspecial_charge = 0;
					}
				    if (window == 2){
				    	super_armor = true;
				    	dspecial_charge = ease_linear(100, 200, window_timer, _win_length) / 100;
				    // 	if (!special_down) {
				    // 		window = 3;
				    // 		window_timer = 0;
				    // 	}
				        if (window_timer >= _win_length) {
				    		window = 5;
				    		window_timer = 0;
				    	}
				    }
				    
					if (window == 4) {
				        if (window_timer >= _win_length){
				        	window = 25;
				        	window_timer = 0;
				        }
				    }
				    
				    if (window == 3 || window == 5) {
				    	vsp = 0;
				    }
				    
				    if (window == 3 && window_timer == 2) {
				       create_smoke(x, y - 32, 18, 45, 0, 359, 4, 8 * dspecial_charge + (6), 0.18);
				    }
				    
				    if (window == 5 && window_timer == 2) {
				       create_smoke(x, y - 32, 24, 55, 0, 359, 4, 8 * dspecial_charge + (8), 0.18);
				    }
				    
				    // if (window == 5 && has_hit_player) {
				    //     if (window_timer >= _win_length) {
				    // 		window = 4;
				    // 		window_timer = 0;
				    // 	}
				    // }
				    
				    // if (window == 4 || window == 6) && window_timer >= 5 && has_hit_player{
				    //     can_jump = true;
				    // }
				    can_fast_fall = false;
				    can_move = false;
				}
				
				//Aerials
				if (attack == AT_UAIR){
				    if (window == 3 && grabbedid == noone) {
				        if (window_timer == _win_length) {
				        	window = 25;
				        	window_timer = 0;
				        }
				    }
				    
				    if (window == 4 && grabbedid != noone){
					    grabbedid.ungrab = 0;
				        grabbedid.x = x + spr_dir * 4;
				        grabbedid.y = y - 80;
				        grabbedid.spr_dir = -spr_dir;
				        
				        if (window_timer >= _win_length - 1) {
				            window = 5;
					    	grabbedid.ungrab = 0;
				            window_timer = 0;
				        }
				            
				    }
				    
				    if ((window == 5 || window == 7) && grabbedid != noone) {
					    grabbedid.ungrab = 0;
				        if (window_timer < 1) {
					        grabbedid.ungrab = 0;
				            grabbedid.x = x + spr_dir * 4;
				            grabbedid.y = y - 80;
				        }
					        else if (window_timer >= 2 && window_timer < 4) {
					        grabbedid.ungrab = 0;
				            grabbedid.x = x + spr_dir * 12;
				            grabbedid.y = y - 76;
				        }
				        else if (window_timer >= 4 && window_timer < 6) {
					        grabbedid.ungrab = 0;
				            grabbedid.x = x + spr_dir * 4;
				            grabbedid.y = y - 32;
				        }
				        else {
				            grabbedid.x = x - spr_dir * 12;
				            grabbedid.y = y - 24;
						    // grabbedid = noone;
							grab_timer = 0;
				        }
				    }
				    
				    if (window == 1 && window_timer == 1) {
				    		smoke_consumed = noone;
				    		grabbedid = noone;
					}
					
					if (window == 5) {
						if (smoke_consumed != noone) {
							window = 7;
							window_timer = 0;
							smoke_consumed = noone;
						}
					}
					
					if (window == 7 && window_timer == _win_length) {
						window = 8;
				    	window_timer = 0;
				    	grabbedid = noone;
					}
					
					can_fast_fall = window <= 3;
				}
    		break;
    		case EN_EVENT.GOT_HIT:
    		break;
    		case EN_EVENT.GOT_PARRIED:
    		break;
    		case EN_EVENT.HIT_PLAYER:
	    		if (my_hitboxID.attack == AT_UAIR && attack == AT_UAIR){
				    if (my_hitboxID.hbox_num == 1 && grabbedid == noone && !hit_player_obj.invincible && !hit_player_obj.super_armor && !hit_player_obj.clone){
				        hit_player_obj.grabbed = 1;
				        grabbedid = hit_player_obj;
					    grabbedid.ungrab = 0;
					    window = 4;
				        window_timer = 0;
				        with obj_stage_main destroy_hitboxes();
				    }
				}
				
				if (my_hitboxID.attack == AT_NSPECIAL && attack == AT_NSPECIAL){
				    if (my_hitboxID.hbox_num == 1 && grabbedid == noone && !hit_player_obj.invincible && !hit_player_obj.super_armor && !hit_player_obj.clone){
				        hit_player_obj.grabbed = 1;
				        grabbedid = hit_player_obj;
					    grabbedid.ungrab = 0;
					    window = 4;
				        window_timer = 0;
				        with obj_stage_main destroy_hitboxes();
				    }
				}
				
				if (my_hitboxID.attack == AT_FSPECIAL && attack == AT_FSPECIAL){
				    if ((my_hitboxID.hbox_num == 1 || my_hitboxID.hbox_num == 2) && grabbedid == noone && !hit_player_obj.invincible && !hit_player_obj.super_armor && !hit_player_obj.clone){
				        hit_player_obj.grabbed = 1;
				        grabbedid = hit_player_obj;
					    grabbedid.ungrab = 0;
					    window = 4;
				        window_timer = 0;
				        with obj_stage_main destroy_hitboxes();
				        y -= 2;
				    }
				}
				
				if (my_hitboxID.attack == AT_USPECIAL && attack == AT_USPECIAL){
				    if ((my_hitboxID.hbox_num >= 1 && my_hitboxID.hbox_num <= 3) && grabbedid == noone && !hit_player_obj.invincible && !hit_player_obj.super_armor && !hit_player_obj.clone){
				        hit_player_obj.grabbed = 1;
				        grabbedid = hit_player_obj;
					    grabbedid.ungrab = 0;
					    window = 5;
				        window_timer = 0;
				        with obj_stage_main destroy_hitboxes();
				    }
				}
				
				if (my_hitboxID.attack == AT_DSPECIAL && attack == AT_DSPECIAL){
					speedboost_timer = 60;
				}
				
				if (my_hitboxID.attack == AT_USPECIAL && (my_hitboxID.hbox_num == 1 || my_hitboxID.hbox_num == 2 || my_hitboxID.hbox_num == 3)) {
					hit_player_obj.should_make_shockwave = false;
				}
    		break;
    		
    		case EN_EVENT.PARRY:
    		break;
    	}
    break;
}
//DO NOT EDIT BELOW
#define create_smoke(_x, _y, _amount, _length, _dir_min, _dir_max, _spd_min, _spd_max, _frict)
var smoke = instance_create(_x, _y, "obj_stage_article",18); //Ryken's Smoke
smoke.smoke_length = _length;
smoke.smoke_particle_amount = _amount;
smoke.spr_dir = spr_dir;
smoke.smoke_spread_dir_min = _dir_min;
smoke.smoke_spread_dir_max = _dir_max;
smoke.smoke_speed_min = _spd_min;
smoke.smoke_speed_max = _spd_max;
smoke.smoke_friction = _frict;
smoke.player_id = self;

return smoke;
#define arc_calc_x_speed(x1, y1, x2, y2, vspd, g)
var dX = x2 - x1;
var dY = y2 - y1;
if (dX == 0) {
	return 0;
}
var t = (abs(vspd) / g) + sqrt(abs(vspd * vspd) / (g * g) - (dY / g));
return dX / t;


#define enemy_sprite_get(_name,_sprite) //Get the sprite of this article
return sprite_get("enemy_"+string(_name)+"_"+string(_sprite));
#define place_meet(__x,__y) //get place_meeting for the usual suspects
return (place_meeting(__x,__y,asset_get("solid_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_solid) || 
        place_meeting(__x,__y,asset_get("jumpthrough_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_platform));
#define position_meet(__x,__y) //get place_meeting for the usual suspects
return (position_meeting(__x,__y,asset_get("solid_32_obj")) || 
        position_meeting(__x,__y,obj_stage_article_solid) || 
        position_meeting(__x,__y,asset_get("jumpthrough_32_obj")) || 
        position_meeting(__x,__y,obj_stage_article_platform));
#define place_meet_solid(__x,__y) //get place_meeting for the usual suspects
return (place_meeting(__x,__y,asset_get("solid_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_solid));
#define place_meet_plat(__x,__y) //get place_meeting for the usual suspects
return (place_meeting(__x,__y,asset_get("jumpthrough_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_platform));
#define get_plat(__x,__y)
var _plat = instance_place(__x,__y,obj_stage_article_platform);
if instance_exists(_plat) return _plat;
else return instance_place(__x,__y,asset_get("jumpthrough_32_obj"));
#define set_state(_state)
next_state = _state;
return _state;