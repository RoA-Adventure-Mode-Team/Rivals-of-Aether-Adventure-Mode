# RoA Adventure Mode Documentation

## Table of Contents

1. General Structure & Limitations
2. Built-In Article Types
3. Player/Character Options
4. Optimization Strategies, Writing Tips

## General Structure

Adventure Mode's data flow is set up as article-oriented. Everything besides the base stage script the API interacts with is an article or array of some kind - this is to allow maximum flexibility with moderately low performance costs.

RoAAM has five major systems that interact heavily to facilitate creation of long-form levels: The **Room**, the **Action**, the **Scene**, the **Article** and the **Window**.

A **Room** is a lot like a GameMaker room - it's a collection of articles/objects set to spawn and run while at a certain room index. It is managed by the Room Manager (article5) and should only be interacted with on the outside via the given actions/functions to ensure everything gets set up right between room transitions. The 0 index room is considered global, everything placed there will execute on every room. You can detail custom articles for the room in user_event1.

An **Action** is an event that happens of a given type, with it's own variables and exit actions (actions which start once the action ends). There are actions that do something and immediately exit, there are some that function like if statements that only exit on certain conditions, and some that track and persist until their subprocess is complete (window spawns). It is managed by the Action Manager (article3). You can detail actions for the room, scene, and action index in user_event0. Custom actions can be implemented in the Action Manager.

A **Scene** is like a world state. It dictates which set of actions are active when in a room, and it persists between rooms. The 0 index scene is considered the global scene, everything in the global scene will run no matter the scene index inside the room. It is managed by the Action Manager in article3.

An **Article** is exactly as it sounds - it's a stage article object! AM forces similar structures on all articles and has specific formats for spawning them into rooms properly. Otherwise it behaves exactly as stage articles do. This is the major performance limiter - for performance reasons it is best to bundle as many details into the same article. So all static solid collision for each cell should be in the same article, as well as all background/foreground details on a certain layer.

A **Window** is a collection of GUI elements per the Window API (user_event2). You can define custom windows at the top using GUI elements, and you can define custom game frame and draw frame logic inside the respective functions. Windows and GUI Components have custom logic code as well as draw code that draws relative to the screen position.

### Lucid Dream Development Console

Outside of the actual operating structure is **Lucid Dream**, the development console built in the Window API. It has a plethora of functions for creating, editing, and exporting articles. Open it with tilda (`), type with the keyboard, enter is ?, backspace is \\. Currently, it defaults to strings for arguments but you can specify a few argument parameters to get the variable type needed. **r:'varname'** will get the resource of that specific name (similar format to sprite_get("varname")).

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

## Player/Character Options

AM Features a few mostly lore options to make sure characters are properly addressed and to offer some customization to make stories make a bit more sense from a character's PoV.

AM Devs keep in mind how these are set, I highly recommend formatting dialog to utilize these features (can be called via the `follow_player` object, the local player). 

### Pronouns & Nicknames

You can customize which pronouns a character gets addressed as via the `pronouns` variable in the character's `init.gml` file. AM Devs can customize the default pronouns via `other_init.gml`. 

Nicknames are something the character goes by if people do not know their name - generally this is customized by the level (as we assume people do not know them, and the npcs have their own ideas on what to call this new person), however a default value can be provided by a character in the case the level creator does not wish to make nicknames.

### Character Attributes

There are a few character attributes that can be used to effect options, either to change things that don't make sense (calling a small character 'big guy' or the inverse), or to provide a more accurate option (an evil character probably won't do charity hero work but they may take pay). Here is a list of the default provided, feel free to add your own to your levels and character creators feel free to set them as you please. Most of these if not defined are assumed false except for a few cases where true is the most likely answer. (See `other_init.gml` for the list of default assignments)

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

Feel free to reach out and suggest additional options!

## Optimization Strategies

The RoAAM team will continue to do their best optimizing the engine over time, however as stated in Limitations there is a lot of overhead to account for, and the mod will not run well on lower end computers. Here are a list of optimization strategies figured out during the development of Hallowflame to help lift the computational burden.

1. Bundle as many articles into one as you can. This means all animated sprites of the about the same speed should be all on one sheet. Keep all solid, static collision bundled as one article per cell and define the bounding box as precise in load.gml.
2. Break up rooms when appropriate, have smaller rooms instead of bundling many into one. If you have a small offshoot room make it it's own thing so that the room manager doesn't need to spawn everything else on room transfer.
3. Keep heavily in mind the number of active enemies. Enemies in particular are VERY heavy, I would suggest limiting it to 3-4 active enemies. Inactive enemies on the other hand don't have much to process and have about as much overhead as any article. 

#### Miscellaneous Tips

The freedom to make anything a developer desires is a core philosophy of this tool. However, I hope to establish some guidelines in order to minimize confusion.

- Please clearly label a stage made with AM - with an [AM] tag in the title and "Adventure Mode" in the description somewhere (so that it can be searched for on the workshop!)
- Try to make situations which make some sense for a lot of characters. Keep in mind character-specific traits and create alternative options where it makes sense. Making a character-specific adventure is fine but keep in mind people will want to play the adventure with any.
- On a similar note speaking FOR the player character is an odd choice that should probably be avoided due to how many personalities exist in the workshopverse.
- Comment your code thoroughly! This API certainly isn't immediately readable.