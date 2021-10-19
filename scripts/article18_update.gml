//article18_update, Ryken Smoke Object

if (_init) {
    for (var i = 0; i < smoke_particle_amount; i++) {
        smoke_objects[i] = {
            dir : 0,
            spd : 0,
            float_offset : 0,
            size : 0,
            fade_offset : 0,
            hit : 0,
            
            smoke_friction : 0,
            smoke_length : 1,
            smoke_timer : 0,
            spr_dir : 1,
            
            visible : false,
            sprite_index : sprite_get("smoke1"),
            mask_index : sprite_get("smoke1")
        }        
        smoke_objects[i].dir = smoke_spread_dir_min + ((smoke_spread_dir_max - smoke_spread_dir_min) * ( (i * 7) / smoke_particle_amount % 1.4));
        smoke_objects[i].spd =  lerp(smoke_speed_min, smoke_speed_max, (i * 32) / smoke_particle_amount % 1.5);
        smoke_objects[i].x = x + lengthdir_x(smoke_objects[i].spd*2, smoke_objects[i].dir) * spr_dir;
        smoke_objects[i].y = y + lengthdir_y(smoke_objects[i].spd*2, smoke_objects[i].dir);
        smoke_objects[i].size = random_func(i, 3, true);
        smoke_objects[i].fade_offset = random_func(i+3, 7, true);
        smoke_objects[i].float_offset = -90 + random_func(i+4, 180, true);
        smoke_objects[i].smoke_friction = smoke_friction;
        smoke_objects[i].smoke_length = smoke_length;
        smoke_objects[i].player_id = player_id;
        smoke_objects[i].spr_dir = spr_dir;
        smoke_objects[i].parent = id;
    }
    depth = 0;
    _init = false;
}
else {
    for (var i = 0; i < array_length(smoke_objects); i++) {
        with (smoke_objects[i]) {
            smoke_timer ++;
            x += lengthdir_x(spd, dir) * spr_dir;
            y += lengthdir_y(spd, dir);
            
            spd = max(spd * (1-smoke_friction), 0);
            
            x += lengthdir_x(0.15, smoke_timer + float_offset);
            y += lengthdir_y(0.15, smoke_timer + float_offset);
            
            if (parent.hit < 2 && hit = 0 && smoke_timer > 2) {
                with (oPlayer) {
                    if (id == other.player_id) continue;
                    if point_distance(x, y, other.x, other.y)  < 32 {
                        if (array_find_index(other.parent.players_hit, id) < 0 && !clone) {
                            array_push(other.parent.players_hit, id);
                        }
                    }
                }
                if (instance_exists(asset_get("plasma_field_obj"))) {
                    var clairen_nfz_near = instance_nearest(x, y, asset_get("plasma_field_obj"));
                    if point_distance(x, y, get_instance_x(clairen_nfz_near), get_instance_y(clairen_nfz_near))  < 224 {
                        parent.parried = true;
                    }
                }
            }
            
            if (smoke_timer >= smoke_length + fade_offset) {
                 hit = 1;
            }
            
            if (hit == 1 || other.parried) {
                if (size < 10) {
                    size += 0.5;
                }
            }
        }
    }
    
    if (array_length(players_hit) > 0) {
        for (var i = 0; i < array_length(players_hit); i++) {
            var player_near = players_hit[i];
            if (instance_exists(player_near)) {
                if (!player_id.was_parried && player_near.invince_time <= 0) {
                    if (player_id.grabbedid == player_near) {
                        if (!player_near.smoked) {
                            sound_play(sound_get("sfx_ryk_smoked"));
                        }
                        player_near.smoked = true;
                        player_near.smoked_id = player_id;
                        with (player_id)
                            player_near.smoked_timer = 240 + (has_rune("B") * 180);
                    }
                    else {
                        with player_id {
                            var can_h = true;
                            //if (has_rune("G")) { 
                            if (instance_exists(asset_get("plasma_field_obj"))) {
                                var clairen_nfz_near = instance_nearest(other.x, other.y, asset_get("plasma_field_obj"));
                                if point_distance(other.x, other.y, get_instance_x(clairen_nfz_near), get_instance_y(clairen_nfz_near))  < 224 {
                                    can_h = false;
                                }
                            }
                            var smoke_obj = noone;
                            var smoke_dist = 9999;
                            for (var i = 0; i < array_length(other.smoke_objects); i++) {
                                if other.smoke_objects[i].size < 10 {
                                    var dist = point_distance(other.smoke_objects[i].x, other.smoke_objects[i].y, player_near.x, player_near.y);
                                    if (dist < smoke_dist) {
                                        smoke_obj = other.smoke_objects[i];
                                        smoke_dist = dist;
                                    }
                                }
                            }
                            
                            
                            if (smoke_obj != noone && smoke_obj.size < 10 && can_h && player_near.smoke_hit_cooldown <= 0 && other.hit <= 2) {
                                switch (other.hit) {
                                    case 0:
                                        create_hitbox(AT_EXTRA_1, 1, round(smoke_obj.x), round(smoke_obj.y));
                                        player_near.smoke_hit_cooldown = 5;
                                        break;
                                    case 1:
                                        create_hitbox(AT_EXTRA_1, 2, round(smoke_obj.x), round(smoke_obj.y));
                                        player_near.smoke_hit_cooldown = 5;
                                        break;
                                    case 2:
                                        create_hitbox(AT_EXTRA_1, 3, round(smoke_obj.x), round(smoke_obj.y));
                                        player_near.smoke_hit_cooldown = 10;
                                        break;
                                }
                                var can_h2 = true;
                                if (can_h2)
                                    other.hit++;
                                if (other.hit >= 2) {
                                    other.parried = true;
                                }
                            }
                            //}
                            /*
                            else {
                                player_near.smoked_damage = true;
                                if (!player_near.smoked) {
                                    sound_play(sound_get("sfx_ryk_smoked"))
                                }
                                player_near.smoked = true;
                                player_near.smoked_id = id;
                                player_near.smoked_timer = 240 + (has_rune("B") * 180);
                            }
                            */
                        }
                    }    
                }
            }
        }
    }
    var smoke_done = true;
    for (var i = 0; i < array_length(smoke_objects); i++) {
        if smoke_objects[i].size < 10 {
            smoke_done = false;
        }
    }
    
    if (smoke_done) {
        instance_destroy();
        exit;
    }
}