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

Online Multiplayer is something that was initially scoped in but with further changes to the online system on its way it's something we can't officially support fully at this time. We've made efforts to make sure that our gameplay code is client-independent however this does not preclude desyncs due to loading and lag and multiplayer may be very unstable.

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

## Action Manager & Loading Structure (article3, user_event0)
*Actions* are events which can manipulate the room and the GUI while it is loaded and running. They are loaded from *user_event0* whenever a scene or room changes, and follow a specific format:

    action_add(room_id, scene_id, action_id, action_type,
    [act_args],
    [act_starts]);

**room_id** - the room the action belongs to. It will only run when the current room is this room.
**scene_id** - the room's scene the action will run on. If this is 0, it will always run.
**action_id** - the id for this action, used to be referenced to for starting other actions.

There are a plethora of basic actions which perform all sorts of tasks which allow for the full creation of a level. If you need to extend functionality you can add your own actions inside article3. There are plenty of types of actions: instant, conditional, perpetual, etc to show how to work with the system internally.

### Default Action Types & Variables
