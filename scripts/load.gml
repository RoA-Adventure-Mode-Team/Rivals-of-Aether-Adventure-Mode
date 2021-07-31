//

//sprite_change_offset("ground_strip", 0, 100);
sprite_change_offset("char_arrow",0,0);
sprite_change_offset( "boss_hp_back", 320, 0);
sprite_change_offset( "boss_hp_bar", 320, 0);

sprite_change_offset("bg2",240, 135);
sprite_change_offset("bg3",240, 135);

sprite_change_offset("column_deco",210, 310);
sprite_change_offset("column_deco_black",210, 310);

sprite_change_offset("stall",27, 48);
sprite_change_offset("ground",-32, 0);
sprite_change_offset("marble_ground",-32, 0);
sprite_change_offset("ground_top",-32, 0);
sprite_change_offset("black",-32, 0);

//Need to set sprite collisions here!
sprite_change_collision_mask("ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("[-3,-1]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("[-3,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("[-2,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("[-1,0]ground",true,0,0,0,0,0,0);

//Town
sprite_change_collision_mask("2[-2,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("2[-1,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("2[0,0]ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("2[1,0]ground",true,0,0,0,0,0,0);

sprite_change_collision_mask("marble_ground",true,0,0,0,0,0,0);
sprite_change_collision_mask("sewer_ground_left",true,0,0,0,0,0,0);
sprite_change_collision_mask("sewer_water1",true,0,0,0,0,0,0);
sprite_change_collision_mask("sewer_ceil1",true,0,0,0,0,0,0);
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
sprite_change_offset("enemy_4_walk",74, 94);
sprite_change_offset("enemy_4_walkturn",74, 94);
sprite_change_offset("enemy_4_jumpstart",74, 94);
sprite_change_offset("enemy_4_land",74, 94);
sprite_change_offset("enemy_4_jump",74, 88);
sprite_change_offset("enemy_4_jump_back",74, 88);
sprite_change_offset("enemy_4_nspecial",74, 88);
sprite_change_offset("enemy_4_nspecial_back",74, 88);
sprite_change_offset("enemy_bird_laser",24, 5);

sprite_change_offset("fx_enemy_abyssdeath",48, 48);
sprite_change_offset("fx_enemy_abyssdeath2",52, 52);