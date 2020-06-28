//Custom AI Behavior. see article6 code for details.

//Enum Declarations, DO NOT EDIT
enum TR {
    NEAR,
    MID,
    FAR,
    RANDOM,
    LOW,
    HIGH
}
//

//Enemy enums
enum EN {
    OU, //0
};

if !_init {
	//#region Enemy intialization
    switch enem_id {
        case EN.OU:
        //Initializations Here
        
        sprite_name = "0";
        
        //Animation Actions
        char_height = 25;
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
        walk_speed = 6;
        walk_accel = 1.5;
        walk_turn_time = 6;
        initial_dash_time = 10;
        initial_dash_speed = 6.5;
        dash_speed = 6;
        dash_turn_time = 10;
        dash_turn_accel = 2;
        dash_stop_time = 4;
        dash_stop_percent = .35; //the value to multiply your hsp by when going into idle from dash or dashstop
        ground_friction = .5;
        moonwalk_accel = 1.4;
        
        jump_start_time = 5;
        jump_speed = 12;
        short_hop_speed = 8;
        djump_speed = 10;
        leave_ground_max = 6; //the maximum hsp you can have when you go from grounded to aerial without jumping
        max_jump_hsp = 6; //the maximum hsp you can have when jumping from the ground
        air_max_speed = 6; //the maximum hsp you can accelerate to when in a normal aerial state
        jump_change = 3; //maximum hsp when double jumping. If already going faster, it will not slow you down
        air_accel = .3;
        prat_fall_accel = 1; //multiplier of air_accel while in pratfall
        air_friction = .03;
        max_djumps = 1;
        double_jump_time = 32; //the number of frames to play the djump animation. Can't be less than 31.
        
        max_fall = 9; //maximum fall speed without fastfalling
        fast_fall = 11; //fast fall speed
        gravity_speed = .5;
        hitstun_grav = .5;
        knockback_adj = 1.6; //the multiplier to KB dealt to you. 1 = default, >1 = lighter, <1 = heavier
        
        land_time = 4; //normal landing frames
        prat_land_time = 20;
        wave_land_time = 15;
        wave_land_adj = 1.5; //the multiplier to your initial hsp when wavelanding. Usually greater than 1
        wave_friction = .04; //grounded deceleration when wavelanding
        
        //parry animation frames
        dodge_startup_frames = 1;
        dodge_active_frames = 1;
        dodge_recovery_frames = 4;
        
        //tech animation frames
        tech_active_frames = 3;
        tech_recovery_frames = 1;
        
        //tech roll animation frames
        techroll_startup_frames = 2;
        techroll_active_frames = 2;
        techroll_recovery_frames = 2;
        techroll_speed = 10;
        
        //airdodge animation frames
        air_dodge_startup_frames = 1;
        air_dodge_active_frames = 3;
        air_dodge_recovery_frames = 3;
        air_dodge_speed = 7.5;
        
        
        //roll animation frames
        roll_forward_startup_frames = 2;
        roll_forward_active_frames = 2;
        roll_forward_recovery_frames = 2;
        roll_back_startup_frames = 2;
        roll_back_active_frames = 2;
        roll_back_recovery_frames = 2;
        roll_forward_max = 9; //roll speed
        roll_backward_max = 9;
        
        
        land_sound = asset_get("sfx_land_heavy");
        landing_lag_sound = asset_get("sfx_land_heavy");
        waveland_sound = asset_get("sfx_waveland_syl");
        jump_sound = asset_get("sfx_jumpground");
        djump_sound = asset_get("sfx_jumpair");
        air_dodge_sound = asset_get("sfx_quick_dodge");
        death_sound = asset_get("sfx_death2");
        break;
    }
    //#endregion
    
} else {
	//#region Enemy attacks
	if (next_attack >= 0) {
		with (obj_stage_main) {
			switch(other.enem_id) {
				case EN.OU: {
					switch (other.next_attack) {
						case AT_JAB:
							set_attack_value(AT_JAB, AG_CATEGORY, 1);
							set_attack_value(AT_JAB, AG_SPRITE, sprite_get("ou_jab"));
							set_attack_value(AT_JAB, AG_NUM_WINDOWS, 3);
							set_attack_value(AT_JAB, AG_HAS_LANDING_LAG, 1);
							set_attack_value(AT_JAB, AG_LANDING_LAG, 4);
							set_attack_value(AT_JAB, AG_HURTBOX_SPRITE, sprite_get("jab_hurt"));

							set_window_value(AT_JAB, 1, AG_WINDOW_LENGTH, 8);
							set_window_value(AT_JAB, 1, AG_WINDOW_ANIM_FRAMES, 2);
							set_window_value(AT_JAB, 1, AG_WINDOW_HAS_SFX, 1);
							set_window_value(AT_JAB, 1, AG_WINDOW_SFX, asset_get("sfx_swipe_weak2"));
							set_window_value(AT_JAB, 1, AG_WINDOW_SFX_FRAME, 7);

							set_window_value(AT_JAB, 2, AG_WINDOW_LENGTH, 4);
							set_window_value(AT_JAB, 2, AG_WINDOW_ANIM_FRAMES, 1);
							set_window_value(AT_JAB, 2, AG_WINDOW_ANIM_FRAME_START, 2);

							set_window_value(AT_JAB, 3, AG_WINDOW_LENGTH, 7);
							set_window_value(AT_JAB, 3, AG_WINDOW_ANIM_FRAMES, 2);
							set_window_value(AT_JAB, 3, AG_WINDOW_ANIM_FRAME_START, 3);
							set_window_value(AT_JAB, 3, AG_WINDOW_HAS_WHIFFLAG, 1);

							set_num_hitboxes(AT_JAB, 2);

							set_hitbox_value(AT_JAB, 1, HG_HITBOX_TYPE, 2);
							set_hitbox_value(AT_JAB, 1, HG_WINDOW, 2);
							set_hitbox_value(AT_JAB, 1, HG_LIFETIME, 6);
							set_hitbox_value(AT_JAB, 1, HG_SHAPE, 0);
							set_hitbox_value(AT_JAB, 1, HG_HITBOX_X, 27);
							set_hitbox_value(AT_JAB, 1, HG_HITBOX_Y, -24);
							set_hitbox_value(AT_JAB, 1, HG_WIDTH, 55);
							set_hitbox_value(AT_JAB, 1, HG_HEIGHT, 55);
							set_hitbox_value(AT_JAB, 1, HG_PRIORITY, 1);
							set_hitbox_value(AT_JAB, 1, HG_DAMAGE, 4);
							set_hitbox_value(AT_JAB, 1, HG_ANGLE, 60);
							set_hitbox_value(AT_JAB, 1, HG_BASE_KNOCKBACK, 5);
							set_hitbox_value(AT_JAB, 1, HG_KNOCKBACK_SCALING, .6);
							set_hitbox_value(AT_JAB, 1, HG_BASE_HITPAUSE, 5);
							set_hitbox_value(AT_JAB, 1, HG_HITPAUSE_SCALING, .6);
							set_hitbox_value(AT_JAB, 1, HG_HIT_LOCKOUT, 0);
							//set_hitbox_value(AT_JAB, 1, HG_EFFECT, 12);
							set_hitbox_value(AT_JAB, 1, HG_HITBOX_GROUP, -1);
							set_hitbox_value(AT_JAB, 1, HG_VISUAL_EFFECT, 0);
							set_hitbox_value(AT_JAB, 1, HG_HIT_SFX, asset_get("sfx_blow_weak2"));
							set_hitbox_value(AT_JAB, 1, HG_IGNORES_PROJECTILES, 0);
							set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_SPRITE, asset_get("empty_sprite"));
							set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_MASK, -1);
							set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_WALL_BEHAVIOR, 2);
							set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_GROUND_BEHAVIOR, 2);
							set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_ENEMY_BEHAVIOR, 1);
							set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_PARRY_STUN, true);
							set_hitbox_value(AT_JAB, 1, HG_PROJECTILE_DOES_NOT_REFLECT, true);
						break;
					}
				}
				break;
			}
		}
	}
	//#endregion
	
	//#region Enemy update
    switch enem_id {
        case EN.OU:
            if !committed && attack_down next_attack = AT_JAB;
            //Custom State Stuff
            switch art_state {
                case PS_DOUBLE_JUMP:
                    sprite_index = enemy_sprite_get(enem_id,"PS_FIRST_JUMP");
                    break;
            }
        break;
    }
    //
    //#endregion
    
}


//DO NOT EDIT BELLOW
#define enemy_sprite_get(_name,_sprite) //Get the sprite of this article
return sprite_get("enemy_"+string(_name)+"_"+string(_sprite));
