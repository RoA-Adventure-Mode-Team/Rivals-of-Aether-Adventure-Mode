# Rivals of Aether Adventure Mode Documentation
## Introduction
**Rivals of Aether Adventure Mode** is a fan-made API designed to extend RoA Workshop stages into fully-functional levels akin to *SSB Melee's Adventure Mode* and *SSB Brawl's Subspace*. 
It has been written to be read in order, so if you are just starting out I recommend you read through this guide once. It is organized by reference, so feel free to skip around to what you want to read up on using Ctrl-F.
It is a very heavy API built on top of a quirky engine, it has its fair share of performance issues if not set up optimally. I highly suggest reading the optimization section as it can easily dip below 60 fps if not careful and/or the player's machine isn't relatively powerful. **Adventure Mode: Hallowflame**, the example level released with the API, should serve as a good example of the detailed principles on how to organize and code each aspect to best avoid these issues.

## Table of Contents

 1. General Structure & Development
 2. Lucid Dream
 3. Room Manager
 4. Articles
 5. Action Manager
 6. Window API
 7. Recommended Optimizations & Workflow

## General Structure
Adventure Mode's data flow is set up as article-oriented. Everything besides the base stage script the API interacts with is an article or array of some kind - this is to allow maximum flexibility with moderately low performance costs.

RoAAM has five major systems that interact heavily to facilitate creation of long-form levels: The **Room**, the **Action**, the **Scene**, the **Article** and the **Window**.

A **Room** is a lot like a GameMaker room - it's a collection of articles/objects set to spawn and run while at a certain room index. It is managed by the Room Manager (article5) and should only be interacted with on the outside via the given actions/functions to ensure everything gets set up right between room transitions. The 0 index room is considered global, everything placed there will execute on every room. You can detail custom articles for the room in user_event1.

An **Action** is an event that happens of a given type, with it's own variables and exit actions (actions which start once the action ends). There are actions that do something and immediately exit, there are some that function like if statements that only exit on certain conditions, and some that track and persist until their subprocess is complete (window spawns). It is managed by the Action Manager (article3). You can detail actions for the room, scene, and action index in user_event0. Custom actions can be implemented in the Action Manager.

A **Scene** is like a world state. It dictates which set of actions are active when in a room, and it persists between rooms. The 0 index scene is considered the global scene, everything in the global scene will run no matter the scene index inside the room. It is managed by the Action Manager in article3.

An **Article** is exactly as it sounds - it's a stage article object! AM forces similar structures on all articles and has specific formats for spawning them into rooms properly. Otherwise it behaves exactly as stage articles do. This is the major performance limiter - for performance reasons it is best to bundle as many details into the same article. So all static solid collision for each cell should be in the same article, as well as all background/foreground details on a certain layer.

A **Window** is a collection of GUI elements per the Window API (user_event2). You can define custom windows at the top using GUI elements, and you can define custom game frame and draw frame logic inside the respective functions. Windows and GUI Components have custom logic code as well as draw code that draws relative to the screen position.

Most of a level's custom code will be within user_events - `user_event0`, `user_event1`, `user_event2`, `user_event6` and `user_event10`. You may edit any of the base code however you'd like, however we do recommend keeping out of the base files unless you know exactly what you're doing. If you are unsure about making a modification feel free to message our team and we'll be able to direct you :)

## Lucid Dream Development Console

