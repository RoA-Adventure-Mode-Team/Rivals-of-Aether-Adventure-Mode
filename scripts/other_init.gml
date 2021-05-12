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
old_pos = [x,y];
//respawn_point = [[79,44],[-1,0],1]; //SubCell Position, Cell Position, Room #
respawn_point = [5500,5300,1]; //x,y, Room #

has_walljump_actual = true;

speedrun_timer = 0;

item_id = noone;

rel_pos = [x-view_get_xview(),y-view_get_yview()];

//Which user_event to run for hitpause
if !("hit_player_event" in self) hit_player_event = -1;

//Lore Booleans
if !("am_is_fire" in self)          am_is_fire = false;
if !("am_is_water" in self)         am_is_water = false;
if !("am_is_air" in self)           am_is_air = false;
if !("am_is_earth" in self)         am_is_earth = false;
if !("am_is_abyssal" in self)       am_is_abyssal = false;
if !("am_is_undead" in self)        am_is_undead = false;
if !("am_is_evil" in self)          am_is_evil = false;
if !("am_is_chaotic" in self)       am_is_chaotic = false;
if !("am_is_subterranain" in self)  am_is_subterranain = false;
if !("am_is_space" in self)         am_is_space = false;
if !("am_is_magic" in self)         am_is_magic = false;
if !("am_is_guest" in self)         am_is_guest = false;





