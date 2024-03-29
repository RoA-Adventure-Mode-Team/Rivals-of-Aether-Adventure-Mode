# Rivals of Aether Adventure Mode Documentation
## Introduction
**Rivals of Aether Adventure Mode** is a fan-made API designed to extend RoA Workshop stages into fully-functional levels akin to *SSB Melee's Adventure Mode* and *SSB Brawl's Subspace*. 
It has been written to be read in order, so if you are just starting out I recommend you read through this guide once. It is organized by reference, so you can skip around to what you want to read up on using Ctrl-F.
It is a heavy API built on top of a quirky engine, it has its fair share of performance issues if not set up optimally. I highly suggest reading the optimization section as it can easily dip below 60 fps if not careful and/or the player's machine isn't capable. **Adventure Mode: Hallowflame**, the example level released with the API, should serve as a good example of the detailed principles on how to organize and code each aspect to best avoid these issues.

## Table of Contents

 1. General Structure & Development
 2. Lucid Dream Development Console & Cursor
 3. Room Manager and Loading Structure
 4. Articles
 5. Action Manager
 6. Window API
 7. Recommended Optimizations & Workflow
 8. Miscellaneous Tips & Publishing Guidelines

## General Structure
Adventure Mode's data flow is set up as article-oriented. Everything besides the base stage script the API interacts with is an article or array of some kind - this is to allow maximum flexibility with moderately low performance costs.

RoAAM has five major systems that interact heavily to facilitate creation of long-form levels: The **Room**, the **Action**, the **Scene**, the **Article** and the **Window**.

A **Room** is a lot like a GameMaker room - it's a collection of articles/objects set to spawn and run while at a certain room index. It is managed by the Room Manager (article5) and should only be interacted with on the outside via the given actions/functions to ensure everything gets set up right between room transitions. The 0 index room is considered global, everything placed there will execute on every room. You can detail custom articles for the room in user_event1.

An **Action** is an event that happens of a given type, with it's own variables and exit actions (actions which start once the action ends). There are actions that do something and immediately exit, there are some that function like if statements that only exit on certain conditions, and some that track and persist until their subprocess is complete (window spawns). It is managed by the Action Manager (article3). You can detail actions for the room, scene, and action index in user_event0. Custom actions can be implemented in the Action Manager.

A **Scene** is like a world state. It dictates which set of actions are active when in a room, and it persists between rooms. The 0 index scene is considered the global scene, everything in the global scene will run no matter the scene index inside the room. It is managed by the Action Manager in article3.

An **Article** is exactly as it sounds - it's a stage article object! AM forces similar structures on all articles and has specific formats for spawning them into rooms properly. Otherwise it behaves exactly as stage articles do. This is the major performance limiter - for performance reasons it is best to bundle as many details into the same article. So all static solid collision for each cell should be in the same article, as well as all background/foreground details on a certain layer.

A **Window** is a collection of GUI elements per the Window API (user_event2). You can define custom windows at the top using GUI elements, and you can define custom game frame and draw frame logic inside the respective functions. Windows and GUI Components have custom logic code as well as draw code that draws relative to the screen position.

Most of a level's custom code will be within user_events - `user_event0`, `user_event1`, `user_event2`, `user_event3`, `user_event6` and `user_event10`. You may edit any of the base code however you'd like, however we do recommend keeping out of the base files unless you know exactly what you're doing. If you are unsure about making a modification feel free to message our team and we'll be able to help. :)

### World & Coordinate Systems

The world by default is set to 20,000 units in each direction (10,000 pixels), with the centerpoint being [0,0] in cellspace. This is a tested value that maximizes size while limiting crashing upon startup. If you don't need this much room, I highly recommend lowering it even though it has minimal performance impacts as it makes AM more stable if there's less room size.

Precise, **real coordinates** are the raw unit values from the top left of the stage (rivals stage start at [0,0] being the top corner of the blastzones). This coordinate system is used by checkpoints, room transitions/teleports. Coordinates that need to be precise but aren't placed into the world will generally use this type.

**Cell coordinates** break up the current room into cells, which are then subdivided into subcells of 16x16 pixels (32x32 units). The center cell is considered [0,0] and the coordinates radiate from the center. This is used by most things in the API such as article spawns. 

#### Why Two Coordinate Systems?

The simple reason is it's easier to place things precisely on a smaller grid and get a better idea of relative distances for smaller numbers. Developers shouldn't need to worry about exact coordinates outside of precision you'd use the debug points for.

As a reminder, Rivals pixels are 2 units long.

### Limitations

RoA Adventure Mode is built within the RoA Workshop framework in GML - it follows all of the conventions and restrictions that apply. This means everything is inside a single stage file, so there is limited use of user_events, attack scripts, and limited numbered articles. It also means there's one static stage collision setup, which is why we use articles.