Outside of the actual operating structure is **Lucid Dream**, the development console built in the Window API. It has a plethora of functions for creating, editing, and exporting articles. Open it with tilda (\`), type with the keyboard, enter is ?, backspace is \\. Currently, it defaults to strings for arguments but you can specify a few argument parameters to get the variable type needed.

**r:'varname'** will get the resource of that specific name (similar format to sprite_get("varname")).

**d:'varname'** will force the string into a real number. WARNING - missuse can crash the game! (This is a GameMaker 2 thing I can't fix it!)

**v:'varname'** will get the value of the variable of the given name in the main stage object.

Keep in mind you can **export** in-game adjustments using `export`. We cannot read real sprite names and certain variable types will be misformatted so double check the export and replace with the correct values/formatting.

For a full list of commands, type the `help` command. If you need specific help with a function type `man <function name>`.

### World & Coordinate Systems

The world by default is set to 20,000 units in each direction (10,000 pixels), with the centerpoint being [0,0] in cellspace. This is a tested value that maximizes size while limiting crashing upon startup. If you don't need this much room, I highly recommend lowering it even though it has minimal performance impacts as it makes AM more stable if there's less room size.

Precise, **real coordinates** are the raw unit values from the top left of the stage (rivals stage start at [0,0] being the top corner o the blastzones). This coordinate system is used by checkpoints, room transitions/teleports. Coordinates that needs to be precise but isn't placed into the world will generally use this type.

**Cell coordinates** break up the current room into cells, which are then subdivided into subcells of 16x16 pixels (32x32 units). The center cell is considered [0,0] and the coordinates radiate from the center. This is used by most things in the API such as article spawns.

As a reminder, Rivals pixels are 2 units long.

### Limitations

RoA Adventure Mode is built within the RoA Workshop framework in GML - it follows all of the conventions and restrictions that apply. This means everything is inside a single stage file, so there is limited use of user_events, attack scripts, and limited numbered articles. It also means there's one static stage collision setup, which is why we use articles.

RoA Adventure Mode is an API built on top of Rivals Workshop on top of Rivals. While the base game is very optimized, workshop is interpreted and as such has a lot of overhead. AM has overhead of its own, and since it spawns a lot of articles it can be relatively intense to run. In my playtesting, rivals can handle ~200 articles rendered before slowdown on a medium-specs computer. Draw calls outside of the viewport seem to add minimal lag, however draw calls that display are *very* heavy and should be avoided when possible.

Something to note is that the debug features are not optimized - you will get slightly worse performance with them on.

Anything we can't do in Workshop stage coding (file access/read/write, zoom, viewport changes, streaming assets, removing Sein, etc) is also not possible in AM.

#### Online Multiplayer Support?

Online Multiplayer is something that was initially scoped in but with further changes to the online system on its way it's something we can't officially support fully at this time. We've made efforts to make sure that our gameplay code is client-independent however this does not preclude desyncs due to loading and lag and multiplayer may be very unstable. Feel free to submit bugs about this feature, just no promises it'll be 100% working at any time :P

### Core Engine Changes

There are a few miscellaneous engine changes implemented to make this all possible and also to remove some tedium from running the stages. The big gameplay change is that if you hold the same direction off a ledge and onto ground below, you will go back into dash immediately. Collision detection changes for walljumps are added for precise collisions.

## Structure & Use Cases
### Common Use Cases
This API has tools for all sorts of applications, mainly medium to long form platforming stages. However it is definitely encouraged to add, remove, edit, or copy these tools into other stages and projects that require more/some/different functionality. Just remember to credit the AM team if you do!
 
## Lucid Dream Development Console

Outside of the actual operating structure is **Lucid Dream**, the development console & cursor system built in the Window API. It has a plethora of functions for creating, editing, and exporting articles. Open it with tilda (\`), type with the keyboard, enter is ?, backspace is \\. Currently, it defaults to strings for arguments but you can specify a few argument parameters to get the variable type needed.

**r:'varname'** will get the resource of that specific name (similar format to resource_get("varname")).

**d:'varname'** will force the string into a real number. WARNING - failiure to make varname into a real can crash the game! (This is a GameMaker 2 thing I can't fix it!)

**v:'varname'** will get the value of the variable of the given name in the main stage object.

Keep in mind you can **export** in-game adjustments using `export`. Double check the export and replace with the correct values/formatting if needed.

For a full list of commands, type the `help` command. If you need specific help with a function type `man <function name>`.

Articles can be selected with left mouse, and moved around with right mouse. Selected articles can be acted upon via certain console commands.

## Room Manager and Loading Structure (article5, user_event1)
The actual data for spawning articles in the right places is in *user_event1.gml*. This is run once on spawn to initialize all the data for the stage, and does get edited as the player plays the rooms and can effect them. Each Room is added via the following function:

    room_add(room_index, [room_data]);

**room_index** - the index value of the room, the identifier that is used to determine what articles to spawn.
**room_data** - the array which holds the data of all the articles in the room, organized by cell. It has this format:

    [ //Room X
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
    ]
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

**trigger_relative** - (bool) do the actions get performed on the stage main object, or on the entity that detected it? Defaults to false

**check_visibility** - (bool) does the box check to see that the entity is clearly visible (not depth behind any mask) before firing?

### Article5 - Room Manager
The Room Manager is instanced once on startup, and only one can exist (singleton). It persists for the full duration of the level, and generally can be acecssed globally with `room_manager`. It is responsible for executing all the code related to AM rooms.

### Article6 - Article NPC
Article NPCs function a lot like player objects, except with slightly less overhead and a few simplified rules. Please see the dedicated section for initializing Article NPCs for setting up each NPC id right in the file structure and `user_event6`

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

## Action Manager & Loading Structure (article3, user_event0)
*Actions* are events which can manipulate the room and the GUI while it is loaded and running. They are loaded from *user_event0* whenever a scene or room changes, and follow a specific format:

    action_add(room_id, scene_id, action_id, action_type,
    [act_args],
    [act_starts]);

**room_id** - the room the action belongs to. It will only run when the current room is this room

**scene_id** - the room's scene the action will run on. If this is 0, it will always run

**action_id** - the id for this action, used to be referenced to for starting other actions


There are a plethora of basic actions which perform all sorts of tasks which allow for the full creation of a level. If you need to extend functionality you can add your own actions inside article3. There are plenty of types of actions: instant, conditional, perpetual, etc to show how to work with the system internally.

### Default Action Types & Variables

## Player/Character Options

AM Features a few mostly lore options to make sure characters are properly addressed and to offer some customization to make stories make a bit more sense from a character's PoV.

AM Devs keep in mind how these are set, I highly recommend formatting dialog to utilize these features (can be called via the `follow_player` object, the local player). 

### Pronouns & Nicknames

You can customize which pronouns a character gets addressed as via the `pronouns` variable in the character's `init.gml` file. AM Devs can customize the default pronouns via `other_init.gml`. 

Nicknames are something the character goes by if people do not know their name - generally this is customized by the level (as we assume npcs do not know them and have their own ideas on what to call this new person), however a default value can be provided by a character in the case the level creator does not wish to make nicknames. Use `nick` in `other_init.gml` for this feature.

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

1. Bundle as many articles into one as you can. This means all animated sprites of the about the same speed should be all on one sheet. Keep all solid, static collision bundled as one article per cell and define the bounding box as precise in load.gml.
2. Break up rooms when appropriate, have smaller rooms instead of bundling many into one. If you have a small offshoot room make it it's own thing so that the room manager doesn't need to spawn everything else on room transfer.
3. Keep heavily in mind the number of active enemies. Enemies in particular are VERY heavy, I would suggest limiting it to 3-4 on-screen enemies. Off-screen enemies on the other hand don't have much to process and have about as much overhead as any article. 

## Miscellaneous Tips & Publishing Guidelines

The freedom to make anything a developer desires is a core philosophy of this tool. However, I hope to establish some guidelines in order to minimize confusion.

- Please clearly label a stage made with AM - with an [AM] tag in the title and "Adventure Mode" in the description somewhere (so that it can be searched for on the workshop!)
- Try to make situations which make some sense for a lot of characters. Keep in mind character-specific traits and create alternative options where it makes sense. Making a character-specific adventure is fine but keep in mind people will want to play the adventure with anyone on the workshop.
- On a similar note speaking FOR the player character is an odd choice that should probably be avoided due to how many personalities exist in the workshopverse.
- Comment your code thoroughly! This API certainly isn't immediately readable, clearly label the purpose of everything.
