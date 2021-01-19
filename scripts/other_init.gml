//other_init - runs variables to players

temp_pause = noone;

last_pos = [x,y];

down_held = 0;
up_held = 0;
left_held = 0;
right_held = 0;
keep_dash = false;

taunt_held = 0;
attack_held = 0;
avg_vel = [0,0];

//respawn_point = [[79,44],[-1,0],1]; //SubCell Position, Cell Position, Room #
respawn_point = [[58,44],[0,0],1]; //SubCell Position, Cell Position, Room #

has_walljump_actual = true;

item_id = noone;

rel_pos = [x-view_get_xview(),y-view_get_yview()];