RoA Adventure Mode is an API built on top of Rivals Workshop on top of Rivals. While the base game is very optimized, workshop is interpreted and as such has a lot of overhead. AM has overhead of its own, and since it spawns a lot of articles it can be relatively intense to run. In my playtesting, rivals can handle ~200 articles rendered before slowdown on a medium-specs computer. Draw calls outside of the viewport seem to add minimal lag, however draw calls that display are *very* heavy and should be avoided when possible.

Something to note is that the debug features are not optimized - you will get slightly worse performance with them on.

At a certain point, the poject might get too big and it becomes inaccessable in the stage editor due to size (it will crash when trying to load) - getting used to editing from practice mode is a suggestion.

Anything we can't do in Workshop stage coding (file access/read/write, zoom, viewport changes, streaming assets, removing Sein, etc) is also not possible in AM.

#### Workshop Character Limitations

Due to how collision is coded with stage artices, base cast and custom character articles might behave weirdly. For character creators, this is a very simple fix - in collision detection scripts, you need to add a check for `obj_stage_article_solid` for solid collisions and `obj_stage_article_platform` for platforms.

Another bit is on-hit effects by default do not work since we cannot call on hit from our article enemies. Thankfully, you can copy the on-hit code into a local user_event on your character and specify it's number via `hit_player_event` and AM will use that as a sudo-on-hit script for the enemies.

#### Online Multiplayer Support?

Online Multiplayer is something that was initially scoped in but with further changes to the online system on its way and focusing on polishing up the local experience it's something we can't officially support fully at this time. We've made efforts to make sure that our gameplay code is client-independent - however this does not preclude desyncs due to loading and lag and multiplayer may be very unstable. Feel free to submit bugs about this feature, just no promises it'll get to be 100% working.

### Core Engine Changes

There are a few miscellaneous engine changes implemented to make this all possible and also to remove some tedium from running the stages. The big gameplay change is that if you hold the same direction off a ledge and onto ground below, you will go back into dash immediately. Collision detection changes for walljumps are added for precise collisions.

## Lucid Dream Development Console & Cursor

