//article18_init, Ryken Smoke Object

smoke1_spr = sprite_get("smoke1");
smoke2_spr = sprite_get("smoke2");
smoke3_spr = sprite_get("smoke3");

smoke_timer = 0;
hit_cooldown = 0;
smoke_length = 30; //How long the smoke lasts
smoke_particle_amount = 20; //The amount of smoke particles to create
smoke_spread_dir_min = -45;
smoke_spread_dir_max = 45;
smoke_speed_min = 2;
smoke_speed_max = 5;
smoke_friction = 0.1;
smoke_objects = array_create(0);
players_hit = array_create(0);
parried = false;
hit = 0;

_init = true;
disable_movement = true;

sprite_index = asset_get("empty_sprite");