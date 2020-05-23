//

print_debug("Init Time setting is "+string(get_match_setting(SET_TIMER)));
updated = 0;


//Debug Vars
debug = true;
down_down = 0;
up_down = 0;
last_ID = 0;

//Platforms (article1)

//Trigger Objects(article2)

//Scene/Room Manager (article3) 
list_window = ds_list_create();

follow_player = noone;
with oPlayer {
    if !variable_instance_exists(self, "is_ai") other.follow_player = id;
}

//Area Triggers (article4)

//Room Manager (article5)