Outside of the actual operating structure is **Lucid Dream**, the development console & cursor system built in the Window API. It has a plethora of functions for creating, editing, and exporting articles. Open it with tilda (\`), type with the keyboard, enter is ?, backspace is \\. Currently, it defaults to strings for arguments but you can specify a few argument parameters to get the data type needed.

**r:'varname'** will get the resource of that specific name (similar format to resource_get("varname")).

**d:'varname'** will force the string into a real number. WARNING - failiure to make varname into a real can crash the game! (This is a GameMaker 2 thing I can't fix it!)

**v:'varname'** will get the value of the variable of the given name in the main stage object.

Keep in mind you can **export** in-game adjustments using `export`. Double check the export and replace with the correct values/formatting as needed (for example we cannot grab resource true names, so you will need to replace odd numbers with their correct resource gets).

Articles can be selected with left mouse, and moved around with right mouse. Selected articles can be acted upon via certain console commands. You can generally assume a non-global command will act in the selected articles' scope.

Left mouse when not on an article will make a debug point which will give you the room/cell coordinates of the point as well as the true x,y values.

For a full list of commands, type the `help` command. You can reference each of their functions bellow:

### Lucid Dream Commands

`acts` - print the running actions

`act_play d:action_id` - execute an action with id `id`

`attack d:attack_id` - cause all selected enemies to perform the specified attack

`lucid` - toggle debug mode - this brings up the cursor for selecting, resource monitor, and other misc debug info

`freeze` - toggles whether enemies process their inputs or not

`clone`:`c` - clones all selected articles at their positions

`destroy`:`d` - destroys all selected articles

`clear` - clears the console and removes all debug points

`debug_ouput` - toggles whether articles output to the rivals print log

`dist` - gives the distance between debug points, in sequential order

`deselect`:`ds` - deselects all selected articles

`export` - probably the MOST IMPORTANT function to know - it compiles each selected article into the room article format and gives you instructions on how to import it. Double check the export and replace with the correct values/formatting as needed (for example we cannot grab resource true names, so you will need to replace odd numbers with their correct resource gets)

`get variable_name` - gets the values of a variable for the selected articles. If there's nothing selected, it will attempt to get a value from the main stage object

`god` - toggle god mode for the player

`kill` - cause all players to die who haven't been killed

`last <d:num_back>`:`l <d:num_back>` - repeat the last command - if `num_back`is specified will repeat the command from `num_back` commands ago

`list <d:num>` - lists all article ids with an article `num` - if nothing is specified, it will return the ids of all selected articles

`peace` - toggle if enemies will attack (useful for debugging movement alone)

`plat sprite_name` - spawns a platform article at the standard platform depth using the specified sprite

`qt d:collision_type r:resource d:anim_speed` - spawns a terrain article with the specified items. NOTE: `collision_type` is the same numbers as in the stage editor

`room d:room_id` - force a room transition to the specified id

`s_state` - save the current game state of the players (very very experimental and laggy - really shouldn't be used for much)

`l_state` - load the current game state of the players (very very experimental and laggy - really shouldn't be used for much)

`select d:object_id` - select an object of the given id. NOTE: the `select` functionality is built around articles, so some functions may behave weirdly or not at all on selected non-stage articles

`set variable_name value`:`s variable_name value` - set the variable in selected to a value. If there's nothing selected, it will attempt to set a variable from the main stage object to the value

`spawn d:article_num d:collision_type d:depth <spawn_variables..>` - spawn an article at the cursor with the given number, collision type, depth, and spawn variables

## Structure & Use Cases
### Common Use Cases
This API has tools for all sorts of applications, mainly medium to long form platforming stages. However it is definitely encouraged to add, remove, edit, or copy these tools into other stages and projects that require more/some/different functionality. Just remember to credit the AM team if you do!

## Room Manager and Loading Structure (article5, user_event1)
The actual data for spawning articles in the right places is in *user_event1.gml*. This is run once on spawn to initialize all the data for the stage, and does get edited as the player plays the rooms and can effect them. Each Room is added via the following function:

    room_add(room_index, [room_data]);

**room_index** - the index value of the room, the identifier that is used to determine what articles to spawn.
**room_data** - the array which holds the data of all the articles in the room, organized by cell. It has this format:

    room_add(room_index,[ //Room X
    	[ //Cell 1
    		[cell_x,cell_y],
    		[
    			[article_data],
    			[article_data],
    			.
    			.
    			.
    		]
    	],
    	[ //Cell 2
    		[cell_x,cell_y],
    		[
    			[article_data],
    			[article_data],
    			.
    			.
    			.
    		]
    	],
    	.
    	.
    	.
    ]);
**cell_x** - the cell's x coordinate on the cell grid (cells are 163x85 subcells large, or 2608x1360 units)

**cell_y** - the cell's x coordinate on the cell grid (cells are 163x85 subcells large, or 2608x1360 units)

**article_data** - the data for each article being spawned in a cell. Each article instance is stored as an array in the following structure:

    [article_num, x, y, type, depth, [arg0, ... arg7], [0, 0, custom_args, ...]],
**article_num** - the number of the article to spawn, tells the game which scripts to run (*articleX_update.gml* for example)
**x** - the x position to spawn the article inside a cell, in a grid of 16x16 pixels. 
**y** - the y position to spawn the article inside a cell, in a grid of 16x16 pixels. 
**type** - the collision type of the article - either solid, platform, or none.
**depth** - the draw depth of the article in question, negative is in front of, with positive being behind the player.
**[arg0, ... arg7]** - the default arguments for the article (the same ones in the stage editor). These are set the first frame of an article's existence.
**custom_args** - any extra custom arguments that you would like to make. (See the *Article* for extra) should persist between room loads.

## Default Articles
There are a few pre-allocated articles with custom coding to serve different object requirements for making a level complete. Here is a quick breakdown of each and their arguments.

### Article1 - Quick Terrain
Quick Terrain is the standard visual article - it will spawn in its position, display a sprite and do nothing else! If you set the article to be solid, it will be solid throughout the bounding box. If you set it to be a platform, it will create a platform position at the top of the spritebox. MAJOR NOTE: Precise collision changes these rules - solid articles with precise collision on their sprites will only have collision on non fully transparent pixels! And platform ground at the top of the sprite will only exist if the pixel at the top edge is non fully transparent.

#### Arguments
`...[sprite_index, anim_speed, 0, static, alpha, image_blend, 0], ...`

**sprite_index** - (int) the sprite index of the article to draw

**anim_speed** - (float) the speed of the animation if the sprite strip is more than 1 frame

**static** - (bool) if the sprite follows the camera instead of the rest of the world

**alpha** - (float) the transparency of the sprite from 0 to 1

**image_blend** - (color) the color to apply to the sprite as a filter

### Article2 - UNUSED
Article2 is left empty


### Article3 - Action Manager
The Action Manager is instanced once on startup, and only one can exist (singleton). It persists for the full duration of the level, and generally can be acecssed globally with `action_manager`. It is responsible for executing all the code related to AM actions.

### Article4 - Detection Zones
Detection Zones are areas that trigger an action when certain criteria are met.

#### Arguments
`...[action_id, active_scene, trigger_obj_type, trigger_cooldown_max, trigger_shape, trigger_w, trigger_h, [req_item_id,hold_up,trigger_relative,check_visibility]], ...`

**action_id** - (int) the id of the action to perform

**active_scene** - (int) the minimum scene index for a detection zone to fire

**trigger_obj_type** - (int) the object_index of what it is listening for. Defaults to `oPlayer`

**trigger_cooldown_max** - (int) the frame count before the zone refreshes and allows another activation. If set to -1, the zone will destroy on activation

**trigger_shape** - (enum) the shape of the trigger zone. 0 is a RECTANGLE, 1 is a CIRCLE, and any other value will have it use its SPRITE_MASK

**trigger_w** - (int) the width of the detection box (radius for a circle)

**trigger_h** - (int) the height of the detection box (unused for a circle)

**req_item_id** - (int) the required item an entity must be carrying in order for the detection to take place. Defaults to 0, aka not needing an item

**hold_up** - (bool) if an up input is required to activate this box. It will spawn a prompt below the entity when colliding

**trigger_relative** - (bool) do the actions get performed on the stage main object, or on the entity that detected it? This is generally used in the case of hitrboxes which need to spawn relative to whatever triggered it, or particles Defaults to false

**check_visibility** - (bool) does the box check to see that the entity is clearly visible (not depth behind any mask) before firing?

### Article5 - Room Manager
The Room Manager is instanced once on startup, and only one can exist (singleton). It persists for the full duration of the level, and generally can be acecssed globally with `room_manager`. It is responsible for executing all the code related to AM rooms.

### Article6 - Article NPC
Article NPCs function a lot like player objects, except with slightly less overhead and a few simplified rules. They have a specific file structure and `user_event6` to add things. They are set up pretty similarly to players, so you can copy/paste player code for the most part into each of their events. 
A few caveats: 
1. You need to use any of the default attack/hitbox index functions inside the `obj_stage_main` scope 
2. Character's `hit_player` script will not run - creators will need to copy the code over to a `user_event` and set `hit_player_event` in `other_init` in order for AM to be able to call it
3. `state` is renamed to `art_state`, and `free` is renamed to `is_free` (this is due to them being default variables that change outside of the article's control)

#### Arguments
`...[enem_id, 0, 0, waypoints, 0, 0, 0], ...`

**enem_id** - (int) the id of the npc to spawn
**waypoints** - (array[index,index]) an array of 2D points that can be used by the npc to navigate. Custom navigation of these points can be set in the AI scripts for this article NPC id.

### Article7 - Camera Controller Zone
A Camera Controller Zone is an article dedicated to camera manipulation. You can set the position of the camera while inside the zone and also which axis are locked (horizontal vs vertical vs both)

#### Arguments
`...[trigger_shape, trigger_w, trigger_h, lock_type, cam_lock_x, cam_lock_y, active_scene, 0], ...`

**trigger_shape** - (enum) the shape of the trigger zone. 0 is a rectangle, 1 is a circle, and any other value will have it use it's sprite mask

**trigger_w** - (int) the width of the detection box (radius for a circle)

**trigger_h** - (int) the height of the detection box (unused for a circle)

**lock_type** - (enum) which axis get locked - 0 is BOTH, 1 is only Y, and 2 is only X

**cam_lock_x** - (int) the position to transition the camera to in the X axis. If 0, will default to the middle of the article's shape.

**cam_lock_y** - (int) the position to transition the camera to in the Y axis. If 0, will default to the middle of the article's shape.

**active_scene** - (int) the minimum scene index for a detection zone to fire

### Article8 - Room Transition
Room Transition is a dedicated article to transfering players between rooms.

#### Arguments
`...[active_scene, trigger_shape, trigger_w, trigger_h, to_room, extra_room_vars, hold_up, event_id, item_needed], ...`

**active_scene** - (int) the minimum scene index for a detection zone to fire

**trigger_shape** - (enum) the shape of the trigger zone. 0 is a rectangle, 1 is a circle, and any other value will have it use it's sprite mask

**trigger_w** - (int) the width of the detection box (radius for a circle)

**trigger_h** - (int) the height of the detection box (unused for a circle)

**to_room** - (int) the room_id of the room to transition to

**extra_room_vars** - (array[enum,int,int]) in order: the type of room transtion effect, the x position in the next room to go to, and the y position in the next room to go to

**hold_up** - (bool) if an up input is required for the room transition to occur

### Article9 - Checkpoint
This sets where the player will respawn if whithin its radius.

#### Arguments
`...[trigger_shape, trigger_w, trigger_h, 0, 0, 0, 0, 0], ...`

**trigger_shape** - (enum) the shape of the trigger zone. 0 is a rectangle, 1 is a circle, and any other value will have it use it's sprite mask

**trigger_w** - (int) the width of the detection box (radius for a circle)

**trigger_h** - (int) the height of the detection box (unused for a circle)

### Article10 - Items
This is the article dedicated to pickupable items! They by default will keep between room transitions. You can detail custom behaviors for them in `user_event10`for a variety of event cases.

**EVT.GRAB** - while the item is on the floor, aka looking for someone to grab it
**EVT.IDLE** - while the item is in the player's posession, by default following around the player
**EVT.USE** - when a player presses attack with the item equipped
**EVT.ALTUSE** - when a player presses special with the item equipped
**EVT.DESTROY** - when the item is scheduled to be destroyed this frame
 
#### Arguments
`...[item_id, sprite_index, grav_radius, grav_accel, 0, item_name, 0, 0, 0], ...`

**item_id** - (int) the type of item, what defines its behavior

**sprite_index** - (sprite) the default sprite of the item

**grav_radius** - (float) the radius where it will suction towards a player

**grav_accel** - (float) the speed at which the item will go towards the player

**item_name** - (string) The display name when the item gets picked up

### Article11 - Dithering Article
This article can dither out of existence as a player is drawn behind/in front of it.
 
#### Arguments
`...[sprite_index, dither_type, full_transparency, dither_time, collis_type, parallax_x, parallax_y, static], ...`

**sprite_index** - (sprite) the default sprite of the article

**dither_type** - (enum) 1 is a pixel dither, 2 is a brick dither, 3 is an instant transmission dither. Defaults to a gradual fade out

**full_transparency** - (float) the final alpha value after dithering

**dither_time** - (int) how long it takes for the article to fade out

**collis_type** - (enum) 0 is a box collision, 1 is precise collision (NOTE: will need to set precise collision in load as well!)

**parallax_x** - (float) the ammount of horizontal parallax (experimental)

**parallax_y** - (float) the ammount of vertical parallax (experimental)

**static** - (bool) Does this article stay in place (false), or does it follow the camera (true)

### Article12 - Dynamic Lighting
This article projects lighting into the scene
 
#### Arguments
`...[sprite_index, anim_speed, follow_player, cant_root, 0, 0, 0, 0], ...`

**sprite_index** - (sprite) the default sprite of the light, brightness correlates with brighter blending, alpha correlates with the ammount of blend

**anim_speed** - (float) the speed of the animation, in .01 units

**follow_player** - (bool) does the light follow the player? (you can change the `follow_object` variable to set it to any object - however this must be done via actions at runtime)

**cant_root** - (bool) all drawing is done in the first instance of article12 - if this is true, this article instance will never be the one drawing

### Article13 - Player Shadows
This article displays player shadows when they are behind an object. These articles keep between room transitions naturally. For most applications, you should just copy these lines of article spawns to your initial room:

```
//Player Shadow
[13, 0, 0, 0, -7, [0, 0, 0, 0, 0, 0, 0, 0], [0,0]],
[13, 0, 0, 0, -15, [1, make_color_rgb(24, 32, 64), 0, 0, 0, 0, 0, 0], [0,0]],
```
 
#### Arguments
`...[type, color, 0, 0, 0, 0, 0, 0], ...`

**type** - (enum) if the shadow is a mask (0) or drawn (1)

**color** - (color) the color of this shadow

### Article14 - Particle Emitter
This article emits particles as long as the game is at 60 fps. It will cull them as the fps drops.
 
#### Arguments
`...[sprite_name, spawn_time, vfx_time, type, vel, alpha, 0, 0], ...`

**sprite_name** - (string) the sprite name, we need to feed it the name so that sprite properties can be accurately obtained

**spawn_time** - (float) the frequency of particles being emitted per frame

**vfx_time** - (int) the amount of time the particle will be alive - the sprites will be divided between evenly

**type** - (int) the particle type, there's two by default - still (0) and frictioned (1)

**vel** - (float) the vertical velocity of the particle, and also gives some horizontal velocity

**alpha** - (float) the alpha of the particles

### Article15 - Destructible Terrain
This article can be removed via a hitbox hitting it.
 
#### Arguments
`...[sprite_index, anim_speed, 0, 0, dest_sfx, action_id, active_scene, alpha_time], ...`

**sprite_index** - (sprite) the default sprite of the article

**anim_speed** - (float) the speed of the animation, in .01 units

**dest_sfx** - (sound) the sound effect to make when it gets hit

**action_id** - (int) the action to trigger upon hitting

**active_scene** - (int) the smallest scene where it is active - if it's negative, it will be active until this scene value

**alpha_time** - (float) the time for the object to fade away


## Action Manager & Loading Structure (article3, user_event0)
*Actions* are events which can manipulate the room and the GUI while it is loaded and running. They are loaded from *user_event0* whenever a scene or room changes, and follow a specific format:

    action_add(room_id, scene_id, action_id, action_type,
    [act_args],
    [act_end]);

**room_id** - the room the action belongs to. It will only run when the current room is this room

**scene_id** - the room's scene the action will run on. If this is 0, it will always run

**action_id** - the id for this action, used to be referenced to for starting other actions

**act_args** - the arguments for a given action

**act_end** - the actions to start at the end of these current ones

Actions are kept track of globally, but only actions of the current room in the current scene are processed (this includes actions in the global room 0, and the current room's global scene 0). When a room transitions these actions stop ticking and stop effecting the game state until the room is returned to, where they will continue from where they left off.

There are a plethora of basic actions which perform all sorts of tasks which allow for the full creation of a level. If you need to extend functionality you can add your own actions inside user_event3. There are plenty of types of actions: 

*Instant* - An action that will immediately execute and end on the same frame

*Conditional* - An action that checks against a condition every frame; when it's true, it will end. They generally are more logic operators than actors.

*Perpetual* - An action that continues until it is called to stop - generally, these types manage other objects and are called to end when they do.

## Default Action Types & Variables

### ACT.WINDOW
*Perpetual* Display a new Window API instance. Exits upon the window exiting.

#### Arguments
`[window_num, x, y, [contentoverride]],`

**window_num** - (int) the Window API number to display

**x** - (int) the screen-space x coordinate of the new window

**y** - (int) the screen-space y coordinate of the new window

**contentoverride** - (array[array]) the contents of the window to override - formatted as a nested array like [element1, element2, element3]

### ACT.CONTROL
*Instant* Take manual control over players (experimental, results may vary).

#### Arguments
`[player_id, life_time, state_override],`

**player_id** - (oPlayer) the player to take control over

**life_time** - (int) the frame count this action will be active for

**state_override** - (enum) the PS_STATE to override the current player state

### ACT.WAIT
*Conditional* Wait a given frame count, then end the action.

#### Arguments
`[frames],`

**frame** - (int) the frame count to - get this - *wait* before ending the action. Yes, very complex - give it a moment to sink in.

### ACT.PLAY_SOUND
*Instant* Play a sound.

#### Arguments
`[sound],`

**sound** - (sound) the sound

### ACT.SET
*Perpetual/Instant* Set a varaible inside an article group.

#### Arguments
`[article_group, variable, value, ease_type, ease_length],`

**article_group** - (int) the article group to apply this SET to

**variable** - (string) the variable name in the above named article group to set

**value** - (var) the value to apply to the above named variable in the above above named article group

**ease_type** - (enum) (0) will linearly ease the variable to the value in ease length time (1) will set in the next frame

(optional) **ease_length** - (int) if included, the action will ease for the time given. if not, it will set the value *instant*-ly

### ACT.ON_INPUT
*Conditional* Exit upon detecting an input of a type from a(ny) player

#### Arguments
`[player?, input_type],`

**player?** - (oPlayer) (0) any player - otherwise, only that player_id (MAKE SURE YOUR METHOD OF GETTING PLAYER IDS IS DESYNC-SAFE)

**input_type** - (enum) the `PC_PRESSED` to look for to exit

### ACT.SW_ROOM
*Instant* Switch the room using a room transition. WARNING - any actions started after this will NOT run until the room is returned to (unless they are global)!

#### Arguments
`[to_room, type, to_coords],`

**to_room** - (int) the room to go to

**type** - (int) the variable name in the above named article group to set

**to_coords** - (array[x,y]) the real coordinates of where in the next room to place the player

### ACT.QUEST_PROG
*Instant* Set the progress of a quest

#### Arguments
`[quest_id, action_type, amount],`

**quest_id** - (int) the quest id getting edited

**action_type** - (enum) (0) set the quest progress forward to the value, (1) set the quest progress to the value - overriding the previous, (2) add or subtract from the quest progress

**amount** - (int) the number to adjust the quest progress to/by

### ACT.ON_QUEST_PROG
*Conditional*  Exits if the quest progresses to a certain point

#### Arguments
`[quest_id, progress_prog, type],`

**quest_id** - (int) the quest id to read the progress of

**progress_prog** - (int) the number to check the quest progress against

**type** - (enum) (0) the quest progress is exactly equal (1) if the quest has progressed to or beyond this point (1) if the quest has not progressed to or beyond this point

### ACT.SUS
*Instant*  Suspend an action. Suspending an action makes it no longer process, you must call ACT.SUS on it again for it to unsuspend.

#### Arguments
`[suspend_bool, action_id],`

**suspend_bool** - (bool) (0) does this action suspend or (1) unsuspend the action 

**action_id** - (int) the action ID to suspend

### ACT.KILL
*Instant*  Murders an action by id. You monster.

#### Arguments
`[action_id],`

**action_id** - (int) the action ID to spill the guts of

### ACT.SPAWN_ART
*Instant*  Spawn an article using the room format.

#### Arguments
`[room_format],`

**room_format** - (array[room_article]) The same format as an article entry in a room - see the above section on room articles for more details.

### ACT.CHECK
*Conditional* Checks an article group for any instance of a variable being a value

#### Arguments
`[article_group, variable, value],`

**article_group** - (int) the article group to check values in

**variable** - (string) the variable in the group to check

**value** - (var) the value to check for

### ACT.ART_COUNT
*Conditional* Checks how many articles are in a group. Exits depending on the count and equality

#### Arguments
`[article_group, count, equality],`

**article_group** - (int) the article group to check values in

**count** - (int) the ammount to check for

**equality** - (enum) exit upon (0) less than or equal, (1) greater than or equal

### ACT.SCENE
*Instant* Changes the scene to the given scene id

#### Arguments
`[set_add, scene_id],`

**set_add** - (enum) (0) set or (1) add the scene id value
 
**scene_id** - (int) the scene id to change to/add

### ACT.RANDOM
*Instant* On exit picks ONE of the exit actions and execute it.

#### Arguments
`[seed],`

**seed** - (int) the seed to use for the random outcome

### ACT.SET_RELATIVE
*Perpetual/Instant* Set a varaible inside the relative id that gets passed to this action - generally, the relative id is passed from detection boxes as the object that triggered them.

#### Arguments
`[variable, value, ease_type, ease_length],`

**variable** - (string) the variable name in the above named article group to set

**value** - (var) the value to apply to the above named variable in the above above named article group

**ease_type** - (enum) (0) will linearly ease the variable to the value in ease length time (1) will set in the next frame

(optional) **ease_length** - (int) if included, the action will ease for the time given. if not, it will set the value *instant*-ly

### ACT.HITBOX
*Instant* Spawn a hitbox using the stage data at the relative id's location

#### Arguments
`[attack_id, hitbox_num],`

**attack_id** - (int) the attack id to grab from

**hitbox_num** - (int) the hitbox num to grab

### ACT.KILLBOX
*Instant* Spawn a killbox using the stage data at the relative id's location

#### Arguments
`[background],`

**background** - (enum) the background type - see the Roa Workshop Documentation for the killbox background types.

### ACT.TRANS_MUSIC
"*Instant*" Transition the current music track to the given one

#### Arguments
`[to_music_index],`

**to_music_index** - (sound) the music to transition to

### ACT.DESPAWN
*Instant*  Kindly asks an article group to despawn

#### Arguments
`[article_group],`

**article_group** - (int) the article group to despawn

### ACT.EMIT_PARTICLE
*Perpetual*  Like the particle article except via actions. One instance of ACT.EMIT_PARTICLE acts as the temporary particle manager, any more than one add to the manager's array. These aren't GPU particles or anything nearly optimal. Do use sparingly.

#### Arguments
`[x,y, sprite, vfx_time, disable_movement, alpha],`

**x** - (int) the screen-space x coordinate of the new window

**y** - (int) the screen-space y coordinate of the new window

**sprite** - (sprite) the particle's sprite to draw

**vfx_time** - (int) the full time the particle will be alive

**disable_movement** - (bool) if the particle doesn't move, enable this for efficient processing

**alpha** - (float) the alpha value of the partile's sprite

### ACT.END_GAME
*Instant*  calls `end_match()`

#### Arguments
`[],`

## Window API
The Window API (user_event2) looks daunting at first, but it is in essence a few basic functions:
1. Loading the default data for each window id, made of components (win_call == 1)
2. Running the logic for each active window and their components (logic_window())
3. Drawing each active window and their components (draw_window())

A window defined here is a set of default values for a collection of elements. They have their own logic that runs specifically for the window as a whole. Elements are structured data types with specific arguments for specific use cases. They have their own default logic and draw code in the respective functions. You can see the list of them in user_event2 and looking for the `new_` prefix. Feel free to add your own as you see fit.

The default values in each window/element can overwritten when instancing them via `ACT.WINDOW` - this makes them flexible GUI templates for use and reuse throughout a level. There's a lot of complexity that's best explored by studying what each window does and the logic to obtain it. The big things to keep in mind are: 
1. A window as a data type is just an array with it's template id given at index 0, then every entry from there is an element. 
2. A element has it's template id at index 0, with every entry afterwards being data related to that element.
3. Element placements are relative to the window's position.

There are plenty of various implementations in Hallowflame to illustrate how to use this system:

### WIN.NOTE_SCROLL

This window displays a png image over a transparent black background. When the player pressess attack or shield, it closes the window.

### WIN.AREAFADE

This window displays the area title cards for a time where it appears slowly, and ends when it fades to transparency.

### WIN.QUESTLIST

Quests is the global quest popup that shows in the bottom left of the screen throughout the level. It has functionality for displaying in-progress quests, as well as a little jingle and visual for when quests are complete.

### WIN.DIALOG_DEFAULT

Dialog Default is the dialog box used to display character chats 0 it reads a data structure implemented in user_event0 for it's given dialog_index

### WIN.POPUP_DIALOG

Popup Dialog reads the same strcuture as WIN.DIALOG_DEFAULT in user_event0 for it's given dialog_index, but it displays the dialog in the world as opposed to on the GUI space

## Player/Character Options

AM Features a few mostly lore options to make sure characters are properly addressed and to offer some customization to make stories make a bit more sense from a character's point of view.

AM Devs keep in mind how these are set, I highly recommend formatting dialog to utilize these features (can be called via the `follow_player` object, the local player). 

### Pronouns & Nicknames

You can customize which pronouns a character gets addressed as via the `pronouns` variable in the character's `init.gml` file.

Nicknames are something the character goes by if people do not know their name - generally this is customized by the level (as we assume npcs do not know them and have their own ideas on what to call this new person), however a default value can be provided by a character in the case the level creator does not wish to impose nicknames. Use `nick` in `other_init.gml` for this feature.

### Character Attributes

There are a few character attributes that can be used to effect options, either to change things that don't make sense (calling a small character 'big guy' or the inverse), or to provide a more accurate option (an evil character probably won't do charity hero work but they may take pay). Here is a list of the default provided, feel free to add your own to your levels and character creators feel free to set them as you please. Most of these if not defined are assumed to be the most likely answer. (See `other_init.gml` for the list of default assignments)

```
am_is_fire 			- Is a fire elemental - fire, plasma, smoke, cooking
am_is_water			- Is a water elemental - water, ice, poison, sweat
am_is_air			- Is an air elemental - wind, music, thunder, pure rage
am_is_earth			- Is an earth elemental - rock, plant, plant, crystal
am_is_aether		- Is an aether elemental - Space, mysticism
am_is_abyssal		- Is a creature of the abyss
am_is_subterranain	- Is from the underground
 
am_is_verbal		- Is capable of speaking complex languages
am_is_noob			- Is unfamiliar with things or naieve
am_is_experienced 	- Does exude experience

am_is_future		- Is this character from a future?
am_is_past			- Is this character from the past?
am_is_myth			- Is this character part of a mythos?

am_is_evil			- Has a self-centered moral compass
am_is_chaotic		- Has a particularly flexible moral compass
am_is_insane		- Experiences reality in a unique way

am_is_undead		- Was dead... now is not
am_is_construct		- Is living through "unnatural" means aka " purpose-built"
am_is_magic			- Is supernatural in a magical way
am_is_big			- Is this character much larger than average?
am_is_small			- Is this character much smaller than average?
am_is_handed		- Does this character have appendages to hold things with?

am_is_guest			- Is this character not an atherian local?

am_is_realitybreak	- Is this character a casual reality manipulator?
am_is_not			- They do not belong. They shouldn't be here. They do not belong. They shouldn't be here. They do not belong. They shouldn't be here.

```

Hallowflame and the empty AM template come with the base cast pre-set!

Feel free to reach out and suggest additional options!

## Optimization Strategies

The RoAAM team will continue to do our best optimizing the engine over time, however as stated in Limitations there is a lot of overhead to account for, and the mod will not run well on lower end computers. Here are a list of optimization strategies figured out during the development of Hallowflame to help lift the computational burden.

### Article Bundling
Bundle as many articles into one as you can. This means all animated sprites of the about the same speed should be all on one sheet. Keep all solid, static collision bundled as one article per cell and define the bounding box as precise in load.gml. How I did this for Hallowfame was I made a large sprite segmented into cell sizes and exported the collision, background, and forground groups in their own spritesheets. See Hallowflame's sprite folder for plenty of examples. This can also be done for animated articles and also detectors if you want to be very light-weight (they can take a sprite mask argument).

### Room Shrinking
Break up rooms when appropriate, have smaller rooms instead of bundling many into one. If you have a small offshoot room make it its own thing so that the room manager doesn't need to spawn everything else on room transfer.

### Enemy Culling
Keep heavily in mind the number of active enemies. Enemies in particular are VERY heavy, I would suggest limiting it to 3-4 on-screen enemies at max. Off-screen, enemies do not process and so have about as much overhead as any article. 

## Common Errors

### My sprites' collision is off/a massive rectangle
You need to properly set the collision to precise - Rivals defaults all collision to be imprecise unless otherwise specified. It's very simple to fix this, add this line to `load`: `sprite_change_collision_mask("sprite_name",true,0,0,0,0,0,0);`

### \_param out of scope/expected an argument of type/index out of bounds
This usually means something went wrong with your action arguments - You can get an idea of which action is causing the fault by seeing which part of the action switch statement the error is coming from.

### spawn_variables out of scope/index out of bounds
This usually means something went wrong with your article arguments - You can get an idea of which action is causing the fault by seeing which article file the error is coming from.

## Miscellaneous Tips & Publishing Guidelines

The freedom to make anything a developer desires is a core philosophy of this tool. However, I hope to establish some guidelines in order to minimize confusion.

- Please clearly label a stage made with AM - with an [AM] and "Adventure Mode" tag in the description somewhere so that it can be searched for on the workshop!
- Try to make situations which make some sense for a lot of characters. Keep in mind character-specific traits and create alternative options where it makes sense. Making a character-specific adventure is fine but keep in mind people will want to play the adventure with anyone on the workshop.
- On a similar note speaking FOR the player character is an odd choice that should probably be avoided due to how many personalities exist in the workshopverse.
- Comment your code thoroughly! This API certainly isn't immediately readable, clearly label the purpose of everything and save future you some headaches.
