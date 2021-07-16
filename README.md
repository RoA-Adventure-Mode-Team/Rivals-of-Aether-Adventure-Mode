# Rivals of Aether Adventure Mode Documentation
## Introduction
**Rivals of Aether Adventure Mode** is a fan-made API designed to extend RoA Workshop stages into fully-functional levels akin to *SSB Melee's Adventure Mode* and *SSB Brawl's Subspace*. 
It has been written to be read in order, so if you are just starting out I recommend you read through this guide once. It is organized by reference, so feel free to skip around to what you want to read up on using Ctrl-F.
It is a very heavy API built on top of a quirky engine, it has its fair share of performance issues if not set up optimally. I highly suggest reading the optimization section as it can easily dip below 60 fps if not careful and/or the player's machine isn't relatively powerful. **Adventure Mode: Hallowflame**, the example level released with the API, should serve as a good example of the detailed principles on how to organize and code each aspect to best avoid these issues.

## Table of Contents

 1. General Structure & Use Cases
	 * Common Use Cases
	 * General Structure
		 * Room Manager/Renderer
 2. Article Template Overview
	* 
 3. Recommended Optimizations & Workflow

## Structure & Use Cases
### Common Use Cases
This API has tools for all sorts of applications, mainly medium to long form platforming stages. However it is definitely encouraged to add, remove, edit, or copy these tools into other stages and projects that require more/some/different functionality. Just remember to credit the AM team if you do!

### General Structure
The RoAAM is split into a few different core components which work in tandem. The general categories are:

 1. Room Manager/Renderer
 2. GUI API
 3. Action Manager
 4. Article Enemies
 5. Events and Misc
 
#### Room Manager/Renderer (article5, user_event1)

The Room Manager itself is an instance of article5 that is spawned at the start of a stage. It performs all functions related to spawning articles in the right place. There are two major restrictions to keep in mind for this API:
1 - We cannot edit stage tile data easily, and it cannot be edited during run. This means we need to rely on articles to provide the collisions we need.
2- The stage editor has a very limited editing size. This means that we must work outside of the tools given to place articles where they need to be.
These two major restrictions lead to the development of the *Room Cell System* and the *Lucid Dream Console* to aid in the creation of levels.

#### Room Cell System(article5)
A *Room* is much like GML rooms - it's a collection of articles that gets loaded when a player enters it. One room is loaded at a time, and they can quickly be hotswapped via *room transitions*. The default expanded stage room is about ~20,000 units in each direction (one unit is half a pixel). To make this easier to work with, each Room has been split into *Subcells* of 16x16 units, and *Cells* of  163x85 Subcells by default with 0,0 being the center of the room. Room data is in this format for ease of reading and to make batching of articles much easier.

##### Room Loading Structure (user_event1)
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
**custom_args** - any extra custom arguments that you would like to make. (See *Article Template Overview* for extra) should persist between room loads.

##### Room Level States: Scenes
Levels, articles, and actions have another index called a *scene* - it is read and used to check what is enabled or disabled based on what scene the level is in. All objects with scene 0 are loaded and run no matter the scene - otherwise, they only run when their scene matches up with the current level scene. This can be done mainly to make sure certain articles are available only at certain points in the same room. This will make more sense once actions and each article are explained.

#### Action Manager(article3, user_event0)
*Actions* are events which can manipulate the room and the GUI while it is loaded and running. They are loaded from *user_event0* whenever a scene or room changes, and follow a specific format:

    action_add(room_id, scene_id, action_id, action_type,
    [act_args],
    [act_starts]);

**room_id** - the room the action belongs to. It will only run when the current room is this room.
**scene_id** - the room's scene the action will run on. If this is 0, it will always run.
**action_id** - the id for this action, used to be referenced to for starting other actions.
