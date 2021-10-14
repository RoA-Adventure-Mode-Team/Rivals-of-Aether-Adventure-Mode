// Load Action Data - Action Manager

//Enum & Macro Declarations, DO NOT EDIT

/*enum WIN {
    HUD_TXT,
    HUD_SPR,
    OBJ_SPR,
    WLD_CAM,
    WLD_TXT,
    WLD_SPR,
    PLR_CTL
}*/
//Update enums article3_update, draw_hud, and user_event0
enum LWO {
    TXT_HUD,
    TXT_WLD,
    CAM_WLD,
    SPR_HUD,
    SPR_WLD,
    PLR_CTL
}

enum ACT {
    CAMERA, //Sets the camera to a specific point
    //action_time, x, y, focus_type, smooth 
    WINDOW, //Makes a hud window
    //window_num, x, y, [contentoverride]
    CONTROL, //Controls players
    //player_id, life_time, state_override, input_array
    SPRITE,
    
    WAIT, //waits
    //frames
    PLAY_SOUND,
    //sound_name
    SET, //Set data
    //article_id, variable, value, ease_type, ease_length
    ON_INPUT, //Do a thing when a player presses a button
    //follow_player?, input_type
    SW_ROOM, //Switch the room
    //to_room, to_coords
    QUEST_PROG, //Quest-related actions
    //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
    ON_QUEST_PROG,
    //quest_id, progress_proc
    SUS, //Suspend Action by ID
    //suspend_bool, action_id
    KILL, //Remove the first of the action type given
    //action_id
    SPAWN_ART, //Spawn articles with the
    //[room_format]
    CHECK, //End action upon the condition being true
    //article_group, variable, condition
    ART_COUNT, //When the article count for the following article drops a threshold, continue
    //article_group, threshold, [lower than or equal:0 greater than or equal:1]
    SCENE, //Switches the scene
    //0:set,1:add, scene id
    RANDOM, //Pick a random exit action to do
    //seed
    SET_RELATIVE, //Set data relative to whatever caused this action (by default, passed by trigger zones)?
    //variable, value, ease_type, ease_length
    EVENT, //Trigger an item event?
    //event_id
    HITBOX, //Spawn a hitbox at an intersect location upon entering
    //attack_id, hitbox_id
    KILLBOX, //Spawn a killbox at an intersect location upon entering, killing whatever has intersected
    //killbox background
    TRANS_MUSIC, //transition music with a crossfade time (time of zero is a cut)
    //to_music_index, fade_time
    DESPAWN, //Article group to despawn/remove 
    //article_id
}

//Reset Arrays
action_array = [];
scene_array = [];
//

//Scene & Action Data Here

