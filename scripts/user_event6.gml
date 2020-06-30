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
    GOT_PARRIED
}

//Enemy enums
enum EN {
    OU, //0
    ABRAWLER, //1
    FLEYE, //2
};

switch (enem_id) {
    case EN.OU:
        switch (art_event) {
            case EN_EVENT.INIT:
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
            case EN_EVENT.UPDATE:
                if !committed && attack_down next_attack = AT_JAB;
            break;
            case EN_EVENT.ANIMATION:
                //Custom State Stuff
                switch art_state {
                    case PS_DOUBLE_JUMP:
                        sprite_index = enemy_sprite_get(enem_id,"PS_FIRST_JUMP");
                        break;
                }
            break;
        }
    break;
}

//DO NOT EDIT BELLOW
#define enemy_sprite_get(_name,_sprite) //Get the sprite of this article
return sprite_get("enemy_"+string(_name)+"_"+string(_sprite));
#define place_meet(__x,__y) //get place_meeting for the usual suspects
/*return (collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("solid_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_solid,true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("jumpthrough_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_platform,true,true));*/
return (place_meeting(__x,__y,asset_get("solid_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_solid) || 
        place_meeting(__x,__y,asset_get("jumpthrough_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_platform));
#define place_meet_solid(__x,__y) //get place_meeting for the usual suspects
/*return (collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("solid_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_solid,true,true));*/
return (place_meeting(__x,__y,asset_get("solid_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_solid));
#define place_meet_plat(__x,__y) //get place_meeting for the usual suspects
/*return (collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,asset_get("jumpthrough_32_obj"),true,true) ||
       collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_platform,true,true));*/
return (place_meeting(__x,__y,asset_get("jumpthrough_32_obj")) || 
        place_meeting(__x,__y,obj_stage_article_platform));
#define get_plat(__x,__y)
//var _plat = collision_rectangle(__x-colis_width/2,__y-colis_height,__x+colis_width/2,__y,obj_stage_article_platform,true,true);
var _plat = instance_place(__x,__y,obj_stage_article_platform);
if instance_exists(_plat) return _plat;
else return instance_place(__x,__y,asset_get("jumpthrough_32_obj"));