//

//sprite_change_offset("ground_strip", 0, 100);
sprite_change_offset("char_arrow",0,0);
sprite_change_offset( "boss_hp_back", 320, 0);
sprite_change_offset( "boss_hp_bar", 320, 0);

sprite_change_offset("bg2",240, 135+4);
sprite_change_offset("bg3",240, 135+4);

sprite_change_offset("column_deco",210, 310);
sprite_change_offset("column_deco_black",210, 310);

sprite_change_offset("stall",27, 48);
sprite_change_offset("marble_ground",-32, 0);
sprite_change_offset("black",-32, 0);

//Need to set sprite collisions here!
//Ouside Left
sprite_change_collision_mask("g_ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("1[-4,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("[-3,-1]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("1[-3,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("1[-2,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("1[-1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("1[0,0]ground",true,0,0,0,0,0,0);

//Town
sprite_change_collision_mask("2[-2,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("2[-1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("2[0,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("2[1,0]ground",true,0,0,0,0,0,0);

//Temple Inside
sprite_change_collision_mask("3[F0]ground",true,0,0,0,0,0,0);

//Temple Basement
sprite_change_collision_mask("4[-1,0]fg",true,0,0,0,0,0,0);
sprite_change_collision_mask("4[-1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("4[0,0]ground",true,0,0,0,0,0,0);


sprite_change_collision_mask("5[-1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("5[-1,-1]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("5[0,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("5[1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("5[2,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("5[2,-1]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("6[F0]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("7[0,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("7[0,-1]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("7[1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("7[1,-1]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("7[2,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("7[2,-1]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("8[0,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("8[0,-1]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("8[1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("8[1,-1]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("8[-1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("8[-1,-1]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("9[0,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("9[0,-1]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("9[1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("9[1,-1]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("9[-1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("9[-1,-1]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("10[0,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("10[-1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("10[1,0]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("11[0,0]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("12[0,0]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("13[0,0]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("14[0,0]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("15[0,0]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("16[0,0]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("17[0,0]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("marble_ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("sewer_ground_left",true,0,0,0,0,0,0);
sprite_change_collision_mask("sewer_water1",true,0,0,0,0,0,0);
sprite_change_collision_mask("sewer_ceil1",true,0,0,0,0,0,0);

sprite_change_collision_mask("sewer1_water_hitbox",true,0,0,0,0,0,0);
sprite_change_collision_mask("sewer2_water_hitbox",true,0,0,0,0,0,0);
sprite_change_collision_mask("sewer3_water_hitbox",true,0,0,0,0,0,0);
sprite_change_collision_mask("sewerh_water_hitbox",true,0,0,0,0,0,0);

sprite_change_offset("sewer_top",1, -2);
sprite_change_offset("sewer_sect1",24, 232);
sprite_change_offset("stall_empty",27, 48);
sprite_change_offset("sewer_bg",-36, 0);
sprite_change_offset("house_main",60, 154);
sprite_change_offset("house1",64, 72);
sprite_change_offset("house_2stor",38, 136);
sprite_change_offset("house_2stor_plath",38, 0);
sprite_change_offset("house_2stor_platl",38, 0);
sprite_change_offset("arch1",54, 0);
//sprite_change_offset("arch1_col",54, 0);
//sprite_change_collision_mask("house_2stor_plath",true,0,0,0,0,0,0);
//sprite_change_collision_mask("house_2stor_platl",true,0,0,0,0,0,0);
sprite_change_offset("underwater",84, 19);
sprite_change_offset("well",24, 70);
sprite_change_offset("light", 39, 46);
sprite_change_offset("light_dimver", 40, 49);
sprite_change_offset("light_dimver_larg", 40*4, 49*3+25);
sprite_change_offset("enemy_10_vision", 0, 84);
sprite_change_offset("house_main_inside",15, 111);
sprite_change_offset("house_main_insideb",15, 111);
sprite_change_collision_mask("house_main_insideb",true,0,0,0,0,0,0);
sprite_change_offset("house_main_insideplat",0, 0);
sprite_change_offset("house_main_transparent",65, 111);
sprite_change_offset("tree1",80, 229);
sprite_change_offset("tree2",46, 161);
sprite_change_offset("bench",13, 9);
sprite_change_offset("arrow",0, 28);
sprite_change_offset("torch",7, 11);
sprite_change_offset("steam_lantern",5, 43);
sprite_change_offset("steam_vfx",32, 32);

sprite_change_offset("small_crate",25, 22);
sprite_change_offset("puff", 5, 60);

//Enemy Declarations - Harbidge
sprite_change_offset("char_arrow",0,0);
sprite_change_offset( "boss_hp_back", 320, 0);
sprite_change_offset( "boss_hp_bar", 320, 0);

//Enemy Offsets
sprite_change_offset("enemy_0_PS_WALK",56, 102);
sprite_change_offset("enemy_0_PS_IDLE",56, 102);
sprite_change_offset("enemy_0_PS_FIRST_JUMP",56, 102);
sprite_change_offset("enemy_0_PS_JUMPSQUAT",56, 102);
sprite_change_offset("enemy_0_PS_LAND",56, 102);
sprite_change_offset("enemy_0_PS_CROUCH",56, 102);
sprite_change_offset("enemy_0_PS_WAVELAND",56, 102);

sprite_change_offset("ou_jab",56, 102);

sprite_change_offset("enemy_1_bighurt",64, 94);
sprite_change_offset("enemy_1_dash",64, 94);
sprite_change_offset("enemy_1_dashstart",64, 94);
sprite_change_offset("enemy_1_dashstop",64, 94);
sprite_change_offset("enemy_1_dashturn",64, 94);
sprite_change_offset("enemy_1_dead",64, 94);
sprite_change_offset("enemy_1_doublejump",64, 94);
sprite_change_offset("enemy_1_hurt",64, 94);
sprite_change_offset("enemy_1_hurtground",64, 94);
sprite_change_offset("enemy_1_idle",64, 94);
sprite_change_offset("enemy_1_jump",64, 94);
sprite_change_offset("enemy_1_jumpstart",64, 94);
sprite_change_offset("enemy_1_land",64, 94);
sprite_change_offset("enemy_1_spinhurt",64, 94);
sprite_change_offset("enemy_1_walk",64, 94);
sprite_change_offset("enemy_1_walkturn",64, 94);

sprite_change_offset("enemy_1_jab",80, 126);
sprite_change_offset("enemy_1_ftilt",64, 94);
sprite_change_offset("enemy_1_dattack",80, 94);
sprite_change_offset("enemy_1_nspecial",96, 94);
sprite_change_offset("enemy_1_nspecial_fx",48, 46);

sprite_change_offset("enemy_2_bighurt",80, 110);
sprite_change_offset("enemy_2_hurt",80, 110);
sprite_change_offset("enemy_2_idle",96, 110);
sprite_change_offset("enemy_2_walkturn",96, 110);
sprite_change_offset("enemy_2_spinhurt",80, 110);

sprite_change_offset("enemy_2_nair",96, 110);
sprite_change_offset("enemy_2_fair",96, 110);
sprite_change_offset("enemy_2_dair",80, 110);
sprite_change_offset("enemy_2_proj",16, 16);

sprite_change_offset("enemy_3_bighurt",96, 158);
sprite_change_offset("enemy_3_downhurt",96, 158);
sprite_change_offset("enemy_3_hurt",96, 158);
sprite_change_offset("enemy_3_hurtbox",96, 160);
sprite_change_offset("enemy_3_hurtground",96, 158);
sprite_change_offset("enemy_3_idle",96, 158);
sprite_change_offset("enemy_3_jump",96, 158);
sprite_change_offset("enemy_3_jumpstart",96, 158);
sprite_change_offset("enemy_3_land",96, 158);
sprite_change_offset("enemy_3_spinhurt",96, 158);
sprite_change_offset("enemy_3_uphurt",96, 158);
sprite_change_offset("enemy_3_walk",96, 158);
sprite_change_offset("enemy_3_walkturn",96, 158);

sprite_change_offset("enemy_3_jab",96, 158);
sprite_change_offset("enemy_3_ftilt",128, 158);
sprite_change_offset("enemy_3_utilt",96, 158);

sprite_change_offset("enemy_4_idle",74, 94);
sprite_change_offset("enemy_4_hurt",74, 94);
sprite_change_offset("enemy_4_spinhurt",74, 94);
sprite_change_offset("enemy_4_walk",74, 94);
sprite_change_offset("enemy_4_walkturn",74, 94);
sprite_change_offset("enemy_4_jumpstart",74, 94);
sprite_change_offset("enemy_4_land",74, 94);
sprite_change_offset("enemy_4_jump",74, 88);
sprite_change_offset("enemy_4_jump_back",74, 88);
sprite_change_offset("enemy_4_nspecial",74, 88);
sprite_change_offset("enemy_4_nspecial_back",74, 88);
sprite_change_offset("enemy_bird_laser",24, 5);

sprite_change_offset("enemy_7_idle",30, 70);
sprite_change_offset("enemy_7_land",30, 70);
sprite_change_offset("enemy_7_walk",36, 62);

sprite_change_offset("enemy_8_idle",104, 144);
sprite_change_offset("enemy_8_spinhurt",104, 144);
sprite_change_offset("enemy_8_hurt",104, 144);
sprite_change_offset("enemy_8_walk",104, 144);
sprite_change_offset("enemy_8_dashstart",104, 144);
sprite_change_offset("enemy_8_dash",104, 144);
sprite_change_offset("enemy_8_jumpstart",104, 144);
sprite_change_offset("enemy_8_jump",104, 144);
sprite_change_offset("enemy_8_doublejump",104, 144);
sprite_change_offset("enemy_8_land",104, 144);
sprite_change_offset("enemy_8_fspecial",104, 144);
sprite_change_offset("enemy_8_fspecial_air",104, 144);

sprite_change_offset("enemy_9_idle",32, 70);

sprite_change_offset("enemy_11_idle",66, 110);
sprite_change_offset("enemy_11_land",66, 110);
sprite_change_offset("enemy_11_walk",66, 110);
sprite_change_offset("enemy_11_nspecial",66, 110);

// sprite_change_offset("enemy_100_idle",48, 126);
// sprite_change_offset("enemy_100_spinhurt",48, 126);
// sprite_change_offset("enemy_100_bighurt",48, 126);
// sprite_change_offset("enemy_100_hurt",48, 126);
// sprite_change_offset("enemy_100_walk",48, 126);
// sprite_change_offset("enemy_100_walkturn",48, 126);
// sprite_change_offset("enemy_100_dashstart",48, 126);
// sprite_change_offset("enemy_100_dash",48, 126);
// sprite_change_offset("enemy_100_dashstop",48, 126);
// sprite_change_offset("enemy_100_dashturn",48, 126);
// sprite_change_offset("enemy_100_jumpstart",48, 126);
// sprite_change_offset("enemy_100_jump",48, 126);
// sprite_change_offset("enemy_100_doublejump",48, 126);
// sprite_change_offset("enemy_100_land",48, 126);
// sprite_change_offset("enemy_100_jab",48, 126);
// sprite_change_offset("enemy_100_utilt",48, 126);
// sprite_change_offset("enemy_100_fthrow",48, 126);
// sprite_change_offset("enemy_100_fthrow_air",48, 126);
// sprite_change_offset("enemy_100_uthrow",48, 126);
// sprite_change_offset("enemy_100_uthrow_air",48, 126);
// sprite_change_offset("enemy_100_nspecial",48, 126);
// sprite_change_offset("enemy_100_nspecial_air",48, 126);
// sprite_change_offset("enemy_100_fspecial",48, 126);
// sprite_change_offset("enemy_100_fspecial_air",48, 126);
// sprite_change_offset("enemy_100_dspecial",48, 126);
// sprite_change_offset("enemy_100_dspecial_air",48, 126);
// sprite_change_offset("enemy_100_uspecial",48, 126);
// sprite_change_offset("enemy_100_nair",48, 126);
// sprite_change_offset("enemy_100_uair",80, 126);
// sprite_change_offset("enemy_100_fair",80, 126);
// sprite_change_offset("enemy_100_dair",64, 94);

sprite_change_offset("enemy_100_idle", 48, 126);
sprite_change_offset("enemy_100_crouch", 48, 126);
sprite_change_offset("enemy_100_walk", 48, 126);
sprite_change_offset("enemy_100_walkturn", 48, 126);
sprite_change_offset("enemy_100_dash", 64, 126);
sprite_change_offset("enemy_100_dashstart", 64, 126);
sprite_change_offset("enemy_100_dashstop", 60, 126);
sprite_change_offset("enemy_100_dashturn", 64, 94);

sprite_change_offset("enemy_100_jumpstart", 48, 126);
sprite_change_offset("enemy_100_jump", 48, 126);
sprite_change_offset("enemy_100_jump2", 48, 126);
sprite_change_offset("enemy_100_doublejump", 48, 126);
sprite_change_offset("enemy_100_walljump", 48, 126);
sprite_change_offset("enemy_100_pratfall", 80, 158);
sprite_change_offset("enemy_100_land", 48, 126);
sprite_change_offset("enemy_100_glockenburn", 48, 126);
sprite_change_offset("enemy_100_landinglag", 48, 126);

sprite_change_offset("enemy_100_hurt", 48, 94);
sprite_change_offset("enemy_100_bighurt", 48, 94);
sprite_change_offset("enemy_100_hurtground", 48, 94);
sprite_change_offset("enemy_100_spinhurt", 48, 94);
sprite_change_offset("enemy_100_uphurt", 48, 94);
sprite_change_offset("enemy_100_downhurt", 48, 94);

sprite_change_offset("enemy_100_parry", 80, 126);
sprite_change_offset("enemy_100_roll_forward", 80, 126);
sprite_change_offset("enemy_100_roll_backward", 80, 126);
sprite_change_offset("enemy_100_airdodge", 48, 126);
sprite_change_offset("enemy_100_waveland", 48, 126);
sprite_change_offset("enemy_100_tech", 48, 126);

sprite_change_offset("enemy_100_jab", 48, 126);
sprite_change_offset("enemy_100_dattack", 48, 126);
sprite_change_offset("enemy_100_ftilt", 48, 126);
sprite_change_offset("enemy_100_dtilt", 48, 126);
sprite_change_offset("enemy_100_utilt", 48, 126);
sprite_change_offset("enemy_100_nair", 48, 126);
sprite_change_offset("enemy_100_fair", 80, 126);
sprite_change_offset("enemy_100_bair", 80, 126);
sprite_change_offset("enemy_100_uair", 80, 126);
sprite_change_offset("enemy_100_dair", 64, 94);
sprite_change_offset("enemy_100_fstrong", 80, 158);
sprite_change_offset("enemy_100_ustrong", 80, 126);
sprite_change_offset("enemy_100_dstrong", 48, 126);
sprite_change_offset("enemy_100_nspecial", 48, 158);
sprite_change_offset("enemy_100_nspecial_air", 80, 158);
sprite_change_offset("enemy_100_fthrow", 80, 126);
sprite_change_offset("enemy_100_fthrow_air", 80, 126);
sprite_change_offset("enemy_100_uthrow", 80, 126);
sprite_change_offset("enemy_100_uthrow_air", 80, 126);
sprite_change_offset("enemy_100_fspecial", 80, 126);
sprite_change_offset("enemy_100_fspecial2", 48, 126);
sprite_change_offset("enemy_100_fspecial_air", 80, 126);
sprite_change_offset("enemy_100_uspecial", 80, 158);
sprite_change_offset("enemy_100_dspecial", 80, 158);
sprite_change_offset("enemy_100_dspecial_air", 80, 158);
sprite_change_offset("enemy_100_taunt", 80, 158);

// sprite_change_offset("sewer1_water_hitbox",0,0);

sprite_change_offset("fx_enemy_abyssdeath",48, 48);
sprite_change_offset("fx_enemy_abyssdeath2",52, 52);