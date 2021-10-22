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
death_cooldown = 0;
death_cooldown_max = 120;
old_pos = [x,y];

respawn_point = [2477,10455,1]; //x,y, Room #

has_walljump_actual = true;

speedrun_timer = 0;

item_id = noone;

rel_pos = [x-view_get_xview(),y-view_get_yview()];

//Which user_event to run for hitpause
if !("hit_player_event" in self) hit_player_event = -1;

//How should this character be addressed?
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
if !("am_is_verbal" in self)        am_is_verbal = true;            //Is capable of speaking complex languages
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
if !("am_is_undead" in self)        am_is_undead = false;           //Was dead... now is not
if !("am_is_construct" in self)     am_is_construct = false;        //Is living through unnatural means ("built" instead of "born")
if !("am_is_magic" in self)         am_is_magic = false;            //Is this character supernatural in a magical way
if !("am_is_big" in self)           am_is_big = false;              //Is this character much larger than average?
if !("am_is_small" in self)         am_is_small = false;            //Is this character much smaller than average?
if !("am_is_handed" in self)        am_is_handed = true;            //Does this character have appendages to hold things with?
if !("am_is_clothed" in self)       am_is_clothed = true;           //Does this character wear clothing?

if !("am_is_guest" in self)         am_is_guest = true;             //Is this character an atherian local, or are they a strange guest from another dimension?

//Narrative-breaking meta flags
if !("am_is_realitybreak" in self)  am_is_realitybreak = false;     //Is this character a reality manipulator
if !("am_is_not" in self)           am_is_not = false;              //They do not belong. They shouldn't be here. They do not belong. They shouldn't be here. They do not belong. They shouldn't be here.

// am_is_not = true; //Debug for fun!   

//Base cast AM declarations, will adjust as lore comes out :)
switch p_name {
    //No talk me angy
    case "Zetterburn":
        am_is_fire = true;
        // am_is_past = true;
        // am_is_experienced = true;
        // am_is_clothed = false; LOINCLOTH
        am_is_guest = false; 
        pronouns = ["he","him","his","is"];
        break;
    //Bastard turned good boi
    case "Forsburn":
        am_is_fire = true;
        // am_is_past = true;
        // am_is_experienced = true;
        am_is_guest = false; 
        pronouns = ["he","him","his","is"];
        break;
    //Protagonist Prime
    case "Clairen":
        am_is_fire = true;
        am_is_future = true;
        am_is_experienced = true;
        am_is_guest = false; 
        pronouns = ["she","her","hers","is"];
        break;
    //Hands off my bread government
    case "Mollo":
        am_is_fire = true;
        am_is_future = true;
        am_is_experienced = true;
        am_is_chaotic = true;
        am_is_guest = false; 
        pronouns = ["he","him","his","is"];
        break;
    //I speak for the trees
    case "Maypul":
        am_is_earth = true;
        // am_is_experienced = true;
        am_is_clothed = false;
        am_is_guest = false; 
        pronouns = ["she","her","hers","is"];
        break;
    //Rocc :)
    case "Kragg":
        am_is_earth = true;
        am_is_verbal = false;
        am_is_experienced = true;
        am_is_insane = true;
        am_is_clothed = false;
        am_is_guest = false; 
        pronouns = ["he","him","his","is"];
        break;
    //I AM the trees. And the vines. And the flowers.
    case "Sylvanos":
        am_is_earth = true;
        am_is_experienced = true;
        am_is_myth = true;
        am_is_verbal = false;
        am_is_evil = true;
        am_is_chaotic = true;
        am_is_insane = true;
        am_is_clothed = false;
        am_is_big = true;
        am_is_handed = false;
        am_is_guest = false; 
        pronouns = ["he","him","his","is"];
        break;
    //Love the character
    case "Olympia":
        am_is_earth = true;
        am_is_subterranain = true;
        am_is_noob = true;
        am_is_experienced = true;
        am_is_guest = false; 
        pronouns = ["she","her","hers","is"];
        break;
    //Trickster god and lovecraftian horror
    case "Orcane":
        am_is_water = true;
        am_is_noob = true; //Does not mean he's naieve - just that others percieve it
        // am_is_undead = true; //when orcane side specials are we sure it's the same orcane?
        am_is_myth = true;
        am_is_verbal = false;
        // am_is_experienced = true; //Does not mean he's experienced - it means others do not percieve it
        am_is_handed = false;
        am_is_guest = false; 
        // am_is_not = true;
        pronouns = ["he","him","his","is"];
        break;
    //ICE FUCKED UP GOTTA UNFUCKUP THE ICE
    case "Etalus":
        am_is_water = true;
        // am_is_noob = true;
        // am_is_verbal = false; //??? on this one
        am_is_experienced = true;
        am_is_big = true;
        am_is_guest = false; 
        pronouns = ["he","him","his","is"];
        break;
    //Master Cai better have lived a long, good life I stg frog boy doesn't deserve tragedy
    case "Ranno":
        am_is_water = true;
        am_is_experienced = true;
        am_is_guest = false; 
        pronouns = ["he","him","his","is"];
        break;
    //Monke
    case "Hodan":
        am_is_water = true;
        am_is_aether = true; //Wild guess but here we go
        am_is_experienced = true;
        am_is_insane = true;
        am_is_guest = false; 
        pronouns = ["he","him","his","is"];
        break;
    //Racist bottom text
    case "Wrastor":
    case "Bradshaw":
        am_is_air = true;
        am_is_experienced = true;
        am_is_evil = true;
        am_is_guest = false; 
        pronouns = ["he","him","his","is"];
        break;
    //We need more lore on her. Ok she's the storm's architect BUT WHAT DOES THAT MEAN???
    case "Absa":
        am_is_air = true;
        am_is_experienced = true;
        // am_is_evil = true;
        am_is_guest = false; 
        pronouns = ["she","her","hers","is"];
        break;
    //Turned that mindset into a grindset (grinding bird bones that is)
    case "Elliana":
        am_is_evil = true; //Still, did nothing wrong
    case "Ayala":
        am_is_air = true;
        am_is_experienced = true;
        am_is_chaotic = true; //She helped the "bad guys" a *lot*
        // am_is_future = true;
        am_is_guest = false; 
        pronouns = ["she","her","hers","is"];
        break;
    //
    case "Pomme":
        am_is_air = true;
        am_is_evil = true;
        am_is_experienced = true;
        am_is_future = true;
        am_is_guest = false; 
        pronouns = ["she","her","hers","is"];
        break;
    //Upair is a kill move
    case "Ori":
        am_is_aether = true;
        am_is_verbal = false;
        am_is_magic = true;
        am_is_small = true; //Cannon Ori is tiny
        am_is_experienced = true;
        //They are a leaf and I don't think we get cannonical pronouns
        break;
    //????
    case "Shovel Knight":
    case "Gus":
        // am_is_aether = true;
        am_is_magic = true; //He collects artifacts wth magical powers
        am_is_experienced = true;
        am_is_subterranain = true;
        pronouns = ["he","him","his","is"];
        break;
}

//AM - Specific variables
//Rykenburn
smoked = false;
smoke_hit_cooldown = 0;
smoked_id = noone;