//Room 0: Global action declarations? (TODO IF USEFUL)
// action_add(0, 1, 1, ACT.WAIT,   //room_id, scene_id, action_id, action_type
// [120],                          //Action arguments
// []);                           //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(0, 3, 1, ACT.SET,  
[2, "bg_color", $718ae1], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(0, 4, 1, ACT.SET,  
[2, "bg_color", $718ae1], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(0, 5, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(0, 6, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(0, 7, 1, ACT.SET,  
[2, "bg_color", $888888], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Room 1: Kei Outside

// scene_add(1, 1, []);
// //Set the Room Lighting - $2c77a8 for evening, $813030 for night, $333333 for dark
// action_add(1, 0, 1, ACT.SET,  
// [2, "bg_color", $333333, 0, 60], //article_group, variable, value, ease_type, ease_length
// [2]); //Actions to start on exit

// scene_add(1, 1, []);
action_add(1, 0, 1, ACT.TRANS_MUSIC, 
["Fire_Capital_Calm"], //music_name
[3,6]); //Actions to start on exit //DEBUG Events
// [3]); //Actions to start on exit

action_add(1, 0, 3, ACT.WINDOW, 
[2, 200, 100, [[],["Outskirts"],[],["Outskirts"]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//DEBUG: Note Take -> Credits Scrolling
action_add(1, 0, 2, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("noteExample")]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//DEBUG - To Sewer Scene
action_add(1, 0, 6, ACT.SCENE, 
// [0, 7], //[0:set,1:add, scene id]
[0, 3], //[0:set,1:add, scene id]
[]); //Actions to start on exit

//DEBUG - Get A Key
action_add(1, 0, 4, ACT.SPAWN_ART,
[[-3,0],[10,34,42,0,-6,[2,sprite_get("item_2"),1000,1,0,"Aqueduct Key",0,0],[0,0]]], //cell, [room_format]
[]); //Actions to start on exit

action_add(1, 1, 1, ACT.WAIT,   //room_id, scene_id, action_id, action_type
[1],                          //Action arguments
[2]);                         //Actions to start on exit


//Start Quest Dialog
action_add(1, 1, 2, ACT.WINDOW, //Start this once at scene start.. successive scene changes should never start this again
[5, 0, 400, []], //window_type, x, y, [contentoverride]
[]); //Actions to start on exit

// //Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
// action_add(1, 1, 3, ACT.SET,  
// [2, "bg_color", $718ae1, 0, 60], //article_group, variable, value, ease_type, ease_length
// []); //Actions to start on exit


// action_add(1, 1, 2, ACT.CONTROL,//<-- Creating one indefinite Control action for later use
// [-1, all, PS_SPAWN], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
// []); //Actions to start on exit

// action_add(1, 1, 3, ACT.SUS,//<-- Immediately suspending the action for use later
// [1, 2], //suspend_bool, action_id
// []); //Actions to start on exit

//// 10: Kei Rescue

action_add(1, 1, 10, ACT.WAIT, 
[2], //time
[11]); //Actions to start on exit

//Kei Dialog Help 1
action_add(1, 1, 11, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[1,1]]], //window_type, x, y, [contentoverride]
[13,14]); //Actions to start on exit

// //Freeze the player
// action_add(1, 1, 12, ACT.SUS,
// [1, 2], //suspend_bool, action_id
// []); //Actions to start on exit

//Kei Defend Quest Update
action_add(1, 1, 13, ACT.QUEST_PROG, 
[1, 0, 1], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

//Spawn 1 Ravager
action_add(1, 1, 14, ACT.SPAWN_ART,
[[-2,0],[6, 66, 30, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,12]]], //cell, [room_format]
[16]); //Actions to start on exit

// //Unfreeze the player
// action_add(1, 1, 15, ACT.SUS,
// [0, 2], //suspend_bool, action_id
// [16]); //Actions to start on exit

////16: Kei Help Complete

//On defeating the ravager
action_add(1, 1, 16, ACT.ART_COUNT,
[12,0,0], //article_group, threshold, [lower than or equal:0 greater than or equal:1]
[17,18,19]); //Actions to start on exit
// [17,18,19]); //Actions to start on exit

//Spawn 1 Ravager
action_add(1, 1, 17, ACT.SPAWN_ART,
[[-2,0],[6, 66, 30, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,13]]], //cell, [room_format]
[]); //Actions to start on exit

//Spawn 1 Ravager
action_add(1, 1, 18, ACT.SPAWN_ART,
[[-2,0],[6, 96, 30, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,13]]], //cell, [room_format]
[]); //Actions to start on exit

//On defeating the above ravagers
action_add(1, 1, 19, ACT.ART_COUNT,
[13,0,0], //article_group, threshold, [lower than or equal:0 greater than or equal:1]
[20,21]); //Actions to start on exit

//Kei Dialog Help Complete
action_add(1, 1, 20, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[2,1]]], //window_type, x, y, [id, progress]
[22,25]); //Actions to start on exit

//Kei Defend Quest Complete
action_add(1, 1, 21, ACT.QUEST_PROG, 
[1, 0, 2], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

//To Town Quest Start
action_add(1, 1, 22, ACT.QUEST_PROG, 
[2, 0, 1], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

//Set Kei's waypoint
action_add(1, 1, 23, ACT.SET,  
[11, "waypoint_index", 1], //article_group, variable, value, ease_type, ease_length
[24]); //Actions to start on exit

//Kei Dialog Extra
action_add(1, 1, 24, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[3,1,0]]], //window_type, x, y, [id, progress]
[]); //Actions to start on exit

//Set Kei's waypoint, meet up to Extra Dialog
action_add(1, 1, 25, ACT.SET,  
[11, "waypoint_index", 0], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(1, 3, 1, ACT.SET,  
[2, "bg_color", $718ae1, 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(1, 4, 1, ACT.SET,  
[2, "bg_color", $813030, 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

////2: Kei After Door
// action_add(2, 1, 1, ACT.WAIT,   //room_id, scene_id, action_id, action_type
// [1],                          //Action arguments
// [2]);                         //Actionsto start on exit

//2: Hallowflame
action_add(2, 0, 1, ACT.TRANS_MUSIC, 
["Fire_Capital_Calm"], //window_type, x, y, [contentoverride]?
[4]); //Actions to start on exit

//Guard Dialogs
action_add(2, 0, 2, ACT.WINDOW,
[3, 2, -3, [[8]]], //window_type, x, y, [id]
[]); //Actions to start on exit

//NGuard Killbox
action_add(2, 0, 3, ACT.KILLBOX,
[2], //window_type, x, y, [id]
[]); //Actions to start on exit

action_add(2, 0, 4, ACT.WINDOW, 
[2, 200, 100, [[],["Hallowflame"],[],["Hallowflame"]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//Spawn 1 Kei for dialog
action_add(2, 1, 1, ACT.SPAWN_ART,
[[-1,0],[6,0.88,43.94,0,-5,[7,0,0,0,0,0,0,0,],[0,0]]], //cell, [room_format] 
[2]); //Actions to start on exit

//To Town Quest Complete
action_add(2, 1, 2, ACT.QUEST_PROG, 
[2, 0, 2], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[3]); //Actions to start on exit

//Kei Introduction Dialog
action_add(2, 1, 3, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[4,1,1]]], //window_type, x, y, [id, progress, freeze_player]
[4]); //Actions to start on exit

//Kei Introduction Teleport to Temple
action_add(2, 1, 4, ACT.SW_ROOM, 
[3, [9851,10185]], //to_room, to_coords
[]); //Actions to start on exit

//Scene 3: Dialog with Mage
//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(2, 3, 1, ACT.SET,  
[2, "bg_color", $718ae1], //article_group, variable, value, ease_type, ease_length
[9,6,8]); //Actions to start on exit

//Mage Dialog
action_add(2, 3, 2, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[9,1]]], //window_type, x, y, [id, progress]
[3]); //Actions to start on exit

//Rubbish "Quest" Complete
action_add(2, 3, 3, ACT.QUEST_PROG, 
[4, 0, 2], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[4]); //Actions to start on exit

//Meet Mage Quest Start
action_add(2, 3, 4, ACT.QUEST_PROG, 
[5, 1, 1], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[7]); //Actions to start on exit

//Change scene to night - wait a frame so that actions get processed
action_add(2, 3, 5, ACT.SCENE,
[0, 4], //[0:set,1:add, scene id]
[]); //Actions to start on exit ON THE NEW SCENE

//Spawn 1 Mage for dialog
action_add(2, 3, 6, ACT.SPAWN_ART,
[[0,0],[6,15,43.94,0,-5,[11,0,0,0,0,0,0,0,],[0,14]]], //cell, [room_format] 
[]); //Actions to start on exit

// action_add(2, 3, 7, ACT.SET,  
// [14, "do_poof", true], //article_group, variable, value, ease_type, ease_length
// [5]); //Actions to start on exit

action_add(2, 3, 7, ACT.SET,  
[14, "next_attack", AT_NSPECIAL], //article_group, variable, value, ease_type, ease_length
[8,11]); //Actions to start on exit

//Remove the camera lock 
action_add(2, 3, 8, ACT.SET,
[3,"state",2], //article_id, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Mage Dialog - intro
action_add(2, 3, 9, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[12,1]]], //window_type, x, y, [id, progress]
[10,2]); //Actions to start on exit

//Spawn A Camera Controller
action_add(2, 3, 10, ACT.SPAWN_ART,
[[0,0],[7,-4,30,0,0,[0,40*16,20*16,0,0,0,0,0,],[0,3]]], //cell, [room_format] 
[]); //Actions to start on exit

//Change scene to night - wait a frame so that actions get processed
action_add(2, 3, 11, ACT.WAIT,   //room_id, scene_id, action_id, action_type
[1],                          //Action arguments
[5]);                         //Actions to start on exit

//Scene 4: Freeroam Afternoon
// //Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
// action_add(2, 4, 1, ACT.SET,  
// [2, "bg_color", $718ae1, 0, 60], //article_group, variable, value, ease_type, ease_length
// []); //Actions to start on exit

//Set witch to dissapear 
// action_add(2, 4, 2, ACT.SET,  
// [13, "next_attack", AT_NSPECIAL, 1, 1], //article_group, variable, value, ease_type, ease_length
// []); //Actions to start on exit

//Scene 5: Night Lacuna search

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(2, 5, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[2]); //Actions to start on exit

action_add(2, 5, 2, ACT.SET,  
[4, "destroyed", true], //article_group, variable, value, ease_type, ease_length
[3]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 5, 3, ACT.SPAWN_ART,
[[-1,0],[6, 30, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[4]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 5, 4, ACT.SPAWN_ART,
[[0,0],[6, 110, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[5]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 5, 5, ACT.SPAWN_ART,
[[0,0],[6, 70, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[6]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 5, 6, ACT.SPAWN_ART,
[[-1,0],[6, 110, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[7]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 5, 7, ACT.SPAWN_ART,
[[-1,0],[6, 158, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(2, 6, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[2]); //Actions to start on exit

action_add(2, 6, 2, ACT.SET,  
[4, "destroyed", true], //article_group, variable, value, ease_type, ease_length
[3]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 6, 3, ACT.SPAWN_ART,
[[-1,0],[6, 30, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[4]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 6, 4, ACT.SPAWN_ART,
[[0,0],[6, 110, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[5]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 6, 5, ACT.SPAWN_ART,
[[0,0],[6, 70, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[6]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 6, 6, ACT.SPAWN_ART,
[[-1,0],[6, 110, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[7]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 6, 7, ACT.SPAWN_ART,
[[-1,0],[6, 158, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[]); //Actions to start on exit


////3: Temple Inside 
//Scene 1: Ryken Intro
//Rykenburn Discussion
action_add(3, 0, 1, ACT.WINDOW, 
[2, 200, 100, [[],["Temple"],[],["Temple"]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//Rykenburn Introduction Dialog
action_add(3, 1, 1, ACT.WINDOW, 
[6, dialog_x, hdialog_y, [[5,1]]], //window_type, x, y, [id, progress, freeze_player]
[2]); //Actions to start on exit

//Supplier Quest Start
action_add(3, 1, 2, ACT.QUEST_PROG, 
[3, 1, 2], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[3]); //Actions to start on exit

//Set Scene out of Intro
action_add(3, 1, 3, ACT.SCENE, 
[0, 2], //[0:set,1:add, scene id]
[]); //Actions to start on exit

//Scene 2: Update on Crate Quest

//Supplier Quest Update On Crate Gather
action_add(3, 2, 1, ACT.ON_QUEST_PROG, 
[3, 5, 1], //quest_id, progress_proc, [0: exact, 1: greater than equal]
[2]); //Actions to start on exit

//Rykenburn Supplier Complete Dialog
action_add(3, 2, 2, ACT.WINDOW, 
[6, dialog_x, hdialog_y, [[7,1]]], //window_type, x, y, [id, progress, freeze_player]
[3]); //Actions to start on exit

//Supplier Quest Complete
action_add(3, 2, 3, ACT.QUEST_PROG, 
[3, 1, 7], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[4]); //Actions to start on exit

//Rubbish "Quest" Start
action_add(3, 2, 4, ACT.QUEST_PROG, 
[4, 0, 1], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[5]); //Actions to start on exit

//Supplier Quest - update scene to post-crates
action_add(3, 2, 5, ACT.SCENE, 
[0, 3], //[0:set,1:add, scene id]
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(3, 5, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[2]); //Actions to start on exit

//Despawn Kei, Rykenburn
action_add(3, 5, 2, ACT.DESPAWN,  
[5], //article_group
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(3, 6, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[2]); //Actions to start on exit

//Despawn Kei, Rykenburn
action_add(3, 6, 2, ACT.DESPAWN,  
[5], //article_group
[]); //Actions to start on exit


//4: Temple Basement
//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(4, 0, 1, ACT.SET,  
[2, "bg_color", $333333], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//NGuard Killbox
action_add(4, 0, 3, ACT.KILLBOX,
[2], //[attack, index]
[]); //Actions to start on exit

//Note Exp5
action_add(4, 0, 4, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_exp5")]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//Note Key
action_add(4, 0, 5, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_key")]]], //window_type, x, y, [contentoverride]?
[6]); //Actions to start on exit

//Spawn 1 Key Item
action_add(4, 0, 6, ACT.SPAWN_ART,
[[-1,0],[10,17,22,0,-6,[2,sprite_get("item_2"),1000,1,0,"Aqueduct Key",0,0],[0,0]]], //cell, [room_format]
[7]); //Actions to start on exit

//Lacuna Question - Aqueduct Enter
action_add(4, 0, 7, ACT.QUEST_PROG, 
[5, 0, 5], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

// //Decend into Darkness - Aqueduct Enter
// action_add(4, 0, 8, ACT.QUEST_PROG, 
// [6, 0, 1], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
// []); //Actions to start on exit

////5: Supplier Meadows
action_add(5, 0, 1, ACT.WINDOW, 
[2, 200, 100, [[],["Meadows"],[],["Meadows"]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//Supplier Info Dialog
action_add(5, 0, 2, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[6,1,1]]], //window_type, x, y, [id, progress, freeze_player]
[3]); //Actions to start on exit

//Supplier Quest Update
action_add(5, 0, 3, ACT.QUEST_PROG, 
[3, 0, 2], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

//Supplier Quest Plus Crate (Reuse a few times)
action_add(5, 0, 4, ACT.QUEST_PROG, 
[3, 2, 1], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

// //Supplier Quest Update On Crate Gather
// action_add(5, 0, 5, ACT.ON_QUEST_PROG, 
// [3, 5, 1], //quest_id, progress_proc, [0: exact, 1: greater than equal]
// []); //Actions to start on exit

//Supplier Quest - update scene to post-crates
action_add(5, 0, 6, ACT.SCENE, 
[0, 3], //[0:set,1:add, scene id]
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(5, 0, 8, ACT.SET,  
[2, "bg_color", $718ae1, 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit


//DEBUG
// //Supplier Quest Start
// action_add(5, 0, 7, ACT.QUEST_PROG, 
// [3, 1, 2], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
// []); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(5, 3, 1, ACT.SET,  
[2, "bg_color", $718ae1, 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(5, 4, 1, ACT.SET,  
[2, "bg_color", $813030, 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(5, 5, 1, ACT.SET,  
[2, "bg_color", $813030, 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

////7: Sewer

//Room Title Card
//Set the Room Lighting - $2c77a8 for evening, $813030 for night, $333333 for dark
// action_add(7, 0, 1, ACT.SET,  
// [2, "bg_color", $888888], //article_group, variable, value, ease_type, ease_length
// [2]); //Actions to start on exit

//Placeholder
action_add(7, 0, 1, ACT.WAIT, 
[2], //time
[2,3,4]); //Actions to start on exit

action_add(7, 0, 2, ACT.WINDOW, 
[2, 200, 100, [[],["Underground Aqueduct"],[],["Underground Aqueduct"]]], //window_type, x, y, [contentoverride]?
[3]); //Actions to start on exit

//Set to Sewer Scene
action_add(7, 0, 3, ACT.SCENE, 
[0, 7], //[0:set,1:add, scene id]
[7]); //Actions to start on exit

action_add(7, 0, 4, ACT.QUEST_PROG, 
[5, 0, 6], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[5]); //Actions to start on exit

action_add(7, 0, 5, ACT.QUEST_PROG, 
[6, 0, 1], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

action_add(7, 0, 7, ACT.HITBOX,
[AT_JAB, 8], //window_type, x, y, [id]
[]); //Actions to start on exit



//Triplat Section Init
//Camera Control
action_add(7, 0, 10, ACT.SPAWN_ART,
[[1,-1],[7, 0, 70, 0, 0, [0, 1544, 400, 0, 0, 0, 0, 0], [0,13]]], //cell, [room_format]
[11]); //Actions to start on exit

//Spawn 1 Fleye
action_add(7, 0, 11, ACT.SPAWN_ART,
[[1,-1],[6, 33, 80, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,12]]], //cell, [room_format]
[12]); //Actions to start on exit

//Spawn 1 Ravager
action_add(7, 0, 12, ACT.SPAWN_ART,
[[1,-1],[6, 64, 80, 0, -5, [2, 0, 0, 0, 0, 0, 0, 0], [0,12]]], //cell, [room_format]
[13]); //Actions to start on exit

//On defeating the enemies
action_add(7, 0, 13, ACT.ART_COUNT,
[12,0,0], //article_group, threshold, [lower than or equal:0 greater than or equal:1]
[14]); //Actions to start on exit

//Remove the camera lock
action_add(7, 0, 14, ACT.SET,
[13,"state",2,0,1], //article_id, variable, value, ease_type, ease_length
[]); //Actions to start on exit

////8: Water Hitbox

action_add(8, 0, 7, ACT.HITBOX,
[AT_JAB, 8], //window_type, x, y, [id]
[]); //Actions to start on exit



////9: Swoosh pipes

//Set the player VSP
//Wind Hitbox
action_add(9, 0, 2, ACT.HITBOX,
[AT_JAB, 9], //window_type, x, y, [id]
[]); //Actions to start on exit

//Set the player VSP
// action_add(9, 0, 2, ACT.SET_RELATIVE,  
// ["vsp", -16, 0, 1], //variable, value, ease_type, ease_length
// [3]); //Actions to start on exit

// action_add(9, 0, 3, ACT.SET_RELATIVE,  
// ["free", true, 0, 1], //variable, value, ease_type, ease_length
// []); //Actions to start on exit

// action_add(9, 0, 4, ACT.SET_RELATIVE,  
// ["free", true, 0, 5], //variable, value, ease_type, ease_length
// []); //Actions to start on exit


////10: Staging Grounds

//Worry Note
action_add(10, 0, 2, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_worry")]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

////11: Mage House

//Mage Lacuna dialog
action_add(11, 4, 1, ACT.WINDOW, 
[6, dialog_x, hdialog_y, [[11,1]]], //window_type, x, y, [id, progress, freeze_player]
[2]); //Actions to start on exit

//Lacuna Question - to find house
action_add(11, 4, 2, ACT.QUEST_PROG, 
[5, 0, 2], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[3]); //Actions to start on exit

//Supplier Quest - update scene to post-crates
action_add(11, 4, 3, ACT.SCENE, 
[0, 5], //[0:set,1:add, scene id]
[]); //Actions to start on exit

////12: Lacuna House (skippable)

action_add(12, 0, 2, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_lacuna")]]], //window_type, x, y, [contentoverride]?
[3]); //Actions to start on exit

//Lacuna Question - to find house
action_add(12, 0, 3, ACT.QUEST_PROG, 
[5, 0, 4], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[4]); //Actions to start on exit

//Supplier Quest - update scene to post-crates
action_add(12, 0, 4, ACT.SCENE, 
[0, 6], //[0:set,1:add, scene id]
[]); //Actions to start on exit

////13: Sewer Entrance

//Lacuna Question - End
action_add(13, 0, 1, ACT.QUEST_PROG, 
[5, 0, 9], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[2,3,4]); //Actions to start on exit
//Decend into Darkness - Start
action_add(13, 0, 2, ACT.QUEST_PROG, 
[6, 0, 1], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $333333 for dark
action_add(13, 0, 3, ACT.SET,  
[2, "bg_color", $FFFFFF], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Supplier Quest - update scene to post-crates
action_add(13, 0, 4, ACT.SCENE, 
[0, 7], //[0:set,1:add, scene id]
[]); //Actions to start on exit


////14: Hunter Room

//Hunter Dialog
action_add(14, 0, 5, ACT.WINDOW, 
[6, dialog_x, hdialog_y, [[10,1,1]]], //window_type, x, y, [id, progress, freeze_player]
[]); //Actions to start on exit

//DEBUG - Get A Full Heal
action_add(14, 0, 7, ACT.SPAWN_ART,
[[0,0],[10, 78, 28, 0, 0, [3, asset_get("empty_sprite"), 120, 1, 0, "", 0, 0], [0,0]],], //cell, [room_format]
[]); //Actions to start on exit

action_add(7, 0, 8, ACT.HITBOX,
[AT_JAB, 8], //window_type, x, y, [id]
[]); //Actions to start on exit


////17: Boss Room


//Ryken Dialog
action_add(17, 0, 5, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[13,1,1]]], //window_type, x, y, [id, progress, freeze_player]
[6]); //Actions to start on exit

action_add(17, 0, 6, ACT.WAIT,   //room_id, scene_id, action_id, action_type
[60],                          //Action arguments
[7]);                         //Actions to start on exit

action_add(17, 0, 7, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[14,1,1]]], //window_type, x, y, [id, progress, freeze_player]
[8]); //Actions to start on exit

//Set the boss to active
action_add(17, 0, 8, ACT.SET,  
[17, "team", 0], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit



//Dialog Init
//1: Quick Test
// dialog_add(1,1,["Hello! These are the default sprites...."]);
// dialog_add(1,2,["...And Here's some Override!",sprite_get("face_default2")]);
// dialog_add(1,3,["Wonder what happens here??"]);

//Nickname setup
with obj_stage_main other.fp = fp;
with fp {
    if am_is_fire nick = "Citizen";
    else if am_is_abyssal || !am_is_verbal nick = "Beast";
    else if am_is_insane || am_is_realitybreak || am_is_magic nick = "Odd Stranger";
    else if am_is_noob || am_is_small nick = "Little One";
    else nick = "Stranger";
}

////Kei Outside
//1: Kei Dialog Help
if fp.am_is_fire dialog_add(1,1,[fp.nick+"! To Arms!"]); //room_id dialog_id
else if fp.am_is_abyssal dialog_add(1,1,["Oh no, not another one..."]); //room_id dialog_id
else dialog_add(1,1,[fp.nick+ "! Help me!"]);

//2: Kei Dialog Help After
dialog_add(2,1,["Appreciate the help, "+fp.nick+"!"]); //Kei
dialog_add(2,2,["Introductions will have to wait - Let's get back to town before more show up."]); //Kei

//3: Kei To Door
dialog_add(3,1,["These attacks have gotten more and more frequent as we stay."]); //Kei
dialog_add(3,2,["We can use any help we can get!"]); //Kei

////Meeting the Commander
//4: Kei Introduction
dialog_add(4,1,["Now that we are safe... "]); //Kei
dialog_add(4,2,["I am Kei Flamen, "+fp.nick+". Camp Prefect of the company here."]); //Kei
dialog_add(4,3,["It's getting hard to even leave the walls for a morning stroll, haha!"]); //Kei
dialog_add(4,4,["Before I let you go, let me introduce you to our commander."]); //Kei
dialog_add(4,5,["Perhaps you could offer some help for our predicament?"]); //Kei
if fp.am_is_evil || fp.am_is_experienced dialog_add(4,5,["Perhaps you could offer some help for our predicament?"]); //Kei

//5: In Temple Command
var _i = 1;
// dialog_add(5,_i++,["Commander, I'd like to preset my defender."]); //Kwi
dialog_add(5,_i++,["I've heard you helped out my Prefect when he went on one of his unsafe 'walks' this morning."]); //Ryken
if fp.am_is_fire dialog_add(5,_i++,["Admirable commitment to civil service, "+fp.nick+"."]); //Ryken
else if fp.am_is_evil dialog_add(5,_i++,["I would not have expected such actions from you, "+fp.nick+"."]); //Ryken
// dialog_add(5,_i++,["Your actions are commendable, "+fp.nick+"."]); //Ryken
dialog_add(5,_i++,["I do not need assistance, however the Prefect thinks you can be of use."]); //Ryken
if fp.am_is_experienced dialog_add(5,_i++,["And indeed, your mastery is useful."]); //Ryken
else if fp.am_is_noob dialog_add(5,_i++,["And indeed, you show promise."]); //Ryken
else if fp.am_is_evil dialog_add(5,_i++,["An 'extra-legal' leg is maybe what we want here."]); //Ryken
else if fp.am_is_fire dialog_add(5,_i++,["Those born of fire are welcome to help."]); //Ryken
else if fp.am_is_insane dialog_add(5,_i++,["Unstable, but maybe we want that."]); //Ryken
else dialog_add(5,_i++,["Indeed, with your abilities you can supply help."]); //Ryken
dialog_add(5,_i++,["A shipment of food has not arrived. It was scheduled to show up today from the east."]); //Ryken
dialog_add(5,_i++,["Go investigate this. We do not need this shipment, but morale WILL stay high!"]); //Ryken

//6: Supplier
_i = 1;
dialog_add(6,_i++,[fp.nick+"... Help...."]); //Supplier
dialog_add(6,_i++,["They went... Right...."]); //Supplier


//7: Ryken Quest 2
_i = 1;
dialog_add(7,_i++,["Hm. I expect them to be here soon then."]); //Ryken
dialog_add(7,_i++,["There are more important tasks for you to perform."]); //Ryken
dialog_add(7,_i++,["Clenliness here has gotten down to unacceptable levels."]); //Ryken
dialog_add(7,_i++,["There are trash bins which need to be emptied and rubbish to clean up. Please see to it."]); //Ryken

//8: Guard Dialog (NOT USED SEQUENTIALLY - USED IN POPUP)
_i = 1;
dialog_add(8,_i++,["Greetings, "+fp.nick]); //Guard
dialog_add(8,_i++,["Today's a good day, isn't it?"]); //Guard
dialog_add(8,_i++,["Times are changing, I'm unsure if I like it."]); //Guard
dialog_add(8,_i++,["What are you doing here, "+fp.nick+"?"]); //Guard
dialog_add(8,_i++,["Patrolling the Outskirts makes you wish for a stormy winter."]); //Guard
if fp.am_is_fire  {
    dialog_add(8,_i++,["Victory is soon, "+fp.nick]); //Guard
    dialog_add(8,_i++,["Happy to see Fellow Fire, "+fp.nick]); //Guard
}
if fp.am_is_construct  dialog_add(8,_i++,["I have never seen anyone like you before!"]); //Guard
if fp.am_is_future dialog_add(8,_i++,["Your equipment is strange and intricate. Where did you get it?"]); //Guard
if fp.am_is_past dialog_add(8,_i++,[fp.nick+", unsure why you keep such old things."]); //Guard
if fp.am_is_myth dialog_add(8,_i++,["You seem familiar. Have I heard of you from somewhere?"]); //Guard
if fp.am_is_experienced dialog_add(8,_i++,["I have my full confidence in you, "+fp.nick+"."]); //Guard
if fp.am_is_not {
    dialog_add(8,_i++,["Why are you here oh god why are you here."]); //Guard
    dialog_add(8,_i++,["88888888888888888888888888888888888888888888888888888888888888888888888"]); //Guard
    dialog_add(8,_i++,["Hello and Welcome!"]); //Guard
    dialog_add(8,_i++,["[NO TEXT] (obj_stage_article)"]); //Guard
    dialog_add(8,_i++,["Get out of my head Get out of my head Get out of my head Get out of my head Get out of my head Get out of my head Get out of my head Get out of my head Get out of my head Get out of my head Get out of my head Get out of my head"]); //Guard
}

//12&9: Mage Dialog
_i = 1;
dialog_add(12,_i++,["Pssst - hey "+fp.nick+"!"]); //Mage
_i = 1;
dialog_add(9,_i++,["Rykie's got you on trash duty huh?"]); //Mage
dialog_add(9,_i++,["I think I've got something that may *actually* help us out."]); //Mage
dialog_add(9,_i++,["We can't talk about it out here - my house is the one in the east on the raised platform. Hard to miss!"]); //Mage

// dialog_add(9,_i++,["This is the end of the demo! Feel free to explore elsewhere you haven't been!"]); //Mage
// dialog_add(9,_i++,["Thank you for making it this far and be sure to check out the full version on Workshop when it releases!"]); //Mage

//10: Hunter
_i = 1;
if fp.am_is_not dialog_add(10,_i++,["You shouldn't be here, yet you are. Kinda like me."]); //Hunter
else dialog_add(10,_i++,["Hello, "+fp.nick+". I haven't seen you around down here."]); //Hunter
dialog_add(10,_i++,["I'm a hunter, here for some particularly big game."]); //Hunter
dialog_add(10,_i++,["It has been very elusive in this slippery underground."]); //Hunter
dialog_add(10,_i++,["Fortunately, I have some very... tantalizing bait for it to encounter."]); //Hunter
dialog_add(10,_i++,["I have set up camp to rest and wait for the trap to spring."]); //Hunter

dialog_add(10,_i++,["Would you like to share the night?"]); //Hunter


//11: Mage House Dialog
_i = 1;
dialog_add(11,_i++,["Now that we are away from the eyes of the gaurd..."]); //Mage
dialog_add(11,_i++,["There's hushed rumors going around - about Dr. Lacuna. They're a royal researcher stationed here from the Capital."]); //Mage
dialog_add(11,_i++,["Sent to 'survey the outskirts in the wake of the successional crisis' - though that's well above their status."]); //Mage
dialog_add(11,_i++,["*MY* bet is that they're a secret spy for the Water Tribe. I always see them pass by my window and decend in the Abandoned Aqueduct."]); //Mage
dialog_add(11,_i++,["I can't go and be any more nosy than I've been, but you - as a special guest of the Command..."]); //Mage
if fp.am_is_noob dialog_add(11,_i++,["...Perhaps you could stumble into their studies and see what's going on?"]); //Mage
else if fp.am_is_evil dialog_add(11,_i++,["...Perhaps you could manipulate them into spilling their secrets?"]); //Mage
else if fp.am_is_construct dialog_add(11,_i++,["...Perhaps they will take interest in your construction and let her guard down?"]); //Mage
else if fp.am_is_insane dialog_add(11,_i++,["...You two will hit it off nicely I do think!"]); //Mage
else if fp.am_is_not dialog_add(11,_i++,["...Perhaps you could BLEED THEM DRY AND FEAST 
ON  THEIR            BONE             MARROW."]); //Mage
else dialog_add(11,_i++,["...Perhaps you could talk with them and gleam something?"]); //Mage

//13: Rykenburn 1:1
_i = 1;
dialog_add(13,_i++,[fp.nick+"..."]); //Ryken
dialog_add(13,_i++,["I was hoping you were not sent here to do this."]); //Ryken
dialog_add(13,_i++,["I was hoping my instincts were wrong."]); //Ryken

//14: Rykenburn 1:2
_i = 1;
dialog_add(14,_i++,["But with you here now, with how you got here - your true allegiance is shining clearly."]); //Ryken
// dialog_add(14,_i++,["You have been fed lies by those you trusted."]); //Ryken
if fp.am_is_evil || fp.am_is_not dialog_add(14,_i++,["This is *not* for you to squander selfishly."]); //Ryken
dialog_add(14,_i++,["Here is the hope of Fire, a chance of restoration."]); //Ryken
if fp.am_is_fire dialog_add(14,_i++,["A new chance for us."]); //Ryken
dialog_add(14,_i++,["A remnant from a time that feels so distant..."]); //Ryken
dialog_add(14,_i++,["... And a remnant of a cause of the fall."]); //Ryken
dialog_add(14,_i++,["Fire is coiled tightly, the grip getting stronger by the day."]); //Ryken
dialog_add(14,_i++,["This is what you were sent to snuff out? Our hope for a better future?"]); //Ryken
dialog_add(14,_i++,["The virtues of my actions are self-evident."]); //Ryken
dialog_add(14,_i++,["If this light is not shining upon you, let's commence a trial by fire!"]); //Ryken

//Quest Init

//1: Kei Rescue
quest_add(1,1,"Rescue","Defend from an unknown threat!",asset_get("empty_sprite"));

//2: Kei Rescue After
quest_add(2,1,"Get to Safety","Go to a safe(r) place.",asset_get("empty_sprite"));

//3: Supplier Gather
quest_add(3,1,"Food for Thought","Find the missing shipment",asset_get("empty_sprite"));
quest_add(3,2,"Food for Thought","Find the missing crates (0/3)",asset_get("empty_sprite"));
quest_add(3,3,"Food for Thought","Find the missing crates (1/3)",asset_get("empty_sprite"));
quest_add(3,4,"Food for Thought","Find the missing crates (2/3)",asset_get("empty_sprite"));
quest_add(3,5,"Food for Thought","Return To Rykenburn",asset_get("empty_sprite"));
if fp.am_is_fire quest_add(3,5,"Food for Thought","Return To Rykenburn, your obligations are completed.",asset_get("empty_sprite"));
if fp.am_is_evil quest_add(3,5,"Food for Thought","Return To Rykenburn for your reward.",asset_get("empty_sprite"));

//4: Rykenburn's 2nd Task
quest_add(4,1,"Civil Duties","Collect Rubbish (0/52)",asset_get("empty_sprite"));

//5: The Lacuna Question
quest_add(5,1,"Inquiry","Find this helper and listen to what she has to say.",asset_get("empty_sprite"));
quest_add(5,2,"The Lacuna Question","Visit Dr Lacuna.",asset_get("empty_sprite"));
quest_add(5,3,"The Lacuna Question","Find clues for what has been going on.",asset_get("empty_sprite"));
quest_add(5,4,"The Lacuna Question","Get to the Temple Archives.",asset_get("empty_sprite"));
quest_add(5,5,"The Lacuna Question","Open the entrance to the Underground Aqueduct.",asset_get("empty_sprite"));

//6: Find Laboratory
quest_add(6,1,"Decend into Darkness","Search in the Underground Aqueduct.",asset_get("empty_sprite"));
quest_add(6,2,"Decend into Darkness","Defeat Rykenburn.",asset_get("empty_sprite"));

// quest_add(2,1,"Test Quest2","This is a test quest also!",sprite_get("torch"));
// quest_add(2,2,"Test Quest2.1","This is a test quest also also!",sprite_get("torch"));
// quest_add(2,3,"Different Title!2.2","Completely different text again!",sprite_get("torch"));
// quest_add(3,1,"Test Quest1.1","This is a test quest!",sprite_get("borgar"));
// quest_add(3,2,"Test Quest1.2","This is a test quest! Part 2!",sprite_get("borgar"));
// quest_add(3,3,"Different Title!1.3","Completely different text!",sprite_get("borgar"));

// music_add(0,"Fire_Capital_Calm");
// music_add(1,"Fire_Capital_Night_Theme");
// music_add(2,"Fire_Capital_Sewers_Complex");
// music_add(3,"Main_Battle_Theme");
// music_add(4,"Vs_Rykenburn");
// music_add(5,"Credits_Theme");



//Functions DO NOT EDIT BELLOW
/*if debug {
    print_debug("LOADED ARRAYS:");
    print_debug(string(action_array));
    print_debug(string(scene_array));
}*/

#define action_add(_room_id, _scene_id, _action_id, _action_type, _param, _on_exit)
while _room_id >= array_length_1d(action_array) array_push(action_array, []);
while _scene_id >= array_length_1d(action_array[_room_id]) array_push(action_array[_room_id], []);
while _action_id >= array_length_1d(action_array[_room_id][_scene_id]) array_push(action_array[_room_id][_scene_id], []);
action_array[@_room_id][@_scene_id][@_action_id] = [_action_type, _param, _on_exit];
if debug print_debug("[AM] Action Loaded: "+string(_room_id)+":"+string(_scene_id,)+":"+string(_action_id));
return true;

#define scene_add(_room_id, _scene_id, _action_array)
while _room_id >= array_length_1d(scene_array) array_push(scene_array, []);
//print_debug(string(scene_array));
while _scene_id >= array_length_1d(scene_array[_room_id]) array_push(scene_array[_room_id], []);
if array_length(_action_array) == 0 array_push(_action_array,_scene_id);
scene_array[@_room_id][@_scene_id] = _action_array;
if debug print_debug("[AM] Scene Loaded: "+string(_scene_id));
return true;

#define quest_add(_id,_progress,_title,_description,_spr)
if quest_init return false;
if _progress == 0 {
    print("[AM:Q] ERROR: Do not override progress 0!");
    return false;
}
while _id >= array_length_1d(quest_array) array_push(quest_array,[]);
while _progress >= array_length_1d(quest_array[_id]) array_push(quest_array[_id],[]);
quest_array[@_id][@0] = noone;//Save quest progress here
quest_array[@_id][@_progress] = [_title,_description,_spr];
return true;

#define dialog_add(_id,_progress,_data) //Dialog Data: [string,_text_sprite_face_override,_sprite_bg_override]
//Response Map: [[_text,_to_prog,_dialog_override]...]
if _progress == 0 {
    print("[AM:D] ERROR: Do not override progress 0!");
    return false;
}
while _id >= array_length_1d(dialog_array) array_push(dialog_array,[]);
while _progress >= array_length_1d(dialog_array[_id]) array_push(dialog_array[_id],[]);
dialog_array[@_id][@0] = noone; //Save dialog progress
dialog_array[@_id][@_progress] = _data; //Save dialog progress
return true;

// #define music_add(_music_id,_music_index)
// while array_length_1d(music_array) < _music_id array_push(music_array, []);
// music_array[_music_id] = [_music_index];

// #define music_find_length(_music_id)
// if array_length_1d(music_array) < _music_id return noone;
// return music_array[_music_id][1];

// #define control(_dir,_but)
// return [_dir,_but];
//Global Scenes

/*scene_add(1,[
    [2,2, 1, [sprite_get("dialog_border"), 6, -16, -16, sprite_get("squdia_idle"), 6]], //window 0, animated sprite
    [150,2, 0, [asset_get("empty_sprite"), 6, 20, 16, "roundFont", "Shabadap bo bop!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    //[TG_COMPLETE, 2,  tutorial_default_scroll]);
    [TG_COMPLETE, -1,  999999999999999]);

scene_add(2,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_estatic"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "It's been a hot minute, but a lot of work has been done and discoveries made!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 3, tutorial_default_scroll]);
scene_add(3,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_idle"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "We have a debug console now - with custom commands that can be added pretty quickly!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 4, tutorial_default_scroll]);
scene_add(4,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_idle"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "It let's you set variables, toggle/change debug information, etc.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 5, tutorial_default_scroll]);
scene_add(5,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_idle"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "For example, we can switch scenes pretty easily...", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    //[TG_COMPLETE, 6, tutorial_default_scroll]);
    [TG_COMPLETE, -1,  999999999999999]);
scene_add(6,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_happy"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "We also discovered that precise collision on articles is possible!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 7, tutorial_default_scroll*2]);
scene_add(7,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_sideglance"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "It works pretty well for solid articles, but platforms have issues.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 8, tutorial_default_scroll]);
scene_add(8,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_happy"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "This still means that we can make it easier on every front AND save processing resources.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 9, tutorial_default_scroll]);
scene_add(9,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_sideglance"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "We've also been working on the example level. But, I want to keep that a secret until we're ready.", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 10, tutorial_default_scroll]);
scene_add(10,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_estatic"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "@CptTechnicality in the background has been working on the tools - can't wait to show it off!", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 11, tutorial_default_scroll]);
scene_add(11,[
    [50,400, 1, [asset_get("empty_sprite"), 6, -16, -16, sprite_get("archeio_estatic"), 6]], //window 0, animated sprite
    [150,400, 0, [sprite_get("bordertext4"), 6, 20, 16, "roundFont", "We plan on getting the engine finished and enter the beta phase soon! - Archytas", 680, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
    
    ],
    [TG_COMPLETE, 12, tutorial_default_scroll]);*/
    
/*switch cur_room { //Room Specific Scenes
    case 1:
        scene_add(1,[],[TG_COMPLETE, -1,  999999999999999]);
        scene_add(2,[
            [300,400, 1, [sprite_get("dialog_borderbg"), 6, 0, 0, sprite_get("squdia_flap"), 8]], //window 0, animated sprite
            [300,400, 1, [sprite_get("dialog_border"), 6, 0, 0, asset_get("empty_sprite"), 8]], //window 0, animated sprite
            [300+64,400, 0, [sprite_get("dialog_text"), 6, 12, 4, "roundFont", "Hmmm... "+player_name+" is it? I've got something you can help me with...", 300, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
            ],
            [TG_COMPLETE, 3,  tutorial_default_scroll]);
            //[TG_COMPLETE, 2,  999999999999999]);
        scene_add(3,[
            [300,400, 1, [sprite_get("dialog_borderbg"), 6, 0, 0, sprite_get("squdia_hap"), 8]], //window 0, animated sprite
            [300,400, 1, [sprite_get("dialog_border"), 6, 0, 0, asset_get("empty_sprite"), 8]], //window 0, animated sprite
            [300+64,400, 0, [sprite_get("dialog_text"), 6, 12, 4, "roundFont", "I forgot my lunch in my house to the right. Could you go fetch it?", 300, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
            ],
            [TG_COMPLETE, 4,  tutorial_default_scroll]);
        scene_add(4,[
            [300,400, 1, [sprite_get("dialog_borderbg"), 6, 0, 0, sprite_get("squdia_flap"), 8]], //window 0, animated sprite
            [300,400, 1, [sprite_get("dialog_border"), 6, 0, 0, asset_get("empty_sprite"), 8]], //window 0, animated sprite
            [300+64,400, 0, [sprite_get("dialog_text"), 6, 12, 4, "roundFont", "I've got a stall to run! Chop Chop!", 300, tutorial_default_text_speed, asset_get("mfx_hp")]] //window 1, textbox
            ],
            [TG_COMPLETE, 5,  tutorial_default_scroll]);
        break;
    case 2:
        scene_add(1,[],[TG_COMPLETE, -1,  999999999999999]);
    case -1:
        break;
}*/

//

//DO NOT EDIT BELOW


/*
################################################################################
CHEAT SHEET
################################################################################


#############
scene_add(scene_id, [window_data], [trigger_data]);
scene_id: The unique numerical ID of the scene.

window_data: The initialization data of each window in the scene, in order. Instanced as window 0, 1, 2, etc.
    [x,y,content_type, [window_arguments]]

trigger_data: The data that determines when the current scene transitions to the provided.
    [trigger_type, next_scene, delay/extra arguments]
    macros:
        TG_CUSTOM //Run custom trigger code
        TG_COMPLETE //Trigger upon 'completion' (defined per window type: Animation completion [> image_index], Full text display [vis_chars > full_text length])
        TG_BUTTON //Triggers upon button press (any button, attack, shield, taunt, etc)
        TG_TIME //Triggers after a frame count

#############
SCENE WINDOW VARIABLES
default values are shown after a ':'. 
[#] means the array argument index in the last argument of windows.

HUD Textbox:
    _x,
    _y,
    content_type,
    bg_sprite_index: [0],
    bg_sprite_speed: [1],
    _in_x: [2],
    _in_y: [3],
    font: [4],
    text_full: [5],
    text_spacing: [6],
    scroll_speed: [7],
    scroll_sound: [8],
    bg_image_index,
    vis_chars: 0,
    move_time: 30,
    move_timer: 0,
    move_type: 1,
    visibl: true,
    path: [_x,_y],
    init_pos: [_x,_y]
    
HUD Sprite:
    _x:,
    _y:,
    content_type,
    bg_sprite_index: [0],
    bg_sprite_speed: [1],
    _in_x: [2],
    _in_y: [3],
    _sprite_index: [4],
    sprite_speed: [5],
    bg_image_index: [6],
    _image_index: [7],
    move_time: 30,
    move_timer: 0,
    move_type: 1,
    visibl: true,
    path: [x,y],
    init_pos: [x,y]
    
Draw Sprite, Synced with an object:
    _x,
    _y,
    content_type,
    bg_sprite_index: [0],
    bg_sprite_speed: [1],
    _in_x: [2],
    _in_y: [3],
    _sprite_index: [4],
    sprite_speed: [5],
    obj_name: [6],
    synced: [7],
    bg_image_index: [8],
    _image_index: [9],
    move_time: 30,
    move_timer: 0,
    move_type: 1,
    visibl: true,
    path: [x,y],
    init_pos: [x,y]

Camera Controller: *USE ONLY IN CUTSCENES*
    _x: __x,
    _y: __y,
    content_type,
    visibl: false, //Keep false, nothing to draw
    follow_type: [0],
    follow_var: [1], //Object, bounded or not, depends on follow_type
    move_speed: [2],
    cam_offset: [3]
    
World Drawn Textbox:
    _x,
    _y,
    content_type,
    bg_sprite_index: [0],
    bg_sprite_speed: [1],
    _in_x: [2],
    _in_y: [3],
    font: [4],
    text_full: [5],
    text_spacing: [6],
    scroll_speed: [7],
    scroll_sound: [8],
    bg_image_index: 0,
    vis_chars: 0,
    move_time: 30,
    move_timer: 0,
    move_type: 1,
    visibl: true,
    path: [x,y],
    init_pos: [x,y]
    
World Drawn Animated Sprite: 
    _x,
    _y,
    content_type,
    bg_sprite_index: [0],
    bg_sprite_speed: [1],
    _in_x: [2],
    _in_y: [3],
    _sprite_index: [4],
    sprite_speed: [5],
    bg_image_index: [6],
    _image_index: [7],
    move_time: 30,
    move_timer: 0,
    move_type: 1,
    visibl: true,
    path: [x,y],
    init_pos: [x,y]
#############
*/
/*#define scene_add(_scene_id, scene_data, scene_triggers) //Adds a new scene to the scenespace
var _scene_id_ind = array_find_index(array_scene_ID,_scene_id);
if _scene_id_ind == -1 {
    array_push(array_scene_data,scene_data);
    array_push(array_scene_ID, _scene_id);
    array_push(array_scene_triggers,scene_triggers);
    open_scene_id++;
} else {
    array_scene_data[_scene_id_ind] = scene_data;
    array_scene_ID[_scene_id_ind] = _scene_id;
    array_scene_triggers[_scene_id_ind] = scene_triggers;
}*/

