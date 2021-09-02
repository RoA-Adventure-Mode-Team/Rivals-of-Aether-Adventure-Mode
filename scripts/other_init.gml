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

team = 1; //Players default to the first team
avg_vel = [0,0];
prev_free = free;
god = false;
player_name  = get_char_info(player,INFO_STR_NAME);
p_name  = get_char_info(player,INFO_STR_NAME);
nick = "";
action_manager = 0;
room_manager = 0;
dead_pos = [x,y];
old_pos = [x,y];

respawn_point = [2607,10091,1]; //x,y, Room #

has_walljump_actual = true;

speedrun_timer = 0;

item_id = noone;

rel_pos = [x-view_get_xview(),y-view_get_yview()];

print_debug(player_name);

//Which user_event to run for hitpause
if !("hit_player_event" in self) hit_player_event = -1;

if !("pronouns" in self)   pronouns = ["they","them","their","are"];
                                    //Lore Booleans
//The character's element, defines the general themes of what character's presume about them.
if !("am_is_fire" in self)          am_is_fire = false;             //Is a fire elemental - fire, plasma, smoke, baking
if !("am_is_water" in self)         am_is_water = false;            //Is a water elemental - water, ice, poison
if !("am_is_air" in self)           am_is_air = false;              //Is an air elemental
if !("am_is_earth" in self)         am_is_earth = false;            //Is an earth elemental
if !("am_is_aether" in self)        am_is_aether = false;           //Is an aether elemental
if !("am_is_abyssal" in self)       am_is_abyssal = false;          //Is a creature of the abyss
if !("am_is_subterranain" in self)  am_is_subterranain = false;     //Is from the underground

//Quirks that greatly effect how a character acts and percieves the world
if !("am_is_vocal" in self)         am_is_vocal = true;             //Is capable of speaking/understanding complex languages
if !("am_is_noob" in self)          am_is_noob = false;             //Is unfamiliar with things or naieve
if !("am_is_experienced" in self)   am_is_experienced = false;      //Exude experience

//Timeline Shenanaigains - if they are from Aether, what would the character be regarded as?
if !("am_is_future" in self)        am_is_future = false;           //Is this character from the future (mainly after Story Mode)
if !("am_is_past" in self)          am_is_past = false;             //Is this character from the past (mainly before Story Mode)
if !("am_is_myth" in self)          am_is_myth = false;             //Is this character part of a mythos (or old enough to be subsumed into myth)

//Obvious queues which influences motivations and how characters will approach asking for things.
if !("am_is_evil" in self)          am_is_evil = false;             //Has a self-centered moral compass 
if !("am_is_chaotic" in self)       am_is_chaotic = false;          //Has a particularly flexible moral compass
if !("am_is_insane" in self)        am_is_insane = false;           //Experiences reality in a unique way


//The very nature of the character's constitution
if !("am_is_small" in self)         am_is_small = false;            //If the character is small
if !("am_is_undead" in self)        am_is_undead = false;           //Was dead... now is not
if !("am_is_construct" in self)     am_is_construct = false;        //Is living through unnatural means ("built" instead of "born")
if !("am_is_magic" in self)         am_is_magic = false;            //Is this character supernatural in a magical way
if !("am_is_guest" in self)         am_is_guest = true;             //Is this character a strange visitor from another dimension

//Very Game-breaking or meta flags
if !("am_is_realitybreak" in self)  am_is_realitybreak = false;     //Is this character a reality manipulator
if !("am_is_not" in self)           am_is_not = false;              //They do not belong. They shouldn't be here. They do not belong. They shouldn't be here. They do not belong. They shouldn't be here.

//Base cast AM declarations, will adjust as lore comes out :)
switch p_name {
    case "Zetterburn":
        am_is_fire = true;
        am_is_past = true;
        am_is_experienced = true;
        pronouns = ["he","him","his","is"];
        break;
    case "Forsburn":
        am_is_fire = true;
        am_is_past = true;
        am_is_experienced = true;
        pronouns = ["he","him","his","is"];
        break;
    
}