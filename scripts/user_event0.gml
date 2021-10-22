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
    // CAMERA, //Sets the camera to a specific point
    // //action_time, x, y, focus_type, smooth 
    WINDOW, //Makes a hud window
    //window_num, x, y, [contentoverride]
    CONTROL, //Controls players
    //player_id, life_time, state_override, input_array
    WAIT, //waits
    //frames
    PLAY_SOUND,
    //sound
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
    EMIT_PARTICLE, //Emit a particle, generally at a relative location
    //x,y, sprite, vfx_time, disable_movement, alpha
    END_GAME, //Calls end_match
}

//Reset Arrays
action_array = [];
scene_array = [];
//

//Scene & Action Data Here

//Room 0: Global action declarations
// action_add(0, 1, 1, ACT.WAIT,   //room_id, scene_id, action_id, action_type
// [120],                          //Action arguments
// []);                           //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(0, 3, 1, ACT.SET,  
[2, "bg_color", $718ae1], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(0, 4, 1, ACT.SET,  
[2, "bg_color", $718ae1], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(0, 5, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(0, 6, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(0, 7, 1, ACT.SET,  
[2, "bg_color", $888888], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Room 1: Kei Outside

// scene_add(1, 1, []);
// //Set the Room Lighting - $2c77a8 for evening, $813030 for night, $888888 for dark
// action_add(1, 0, 1, ACT.SET,  
// [2, "bg_color", $888888, 0, 60], //article_group, variable, value, ease_type, ease_length
// [2]); //Actions to start on exit

// scene_add(1, 1, []);
action_add(1, 0, 1, ACT.TRANS_MUSIC, 
["Hallowflame_Calm"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
[3]); //Actions to start on exit

action_add(1, 0, 3, ACT.WINDOW, 
[2, 200, 100, [[],["Outskirts"],[],["Outskirts"]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//DEBUG: Note Take -> Credits Scrolling
action_add(1, 0, 2, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("noteExample")]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//DEBUG - To Sewer Scene
// action_add(1, 0, 6, ACT.SCENE, 
// // [0, 7], //[0:set,1:add, scene id]
// [0, 5], //[0:set,1:add, scene id]
// []); //Actions to start on exit

//DEBUG - Get A Key
// action_add(1, 0, 4, ACT.SPAWN_ART,
// [[-3,0],[10,34,42,0,-6,[2,sprite_get("item_2"),1000,1,0,"Aqueduct Key",0,0],[0,0]]], //cell, [room_format]
// []); //Actions to start on exit

action_add(1, 1, 1, ACT.WAIT,   //room_id, scene_id, action_id, action_type
[1],                          //Action arguments
[2,9]);                         //Actions to start on exit


//Start Quest Dialog
action_add(1, 1, 2, ACT.WINDOW, //Start this once at scene start.. successive scene changes should never start this again
[5, 0, 400, []], //window_type, x, y, [contentoverride]
[]); //Actions to start on exit

// //Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
// action_add(1, 1, 3, ACT.SET,  
// [2, "bg_color", $718ae1, 0, 60], //article_group, variable, value, ease_type, ease_length
// []); //Actions to start on exit


// action_add(1, 1, 2, ACT.CONTROL,//<-- Creating one indefinite Control action for later use
// [-1, all, PS_SPAWN], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
// []); //Actions to start on exit

// action_add(1, 1, 3, ACT.SUS,//<-- Immediately suspending the action for use later
// [1, 2], //suspend_bool, action_id
// []); //Actions to start on exit

//// 9: Kei Rescue

//Spawn 1 Kei
action_add(1, 1, 9, ACT.SPAWN_ART,
[[-2,0],[6, 86, 43, 0, -5, [7, 0, 0, [{x: 7358, y: 10545}, {x: 9666, y: 10545}], 0, 0, 0, 0], [0,11]]], //cell, [room_format]
[]); //Actions to start on exit

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
[[-2,0],[6, 86, 43, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,12]]], //cell, [room_format]
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
[[-2,0],[6, 60, 43, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,13]]], //cell, [room_format]
[]); //Actions to start on exit

//Spawn 1 Ravager
action_add(1, 1, 18, ACT.SPAWN_ART,
[[-2,0],[6, 100, 43, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,13]]], //cell, [room_format]
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

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(1, 3, 1, ACT.SET,  
[2, "bg_color", $718ae1, 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(1, 4, 1, ACT.SET,  
[2, "bg_color", $813030, 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

action_add(1, 4, 2, ACT.TRANS_MUSIC, 
["Hallowflame_Night"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
[]); //Actions to start on exit

action_add(1, 5, 1, ACT.TRANS_MUSIC, 
["Hallowflame_Night"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
[]); //Actions to start on exit

////2: Kei After Door
// action_add(2, 1, 1, ACT.WAIT,   //room_id, scene_id, action_id, action_type
// [1],                          //Action arguments
// [2]);                         //Actionsto start on exit

//2: Hallowflame
// action_add(2, 0, 1, ACT.TRANS_MUSIC, 
// ["Hallowflame_Calm"], //window_type, x, y, [contentoverride]?
// [4]); //Actions to start on exit
action_add(2, 0, 1, ACT.WAIT,   //room_id, scene_id, action_id, action_type
[2],                          //Action arguments
[4]);                         //Actionsto start on exit

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

//Despawn one note, to let the other through
action_add(2, 0, 5, ACT.DESPAWN,  
[2], //article_group
[]); //Actions to start on exit

action_add(2, 0, 6, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_wood")]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

action_add(2, 0, 7, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_marble")]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//Spawn 1 Kei for dialog
action_add(2, 1, 1, ACT.SPAWN_ART,
[[-1,0],[6,0.88,43.94,0,-5,[7,0,0,0,0,0,0,0,],[0,0]]], //cell, [room_format] 
[2,5]); //Actions to start on exit

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
[3, 2, [9851,10185]], //to_room, type, to_coords
[]); //Actions to start on exit

action_add(2, 1, 5, ACT.TRANS_MUSIC, 
["Hallowflame_Calm"], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

action_add(2, 2, 1, ACT.TRANS_MUSIC, 
["Hallowflame_Calm"], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//Scene 3: Dialog with Mage
//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(2, 3, 1, ACT.SET,  
[2, "bg_color", $718ae1], //article_group, variable, value, ease_type, ease_length
[9,6,8,12]); //Actions to start on exit

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

action_add(2, 3, 12, ACT.TRANS_MUSIC, 
["Hallowflame_Calm"], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

action_add(2, 4, 1, ACT.TRANS_MUSIC, 
["Hallowflame_Calm"], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//Scene 5: Night Lacuna search

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(2, 5, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[2,8]); //Actions to start on exit

action_add(2, 5, 2, ACT.SET,  
[4, "destroyed", true], //article_group, variable, value, ease_type, ease_length
[3]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 5, 3, ACT.SPAWN_ART,
[[-1,0],[6, 15, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[4]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 5, 4, ACT.SPAWN_ART,
[[0,0],[6, 110, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[5]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 5, 5, ACT.SPAWN_ART,
[[0,0],[6, 70, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
// [6]); //Actions to start on exit
[6]); //Actions to start on exit

// //Spawn 1 Night Guard
action_add(2, 5, 6, ACT.SPAWN_ART,
[[-1,0],[6, 90, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[]); //Actions to start on exit

//Spawn 1 Night Guard
// action_add(2, 5, 7, ACT.SPAWN_ART,
// [[-1,0],[6, 130, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
// []); //Actions to start on exit

action_add(2, 5, 8, ACT.TRANS_MUSIC, 
["Hallowflame_Night"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
[9]); //Actions to start on exit

//Spawn A mark on lacuna's house
action_add(2, 5, 9, ACT.SPAWN_ART,
[[-1,0],[1,55.13,32.25,0,-20,[sprite_get("mark"),0,0,0,0,0,0,0,],[0,0]]], //cell, [room_format]
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(2, 6, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[2,8]); //Actions to start on exit

action_add(2, 6, 2, ACT.SET,  
[4, "destroyed", true], //article_group, variable, value, ease_type, ease_length
[3]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 6, 3, ACT.SPAWN_ART,
[[-1,0],[6, 20, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[4]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 6, 4, ACT.SPAWN_ART,
[[0,0],[6, 110, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[5]); //Actions to start on exit

//Spawn 1 Night Guard
action_add(2, 6, 5, ACT.SPAWN_ART,
[[0,0],[6, 70, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
// [6]); //Actions to start on exit
[6]); //Actions to start on exit

// //Spawn 1 Night Guard
action_add(2, 6, 6, ACT.SPAWN_ART,
[[-1,0],[6, 90, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
[]); //Actions to start on exit

//Spawn 1 Night Guard
// action_add(2, 6, 7, ACT.SPAWN_ART,
// [[-1,0],[6, 130, 43.94, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,4]],], //cell, [room_format]
// []); //Actions to start on exit

action_add(2, 6, 8, ACT.TRANS_MUSIC, 
["Hallowflame_Night"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
[9]); //Actions to start on exit

//Spawn A mark on lacuna's house
action_add(2, 6, 9, ACT.SPAWN_ART,
[[-1,0],[1,55.25,32.38,0,0,[sprite_get("mark"),0,0,0,0,0,0,0,],[0,0]]], //cell, [room_format]
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
[2,4]); //Actions to start on exit

//Supplier Quest Start
action_add(3, 1, 2, ACT.QUEST_PROG, 
[3, 1, 2], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[3]); //Actions to start on exit

//Set Scene out of Intro
action_add(3, 1, 3, ACT.SCENE, 
[0, 2], //[0:set,1:add, scene id]
[]); //Actions to start on exit

action_add(3, 1, 4, ACT.TRANS_MUSIC, 
["Hallowflame_Calm"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
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

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(3, 5, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[2,3]); //Actions to start on exit

//Despawn Kei, Rykenburn
action_add(3, 5, 2, ACT.DESPAWN,  
[5], //article_group
[]); //Actions to start on exit

action_add(3, 5, 3, ACT.TRANS_MUSIC, 
["Hallowflame_Night"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(3, 6, 1, ACT.SET,  
[2, "bg_color", $813030], //article_group, variable, value, ease_type, ease_length
[2,3]); //Actions to start on exit

//Despawn Kei, Rykenburn
action_add(3, 6, 2, ACT.DESPAWN,  
[5], //article_group
[]); //Actions to start on exit

action_add(3, 6, 3, ACT.TRANS_MUSIC, 
["Hallowflame_Night"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
[]); //Actions to start on exit


//4: Temple Basement
//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(4, 0, 1, ACT.SET,  
[2, "bg_color", $333333], //article_group, variable, value, ease_type, ease_length
[8]); //Actions to start on exit

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

action_add(4, 0, 8, ACT.TRANS_MUSIC, 
["Hallowflame_Night"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
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

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(5, 0, 8, ACT.SET,  
[2, "bg_color", $718ae1, 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit


//DEBUG
// //Supplier Quest Start
// action_add(5, 0, 7, ACT.QUEST_PROG, 
// [3, 1, 2], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
// []); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
// action_add(5, 3, 1, ACT.SET,  
// [2, "bg_color", $718ae1, 0, 60], //article_group, variable, value, ease_type, ease_length
// [2]); //Actions to start on exit

// action_add(5, 3, 2, ACT.TRANS_MUSIC, 
// ["Hallowflame_Night"], //music_name
// // [3,6]); //Actions to start on exit //DEBUG Events
// []); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(5, 4, 1, ACT.SET,  
[2, "bg_color", $718ae1 , 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

// action_add(5, 4, 2, ACT.TRANS_MUSIC, 
// ["Hallowflame_Night"], //music_name
// // [3,6]); //Actions to start on exit //DEBUG Events
// []); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(5, 5, 1, ACT.SET,  
[2, "bg_color", $813030, 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(5, 6, 1, ACT.SET,  
[2, "bg_color", $813030, 0, 60], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit


////6: Shrine Room

//Despawn one note, to let the other through
action_add(6, 0, 5, ACT.DESPAWN,  
[2], //article_group
[]); //Actions to start on exit

action_add(6, 0, 6, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_wood")]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

action_add(6, 0, 7, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_marble")]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

// action_add(6, 0, 8, ACT.TRANS_MUSIC, 
// ["Hallowflame_Calm"], //music_name
// // [3,6]); //Actions to start on exit //DEBUG Events
// []); //Actions to start on exit

////7: Sewer

//Room Title Card
//Set the Room Lighting - $2c77a8 for evening, $813030 for night, $888888 for dark
// action_add(7, 0, 1, ACT.SET,  
// [2, "bg_color", $888888], //article_group, variable, value, ease_type, ease_length
// [2]); //Actions to start on exit

//Placeholder
action_add(7, 0, 1, ACT.WAIT, 
[2], //time
[2,3,4,8]); //Actions to start on exit

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

action_add(7, 0, 8, ACT.TRANS_MUSIC, 
["Hallowflame_Sewer"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
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
action_add(8, 0, 1, ACT.TRANS_MUSIC, 
["Hallowflame_Sewer"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
[]); //Actions to start on exit

action_add(8, 0, 7, ACT.HITBOX,
[AT_JAB, 8], //window_type, x, y, [id]
[]); //Actions to start on exit





////9: Swoosh pipes
action_add(9, 0, 1, ACT.TRANS_MUSIC, 
["Hallowflame_Sewer"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
[]); //Actions to start on exit
//Set the player VSP
//Wind Hitbox
action_add(9, 0, 2, ACT.HITBOX,
[AT_JAB, 9], //window_type, x, y, [id]
[4]); //Actions to start on exit

action_add(9, 0, 3, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_monster")]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//Steam woosh - gonna be always relative
action_add(9, 0, 4, ACT.EMIT_PARTICLE,  
[0, 0, sprite_get("puff"), 30, 1, 1], //x,y, sprite, vfx_time, disable_movement, alpha
[]); //Actions to start on exit

action_add(9, 0, 7, ACT.HITBOX,
[AT_JAB, 8], //window_type, x, y, [id]
[]); //Actions to start on exit

////10: Staging Grounds
action_add(10, 0, 1, ACT.TRANS_MUSIC, 
["sewer_ambience"], //music_name
[3]); //Actions to start on exit
//Worry Note
action_add(10, 0, 2, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_worry")]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(10, 0, 3, ACT.SET,  
[2, "bg_color", $888888], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

////11: Mage House

action_add(11, 4, 1, ACT.TRANS_MUSIC, 
["music_loop"], //music_name
// [3,6]); //Actions to start on exit //DEBUG Events
[4]); //Actions to start on exit

//Lacuna Question - to find house
action_add(11, 4, 2, ACT.QUEST_PROG, 
[5, 0, 2], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[3]); //Actions to start on exit

//Supplier Quest - update scene to post-crates
action_add(11, 4, 3, ACT.SCENE, 
[0, 5], //[0:set,1:add, scene id]
[]); //Actions to start on exit

action_add(11, 4, 4, ACT.WINDOW, 
[6, dialog_x, hdialog_y, [[11,1]]], //window_type, x, y, [id, progress, freeze_player]
[2]); //Actions to start on exit


////12: Lacuna House

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
[2,3,4,5]); //Actions to start on exit
//Decend into Darkness - Start
action_add(13, 0, 2, ACT.QUEST_PROG, 
[6, 0, 1], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(13, 0, 3, ACT.SET,  
[2, "bg_color", $888888], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Supplier Quest - update scene to post-crates
action_add(13, 0, 4, ACT.SCENE, 
[0, 7], //[0:set,1:add, scene id]
[]); //Actions to start on exit

action_add(13, 0, 5, ACT.TRANS_MUSIC, 
["sewer_ambience"], //music_name
[]); //Actions to start on exit


////14: Hunter Room
action_add(14, 0, 1, ACT.TRANS_MUSIC, 
["sewer_ambience"], //music_name
[2]); //Actions to start on exit

//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
action_add(14, 0, 2, ACT.SET,  
[2, "bg_color", $888888], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit


//Hunter Dialog
action_add(14, 0, 5, ACT.WINDOW, 
[6, dialog_x, hdialog_y, [[10,1,1]]], //window_type, x, y, [id, progress, freeze_player]
[]); //Actions to start on exit

//DEBUG - Get A Full Heal
action_add(14, 0, 7, ACT.SPAWN_ART,
// [[0,0],[10, 78, 31, 0, 0, [3, asset_get("empty_sprite"), 500, 2, 0, "", 0, 0], [0,0]],], //cell, [room_format]
[[0,0],[10, 78, 31, 0, 10, [3, sprite_get("black"), 500, 50, 0, "", 0, 0], [0,0]],], //cell, [room_format]
[]); //Actions to start on exit

action_add(14, 0, 8, ACT.HITBOX,
[AT_JAB, 8], //window_type, x, y, [id]
[]); //Actions to start on exit


action_add(16, 0, 3, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_aqueduct")]]], //window_type, x, y, [contentoverride]?
[]); //Actions to start on exit


////17: Boss Room

action_add(17, 0, 1, ACT.TRANS_MUSIC, 
["sewer_ambience"], //music_name
[2]); //Actions to start on exit

action_add(17, 0, 2, ACT.QUEST_PROG, 
[6, 1, 10], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

//Ryken Dialog
action_add(17, 0, 5, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[13,1,1]]], //window_type, x, y, [id, progress, freeze_player]
[6]); //Actions to start on exit

action_add(17, 0, 6, ACT.WAIT,   //room_id, scene_id, action_id, action_type
[60],                          //Action arguments
[7]);                         //Actions to start on exit

action_add(17, 0, 7, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[14,1,1]]], //window_type, x, y, [id, progress, freeze_player]
[11,9]); //Actions to start on exit


//Set the boss to active
action_add(17, 0, 8, ACT.SET,  
[17, "team", 0], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

//Set the boss to active
action_add(17, 0, 9, ACT.SET,  
[17, "show_healthbar", 1], //article_group, variable, value, ease_type, ease_length
[10]); //Actions to start on exit

//Set the boss to active
action_add(17, 0, 10, ACT.SET,  
[17, "is_boss", 1], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

action_add(17, 0, 11, ACT.WAIT,   //room_id, scene_id, action_id, action_type
[100],                          //Action arguments
[12,15,13]);                         //Actions to start on exit


action_add(17, 0, 12, ACT.WINDOW, 
[6, dialog_x, dialog_y, [[15,1,1]]], //window_type, x, y, [id, progress, freeze_player]
[8]); //Actions to start on exit


//Set the boss to active
action_add(17, 0, 13, ACT.SET,  
[17, "next_state", PS_WALK_TURN], //article_group, variable, value, ease_type, ease_length
[]); //Actions to start on exit

action_add(17, 0, 14, ACT.SPAWN_ART,
[[0,0],[4,48.25,26,0,-6,[17,0,0,0,0,64,64,[0,1,0,0]],[0,0]]], // Exported from Lucid Dream], //cell, [room_format]
[20]); //Actions to start on exit

action_add(17, 0, 15, ACT.TRANS_MUSIC, 
["Vs_Rykenburn"], //music_name
[]); //Actions to start on exit

action_add(17, 0, 16, ACT.QUEST_PROG, 
[6, 1, 0], //quest_id, action_type[0:set forward, 1:set override, 2:add/sub], amount
[]); //Actions to start on exit

action_add(17, 0, 17, ACT.WINDOW, 
[7, 0, 0, [[sprite_get("note_letter")]]], //window_type, x, y, [contentoverride]?
[18]); //Actions to start on exit

action_add(17, 0, 18, ACT.SW_ROOM, 
[20, 3, [200,200]], //to_room, type, to_coords
[]); //Actions to start on exit

action_add(17, 0, 20, ACT.TRANS_MUSIC, 
["sewer_ambience"], //music_name
[]); //Actions to start on exit



//Set the Room Lighting - $718ae1 for evening, $813030 for night, $888888 for dark
// action_add(20, 0, 1, ACT.SET,  
// [2, "bg_color", $FFFFFF], //article_group, variable, value, ease_type, ease_length
// []); //Actions to start on exit

action_add(20, 0, 1, ACT.WAIT,   //room_id, scene_id, action_id, action_type
[2],                          //Action arguments
[2,4]);                         //Actions to start on exit

action_add(20, 0, 2, ACT.WINDOW, 
[8, 0, 0, [[sprite_get("credits")]]], //window_type, x, y, [contentoverride]?
[5,6]); //Actions to start on exit

action_add(20, 0, 3, ACT.END_GAME,   //room_id, scene_id, action_id, action_type
[], //Action arguments
[]);//Actions to start on exit

action_add(20, 0, 4, ACT.TRANS_MUSIC, 
["Credits_Theme"], //music_name
[]); //Actions to start on exit

action_add(20, 0, 5, ACT.WAIT,   //room_id, scene_id, action_id, action_type
[30],                          //Action arguments
[3]);                         //Actions to start on exit

action_add(20, 0, 6, ACT.SW_ROOM, 
[0, 3, [200,200]], //to_room, type, to_coords
[]); //Actions to start on exit


////Dialog Init
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
dialog_add(5,_i++,["I've heard you helped out my Prefect when he went on one of his unsafe 'walks.'"]); //Ryken
if fp.am_is_fire dialog_add(5,_i++,["Admirable commitment to civil service, "+fp.nick+"."]); //Ryken
else if fp.am_is_evil dialog_add(5,_i++,["I would not have expected such actions from you, "+fp.nick+"."]); //Ryken
// dialog_add(5,_i++,["Your actions are commendable, "+fp.nick+"."]); //Ryken
dialog_add(5,_i++,["I do not need assistance, however the Prefect thinks you can be of use."]); //Ryken
if fp.am_is_experienced dialog_add(5,_i++,["And indeed, your mastery is useful."]); //Ryken
else if fp.am_is_noob dialog_add(5,_i++,["And indeed, you show promise."]); //Ryken
else if fp.am_is_evil dialog_add(5,_i++,["An 'extra-legal' leg is maybe what we want here."]); //Ryken
else if fp.am_is_fire dialog_add(5,_i++,["Those born of fire are welcome to help."]); //Ryken
else if fp.am_is_insane dialog_add(5,_i++,["Unstable, but maybe we want that."]); //Ryken
else if fp.am_is_not dialog_add(5,_i++,["You have an unnerving presence. This can be useful."]); //Ryken
else dialog_add(5,_i++,["Indeed, with your abilities you can supply help."]); //Ryken
dialog_add(5,_i++,["A shipment of food has not arrived. It was scheduled to show up today from the east."]); //Ryken
dialog_add(5,_i++,["Go investigate this. We do not need this shipment, but morale WILL stay high!"]); //Ryken

//6: Supplier
_i = 1;
dialog_add(6,_i++,[fp.nick+"... Help...."]); //Supplier
dialog_add(6,_i++,["They went... Right...."]); //Supplier


//7: Ryken Quest 2
_i = 1;
dialog_add(7,_i++,["Adequate work, "+fp.nick+"."]); //Ryken
dialog_add(7,_i++,["I expect them to be here soon then."]); //Ryken
dialog_add(7,_i++,["There are more important tasks for you to perform."]); //Ryken
dialog_add(7,_i++,["Clenliness here has gotten down to unacceptable levels."]); //Ryken
if fp.am_is_not dialog_add(7,_i++,["There are trash bins which need to be instance_destroy()ed."]); //Ryken
else dialog_add(7,_i++,["There are trash bins which need to be emptied and rubbish to clean up. Please see to it."]); //Ryken

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
dialog_add(12,_i++,["Pssst - hey, "+fp.nick+"!"]); //Mage
_i = 1;
dialog_add(9,_i++,["Rykie's got you on trash duty huh?"]); //Mage
dialog_add(9,_i++,["I think I've got something that may *actually* interest you."]); //Mage
dialog_add(9,_i++,["We can't talk about it out here - my house is the one in the east on the raised platform. Hard to miss!"]); //Mage

//10: Hunter
_i = 1;
if fp.am_is_not dialog_add(10,_i++,["*You* shouldn't be here, yet you are. Kindred spirits, in that way."]); //Hunter
else dialog_add(10,_i++,["Hello, "+fp.nick+". I haven't seen you around down here."]); //Hunter
dialog_add(10,_i++,["I'm a hunter, here for some particularly big game."]); //Hunter
dialog_add(10,_i++,["It has been very elusive in this slippery underground."]); //Hunter
dialog_add(10,_i++,["Fortunately, I have some very... tantalizing bait for it to encounter."]); //Hunter
dialog_add(10,_i++,["I have set up camp to rest and wait for the trap to spring."]); //Hunter

dialog_add(10,_i++,["Would you like to share the night?"]); //Hunter


//11: Mage House Dialog
_i = 1;
dialog_add(11,_i++,["Now that we are away from the eyes of the guard..."]); //Mage
dialog_add(11,_i++,["There's hushed rumors going around - about Dr. Lacuna. They're a royal researcher stationed here from the Capital."]); //Mage
dialog_add(11,_i++,["Sent to 'survey the outskirts in the wake of the successional crisis.' That is well above their status."]); //Mage
dialog_add(11,_i++,["I always see them pass by my window and decend in the Abandoned Aqueduct."]); //Mage
dialog_add(11,_i++,["*MY* bet is they're a secret spy for the Merchant Port Company."]); //Mage
dialog_add(11,_i++,["But I can't go and be any more nosy than I've been, but you - as a special guest of the Command..."]); //Mage
if fp.am_is_noob dialog_add(11,_i++,["...Perhaps you could stumble into their studies and see what's going on?"]); //Mage
else if fp.am_is_evil dialog_add(11,_i++,["...Perhaps you could get them to spill their secrets?"]); //Mage
else if fp.am_is_insane dialog_add(11,_i++,["...You two will hit it off nicely I do think!"]); //Mage
else if fp.am_is_not dialog_add(11,_i++,["...Perhaps you could BLEED THEM DRY AND FEAST 
ON  THEIR            BONE             MARROW."]); //Mage
else dialog_add(11,_i++,["...Perhaps you could talk with them and gleam something?"]); //Mage
dialog_add(11,_i++,["They should be on the left side of town, right next to the old shrine."]); //Mage
dialog_add(11,_i++,["It's looking to be nighttime soon. A perfect time for snooping!"]); //Mage
dialog_add(11,_i++,["But be careful, people disappear durring the night..."]); //Mage

//13: Rykenburn 1:1
_i = 1;
dialog_add(13,_i++,[fp.nick+"..."]); //Ryken
dialog_add(13,_i++,["I was hoping you were not sent here to do this."]); //Ryken
dialog_add(13,_i++,["I was hoping my instincts were wrong."]); //Ryken

//14: Rykenburn 1:2
_i = 1;
dialog_add(14,_i++,["But with you here now, with how you got here - your true allegiance is shining clearly."]); //Ryken
// dialog_add(14,_i++,["You have been fed lies by those you trusted."]); //Ryken
dialog_add(14,_i++,["Fire is coiled tightly, the grip getting stronger by the day."]); //Ryken
dialog_add(14,_i++,["Here right before you is the hope of Fire."]); //Ryken
// if fp.am_is_fire dialog_add(14,_i++,["A new chance for us."]); //Ryken
dialog_add(14,_i++,["A remnant from a time that feels so distant..."]); //Ryken
dialog_add(14,_i++,["... And a remnant of a cause of the fall."]); //Ryken
if fp.am_is_evil || fp.am_is_not dialog_add(14,_i++,["This is *not* for you to squander selfishly."]); //Ryken
dialog_add(14,_i++,["This is what you were sent to snuff out? Our chance of reclaiming freedom? Our chance for redeption?"]); //Ryken
dialog_add(14,_i++,["The virtues of my actions are self-evident."]); //Ryken
dialog_add(14,_i++,["If this wisdom is not shining upon you..."]); //Ryken

//15: Rykenburn 1:3
_i = 1;
dialog_add(15,_i++,["May a trial by fire light up the truth!"]); //Ryken

////Quest Init

//1: Kei Rescue
quest_add(1,1,"Rescue","Defend from an unknown threat!",asset_get("empty_sprite"));

//2: Kei Rescue After
quest_add(2,1,"Get to Safety","Go to a safe(r) place.",asset_get("empty_sprite"));

//3: Supplier Gather
quest_add(3,1,"Food for Thought","Find the missing shipment in the Meadows to the south",asset_get("empty_sprite"));
quest_add(3,2,"Food for Thought","Find the missing crates in the Meadows (0/3)",asset_get("empty_sprite"));
quest_add(3,3,"Food for Thought","Find the missing crates in the Meadows (1/3)",asset_get("empty_sprite"));
quest_add(3,4,"Food for Thought","Find the missing crates in the Meadows (2/3)",asset_get("empty_sprite"));
quest_add(3,5,"Food for Thought","Return To Rykenburn",asset_get("empty_sprite"));
if fp.am_is_fire quest_add(3,5,"Food for Thought","Return To Rykenburn, your obligations are completed.",asset_get("empty_sprite"));
if fp.am_is_evil quest_add(3,5,"Food for Thought","Return To Rykenburn for your reward.",asset_get("empty_sprite"));

//4: Rykenburn's 2nd Task
quest_add(4,1,"Civil Duties","Collect Rubbish (0/52)",asset_get("empty_sprite"));

//5: The Lacuna Question
quest_add(5,1,"Inquiry","Find this helper in her home on the south side of town.",asset_get("empty_sprite"));
quest_add(5,2,"The Lacuna Question","Visit Dr Lacuna, who lives next to the shrine on the north side of town.",asset_get("empty_sprite"));
quest_add(5,3,"The Lacuna Question","Find clues for what has been going on.",asset_get("empty_sprite"));
quest_add(5,4,"The Lacuna Question","Get to the Temple Archives.",asset_get("empty_sprite"));
quest_add(5,5,"The Lacuna Question","Open the entrance to the Underground Aqueduct.",asset_get("empty_sprite"));

//6: Find Laboratory
quest_add(6,1,"Decend into Darkness","Search in the Underground Aqueduct.",asset_get("empty_sprite"));
quest_add(6,2,"Decend into Darkness","Defeat Rykenburn.",asset_get("empty_sprite"));


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
