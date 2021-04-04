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
special_held = 0;
avg_vel = [0,0];
prev_free = free;
god = false;
player_name  = get_char_info(player,INFO_STR_NAME);
action_manager = 0;
room_manager = 0;
dead_pos = [x,y];
//respawn_point = [[79,44],[-1,0],1]; //SubCell Position, Cell Position, Room #
respawn_point = [5500,5300,1]; //x,y, Room #

has_walljump_actual = true;

item_id = noone;

rel_pos = [x-view_get_xview(),y-view_get_yview()];

