// Load Room Data - Room Manager


enum A {
    NONE,
    TERRAIN,
    EMPTY,
    SM,
    TRIGGER,
    RM,
    ENEMY,
    CAM,
    RMT,
    CHECKPOINT,
    ITEM,
    DITHER,
    LIGHT,
    SHADOW,
    PARTICLE_EMITTER,
    DESTUCTABLE,
    LOCAL_SOUND,
    
}
//TESTING NOTES
//Need Work Rooms: 11
//11 Mage Place (Animate the fire there!)
//7,8,9 Water Hitboxes, enemy placements
// Misc Improvements: 
//1 Outskirts (Draw Kei struggling with an enemy, rock platform on the right?)
//2 Town (Guard dialogbox shifts weirdly, remove last cambox, make guards move faster)
//3 (Ryken slamming his desk, Kei moving after a scene) 
//5 (Supplier finish dialog - also not let him get hit :()
//9 Sewer3 - Extra Note, Potion/Poison
//16 SewerExtra - Extra Note
//Add Room Data Here
room_add(0,[]); //Empty Room
//room_data_temp = [article script, x, y, article type, depth, [args0-7], [custom]];
room_add(1, [ //Outside Left
    [ //Each Cell - has [cell coordinates, cell data]
        [-4,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("1[-4,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            
            //Light/Shade
            [12, 0, 0, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [-3,0], //Cell Coordinates
        [
            //Debug Articles
            
            //Note Test
            // [4, 40, 40, 0, -6, [2, 0, 0, 0, sprite_get("area_title"), 32, 64, [0,1,0,0]], [0,0]],
            
            //Ryken Test Spawn
            // [6, 140, 36, 0, -5, [100, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Guard Test Spawn
            // [6, 140, 36, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Room Transition To Meadows
            // [8, 40, 34, 0, 0, [0, 0, 64, 64,5, [2,9847,10544], 1, 0, 0], [0,0]],
            
            //Room Transition To Sewer
            // [8, 40, 34, 0, 0, [0, 0, 64, 64, 7, [2,15534,10477], 1, 0, 0], [0,0]],
            
            //Room Transition To Sewer Burg
            // [8,40, 34,0,0,[0,0,96,96,15,[2,11370,10416],1,0,0,],[0,0]],
            
            //Room Transition To Sewer2
            // [8, 40, 34, 0, 0, [0, 0, 64, 64, 8, [2,8166,9164], 1, 0, 0], [0,0]],
            
            //Room Transition To Sewer3
            // [8, 40, 34, 0, 0, [0, 0, 64, 64, 9, [2,14147,10772], 1, 0, 0], [0,0]],
            
            //Room Transition To Staging
            // [8, 40, 34, 0, 0, [0, 0, 96, 96, 10, [2,8254,10598], 1, 0, 0], [0,0]],
            
            //RT to Boss Room
            // [8, 40, 34, 0, 0, [0, 0, 96, 96, 17, [2,10191,10326], 1, 0, 0], [0,0]],
            
            //RT to Sewer Entrance
            // [8, 40, 34, 0, 0, [0, 0, 64, 96, 13, [2,10083,10575], 1, 0, 0], [0,0]],
            
            //Room Transition To Temple Basement
            // [8, 40, 34, 0, 0, [0, 0, 64, 64, 4, [2,10135,10275], 1, 0, 0], [0,0]],
            
            //Room Transition to Hallowflame
            // [8, 40, 40, 0, 0, [0, 0, 64, 64, 2, [2,9774,10547], 1, 0, 0], [0,0]],
            
            //Room Transition to Hallowflame:Temple
            // [8, 40, 40, 0, 0, [0, 0, 64, 64, 2, [2,9774,10547], 1, 0, 0], [0,0]],
            
            //Room Transition to Hunter
            // [8, 40, 40, 0, 0, [0, 0, 64, 64, 14, [2,11302,10361], 1, 0, 0], [0,0]],
            
            //RT to Credits
            // [8, 40, 40, 0, 0, [0, 0, 64, 64, 20, [3,200,200], 1, 0, 0], [0,0]],
            
            //Debug Articles
            
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("1[-3,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("1[-3,0]fg"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("1[-3,0]bg"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            
            //Only 1 Background init per Room
            [1, 0, 0, 0, 30, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 29, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            
            //Player Shadow
            [13, 0, 0, 0, -7, [0, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            [13, 0, 0, 0, -15, [1, make_color_rgb(24, 32, 64), 0, 0, 0, 0, 0, 0], [0,0]],
            
            
            // //Room Transition To Temple Inside
            // [8, 20, 40, 0, 0, [0, 0, 156, 156, 3, [2,9851,10185], 1, 0, 0], [0,0]],
            
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [-3,-1], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("1[-3,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [-4,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("1[-4,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [-2,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("g_ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("1[-2,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("1[-2,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Platforms (exported from Lucid Dream)
            [1,57,35.25,1,1,[sprite_get("short_fc_plat"),0,0,0,0,0,0,0,],[0,0]],
            
            //Platforms (exported from Lucid Dream)
            [1,106,35.25,1,1,[sprite_get("short_fc_plat"),0,0,0,0,0,0,0,],[0,0]],
            [1,75,38,1,1,[sprite_get("fc_box_plat"),0,0,0,0,0,0,0,],[0,0]],
            
            //Kei Spawn, Outside Left
            // [6, 86, 43, 0, -5, [7, 0, 0, [{x: 7358, y: 10545}, {x: 9666, y: 10545}], 0, 0, 0, 0], [0,11]],
            
            //Dialog/Cutscene Start - Kei Rescue
            [4, 33, 16, 0, 0, [10, 1, 0, -1, 0, 32, 600, []], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [-1,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("g_ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("1[-1,0]fg"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("1[-1,0]bg"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            
            //Dialog Start - Kei Extra Details
            [4, 11, 16, 0, 0, [23, 1, 0, -1, 0, 32, 600, []], [0,0]],
            
            //Room Transition to Hallowflame
            // [8, 20, 40, 0, 0, [0, 0, 64, 64, 2, [2,7328,10551], 1, 0, 0], [0,0]],
            [8,155,39.88,0,0,[0,0,64,64,2,[2,7328,10551],0,0,0,],[0,0]], // Exported from Lucid Dream
            
            ]
        ],
        
    [ //Each Cell - has [cell coordinates, cell data]
        [0,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("1[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            ]
        ],
        
    
    
    ]);

room_add(2, [ //Town
    [ //Each Cell - has [cell position, cell data]
        [-2,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("2[-2,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]], //REEXPORT THESE GROUND THINGS - THEY DON'T LINE UP
            
            //Only 1 Background init per Room
            [1, 0, 0, 0, 30, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 29, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            
            // //Player Shadow - Init Once
            // [13, 0, 0, 0, -6, [0, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            // [13, 0, 0, 0, -15, [1, make_color_rgb(24, 32, 64), 0, 0, 0, 0, 0, 0], [0,0]],
            
            //Light/Shade - Needed a light for color change
            [12, 0, 0, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //End Quest - To Town
            // [4,157.88,31.75,0,0,[2,1,0,-1,0,300,200,0,],[0,0]], // Exported from Lucid Dream
            //PopupDialog
            // [4,157.88,31.75,0,0,[2,0,0,120,0,200,332,[0,1,1]],[0,0]],
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [-1,0], //Cell Coordinates
        [
            //Debug Articles
            
            //Room Transition To Other Side of Town
            // [8, 9, 37, 0, 0, [0, 0, 156, 156, 2, [2,12248,10185], 1, 0, 0], [0,0]],
            
            //Debug Articles
            
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("2[-1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("2[-1,0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("2[-1,0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            // [1,55.13,32.25,0,-20,[sprite_get("mark"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Platforms
            //Perfect House
            [1,49,36,1,9,[sprite_get("m_p_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,50.50,29.375,1,9,[sprite_get("m_p_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,68,28,1,9,[sprite_get("m_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,68,36,1,9,[sprite_get("m_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,80.88,35.13,1,9,[sprite_get("m_plat7"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,81.38,22.25,1,9,[sprite_get("m_plat6"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,98,33.25,1,9,[sprite_get("m_plat4"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,130.38,44,0,9,[sprite_get("bench"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,120.13,36.75,0,-1,[sprite_get("fountain1"),8,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,135.50,20,1,9,[sprite_get("t_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,24,31.88,1,9,[sprite_get("shrine_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,3,36,1,9,[sprite_get("m_plat5"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            
            //Guard Spawns
            // [6, 140, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            [6, 110, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,4]],
            // [6, 70, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            [6, 20, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,4]],
            
            //End Quest - To Town
            // [4, 20, 38, 0, 0, [2, 1, 0, -1, 0, 300, 200, 0], [0,0]], //See [-2,0]
            
            
            //Room Transition To Shrine Inside
            [8,31,36.38,0,0,[0,0,64,120,6, [2,9840,10030],1,0,0,],[0,0]], // Exported from Lucid Dream
            // [8, 30, 38, 0, 0, [0, 0, 64, 120, 6, [2,9794,9975], 1, 0, 0], [0,0]],
            
            //Room Transition To House Inside
            [8,54.13,36.38,0,0,[5,0,64,120,12, [2,9800,10067], 1,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Room Transition To Temple Inside
            [8, 154, 34, 0, 0, [0, 0, 156, 156, 3, [2,9851,10185], 1, 0, 0], [0,0]],
            
            
            //Camera Centering
            [7,135,9,0,0,[0,764,600,0,0,0,0,0,],[0,3]], // Exported from Lucid Dream
            
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [0,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("2[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("2[0,0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("2[0,0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Room Transition To Mage House
            [8, 95, 29, 0, 0, [4, 0, 64, 80, 11, [2, 9830,10074], 1, 0, 0], [0,0]],
            
            //Room Transition To Outside Right
            [8, 156, 37, 0, 0, [0, 0, 64, 120, 5, [2,9847,10544], 0, 0, 0], [0,0]],
            
            [1,95.13,24,1,9,[sprite_get("m_f_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,92.13,24.88,1,9,[sprite_get("m_f_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,87.75,34,1,9,[sprite_get("raised_steps_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,116.88,18,1,9,[sprite_get("m_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,116.88,10,1,9,[sprite_get("m_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,31.88,34,1,9,[sprite_get("m_long_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,35.88,26,1,9,[sprite_get("m_long_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            // //Camera Centering - DEBUG
            // [7,26,28,0,0,[0,1528,247,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Guard Spawns
            // [6, 140, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            [6, 110, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,4]],
            [6, 70, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,4]],
            // [6, 30, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Room Transition To Sewer Entrance
            [8, 139.63,36.50, 0, 0, [0, 0, 64, 96, 13, [2,10200,10547], 1, 0, 2], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [1,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("2[1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            ]
        ],
        
    
    
    ]);

room_add(3, [ //Temple Inside
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 2, [sprite_get("3[F0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 2, [sprite_get("3[F0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("3[F0]bffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("3[F0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            [1,0,6.25,1,9,[sprite_get("l_wood_plat1"),0,0,0,0,0,0,0],[0,0]], // Exported from Lucid Dream
            
            [1,19,6.25,0,1,[sprite_get("RykenAM_Sit"),10,0,0,0,0,0,0,],[0,5]], // Exported from Lucid Dream
            
            //Light/Shade - Needed a light for color change
            [12, 0, 0, 0, -20, [asset_get("empty_sprite"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Camera Centering
            [7, 0, 0, 0, 0, [0, 640, 358, 0, 0, 0, 0, 0], [0,0]],
            
            //Room Transition To Town
            [8, 0, 14, 0, 0, [0, 0, 16, 110, 2, [2,9774,10547], 0, 0, 0], [0,0]],
            
            //Kei Spawn, Temple
            [6,9.38,22.19,0,-5,[7,0,0,0,0,0,0,0,],[0,5]], // Exported from Lucid Dream
            
            //Room Transition To Temple Basement
            [8,33.25,15.38,0,0,[6,0,120,110,4, [2,10200,10250], 1,0,0,],[0,0]], // Exported from Lucid Dream
            ]
        ],
    ]);

room_add(4, [ //Temple Basement
    [ //Each Cell - has [cell position, cell data]
        [-1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("4[-1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("4[-1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("4[-1,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            [12, 0, 0, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Platforms
            [1,119.38,39.38,1,9,[sprite_get("it_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,135.88,39.50,1,9,[sprite_get("it_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,152.75,39.38,1,9,[sprite_get("it_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,158.50,27.38,1,9,[sprite_get("it_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,10.88,23.38,1,9,[sprite_get("it_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,82.25,27.88,1,9,[sprite_get("it_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,106.75,31.75,1,9,[sprite_get("it_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,133,27.63,1,9,[sprite_get("it_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,97.75,39.38,1,9,[sprite_get("it_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,63.13,39.38,1,9,[sprite_get("it_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,59.50,39.38,1,9,[sprite_get("it_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Night Guards
            [6, 100, 38, 0, 0, [10, 0, 0, [], 0, 0, 0, 0], [0,0]],

            //Note Key
            [4,16.75,19.38,0,-6,[5,0,0,-1,0,64,64,[0,1,0,0]],[0,0]], // Exported from Lucid Dream
            
            //Note Exp5
            [4,40.88,35.25,0,-6,[4,0,0,0,0,64,64,[0,1,0,0]],[0,0]], // Exported from Lucid Dream
            
            //Key - See event for spawning
            // [10,17,22,0,-6,[2,sprite_get("item_2"),1000,1,0,"Aqueduct Key",0,0],[0,0]]
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("4[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("4[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("4[0,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            
            //Night Guard Test Spawn
            [6, 0, 38, 0, 0, [10, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Room Transfer to Temple Inside
            [8, 25, 21, 0, 0, [0, 0, 80, 300, 3, [2,10357,10198], 1, 0, 0], [0,0]],
            
            //Platforms
            [1,18.63,39.38,1,9,[sprite_get("it_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,29,33.38,1,8,[sprite_get("fc_box_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,18.63,39.38,1,9,[sprite_get("it_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            ]
        ],
    ]);

room_add(5, [ //Outside Right - Meadows
    [ //Each Cell - has [cell position, cell data]
        [-1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("5[-1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            
            //Light/Shade - for shading to be applied
            [12, 60.38-0.25,44.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [-1,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("5[-1,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Only 1 Background init per Room
            [1, 0, 0, 0, 30, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 29, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            
            // //Player Shadow - Init Once
            // [13, 0, 0, 0, -6, [0, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            // [13, 0, 0, 0, -15, [1, make_color_rgb(24, 32, 64), 0, 0, 0, 0, 0, 0], [0,0]],
            
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("5[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("5[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("5[0,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            [1,21.88,35,1,9,[sprite_get("arch_plat1"),0,0,0,0,0,0,0],[0,0]], // Exported from Lucid Dream
            
            //Plats
            [1,38.75,31.88,1,9,[sprite_get("column_plat1"),0,0,0,0,0,0,0],[0,0]], // Exported from Lucid Dream
            [1,83.38,38.88,1,9,[sprite_get("rock_plat2"),0,0,0,0,0,0,0],[0,0]], // Exported from Lucid Dream
            [1,99.38,39.75,1,9,[sprite_get("rock_plat3"),0,0,0,0,0,0,0],[0,0]], // Exported from Lucid Dream
            [1,104.38,32.13,1,9,[sprite_get("rock_plat1"),0,0,0,0,0,0,0],[0,0]], // Exported from Lucid Dream
            // [1,147.13,33.88,1,9,[sprite_get("rock_plat5"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,109.88,37.75,1,9,[sprite_get("rock_plat7"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Room Transition To Town
            [8, 0, 37, 0, 0, [0, 0, 32, 110, 2, [2,12200,10549], 0, 0, 0], [0,0]],
            
            //Enemy Spawns
            //Brawler
            [6, 87, 38, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Fleye
            [6, 102, 23, 0, -5, [2, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //LsBird
            // [6, 127, 42, 0, -5, [4, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            // //Items - Crates
            [10, 110.50, 30.63, 0, 0, [1, sprite_get("small_crate"), 32, 0.3, 0, "Food Crate", 0, 0], [0,0]],
            // [10, 116, 42.50, 0, 0, [1, sprite_get("small_crate"), 32, 0.3, 0, "Food Crate", 0, 0], [0,0]],
            // [10, 42.75,39.88, 0, 0, [1, sprite_get("small_crate"), 32, 0.3, 0, "Food Crate", 0, 0], [0,0]],
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("5[1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("5[1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("5[1,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Plats
            [1,102.25,31.88,1,9,[sprite_get("column_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Supplier Spawn
            [6,22.25,43.94,0,0,[9,0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            // //Brawler
            // [6, 62, 43, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            // //LsBird
            // [6, 80, 43, 0, -5, [4, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            // //Brawler
            // [6, 126, 37, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            // //Fleye
            // [6, 148, 23, 0, -5, [2, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Rocko
            [6, 110, 0, 0, -5, [3, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Take Crate From Player
            [4, 14, 37, 0, 0, [4, 0, oPlayer, 30, 0, 200, 144, [1,0,0,0]], [0,0]],
            
            //Items - Crates
            [10, 116, 42.50, 0, 0, [1, sprite_get("small_crate"), 32, 0.3, 0, "Food Crate", 0, 0], [0,0]],
            [10, 42.75,39.88, 0, 0, [1, sprite_get("small_crate"), 32, 0.3, 0, "Food Crate", 0, 0], [0,0]],
            
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]    
        [2,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("5[2,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]    
        [2,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("5[2,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            ]
        ],
    ]);

room_add(6, [ //Shrine Inside
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("6[F0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 2, [sprite_get("6[F0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("6[F0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            [1, 0, 0, 0, 1, [sprite_get("6[F0]webs"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            [1,7.38,6.13,0,0,[sprite_get("candle"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            // [1, 0, 0, 0, 1, [sprite_get("6[F0]sign"), 0, 0, 0, false, 0, 0, 0], [0,1]],
            
            //Camera Centering
            [7, 0, 0, 0, 0, [0, 260, 180, 0, 0, 0, 0, 0], [0,0]],
            
            //Room Transition To Town
            [8, 0, 6, 0, 0, [0, 0, 32, 72, 2, [2,7765,10529], 0, 0, 0], [0,0]],
            
            //Destruct
            [15, 6.75,9, 0, -1, [sprite_get("wood_plack"), 0, 0, sound_get("sfx_fade"), 0, 5, 0, 0.5], [0,0]],
            
            //Note Wood
            [4, 6, 7, 0, -6, [6, 0, 0, 1, 0, 64, 64, [0,1,0,0]], [0,2]],
            
            //Note Marble
            [4, 6, 7, 0, -6, [7, 0, 0, 1, 0, 64, 64, [0,1,0,0]], [0,0]],
            ]
        ],
    ]);
    

room_add(7, [ //Sewer1
    [ //Each Cell - has [cell position, cell data]
        [0,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("7[0,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 2, [sprite_get("7[0,-1]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("7[0,-1]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Water Hitbox
            [4,0,0,0,0,[7,0,0,2,sprite_get("sewer1_water_hitbox"),0,0,[0,0,2,0]],[0,0]],
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("7[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 2, [sprite_get("7[0,0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("7[0,0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Platforms
            [1,136.13,14.25,1,9,[sprite_get("sewer_wood_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,126.63,25.88,1,9,[sprite_get("sewer_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,146.13,29.50,1,9,[sprite_get("sewer_plat4"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Torches
            [1,60.38,44.38,0,1,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,76,47.25,0,1,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,108.88,47.13,0,1,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,132.88,34.25,0,1,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,144,21.25,0,1,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Light/Shade
            [12, 60.38-0.25,44.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 76-0.25,47.25+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 108.88-0.25,47.13+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 132.88-0.25,34.25+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 144-0.25,21.25+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 122,54, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            
            // [12, 0, 0, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("7[1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 2, [sprite_get("7[1,0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("7[1,0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //To Side Room15
            [8,90,0,0,0,[0,0,96,96,15,[2,10149,10457],1,0,0,],[0,0]], // Exported from Lucid Dream
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [1,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("7[1,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 2, [sprite_get("7[1,-1]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("7[1,-1]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Platforms
            [1,58.63,84.38,1,9,[sprite_get("sewer_wood_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,46,82.13,1,9,[sprite_get("sewer_small_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,27.75,84.38,1,9,[sprite_get("sewer_wood_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,101.13,51.25,1,9,[sprite_get("sewer_wood_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,91.63,62.75,1,9,[sprite_get("sewer_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,97.13,75.88,1,9,[sprite_get("sewer_wood_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,146.63,46.38,1,9,[sprite_get("sewer_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Torches
            [1,29.25,75.38,0,1,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,68.63,75.38,0,1,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,98,56.13,0,1,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,119,42.38,0,1,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,147.50,40.25,0,1,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 29.25-0.25,75.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 68.63-0.25,75.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 98-0.25,56.13+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 119-0.25,42.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 147.50-0.25,40.25+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Triplat Section Init
            [4,11,70,0,0,[10,0,0,-1,0,200,332,[]],[0,0]],
            
            //To Side Room15
            [8,26.8,34.8,0,0,[0,0,96,96,15,[2,11370,10416],1,0,0,],[0,0]], // Exported from Lucid Dream
            
            ]
        ],
    // [ //Each Cell - has [cell position, cell data]
    //     [1,-2], //Cell Coordinates
    //     [
    //         //Static Sprites
    //         [1, 0, 0, 2, 1, [sprite_get("7[1,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
    //         [1,0,77,0,2,[sprite_get("7[1,-1]bfluff"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
    //         [1, 0, 0, 0, -8, [sprite_get("7[1,-1]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
    //         ]
    //     ],
    [ //Each Cell - has [cell position, cell data]
        [2,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("7[2,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 2, [sprite_get("7[2,-1]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("7[2,-1]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Torches
            [1,67,54.25,0,1,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [12, 67.50-0.25,54.25+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Fleye
            // [6, 148, 23, 0, -5, [2, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Brawler
            [6, 148, 23, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [2,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("7[2,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 2, [sprite_get("7[2,0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("7[2,0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            
            //Room Transition To Sewer2
            [8, 39, 33, 0, 0, [0, 0, 96, 128, 8, [2,8166,9164], 1, 0, 0], [0,0]],
            
            ]
        ],
    ]);

room_add(8, [ //Sewer2
    [ //Each Cell - has [cell position, cell data]
        [1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("8[1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("8[1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[1,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            
            //Torches
            [1,10,3.63,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 10-0.25    ,3.63+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Room Transition To Sewer3
            [8, 3, 7, 0, 0, [0, 0, 96, 128, 9, [2,14147,10772], 1, 0, 0], [0,0]],
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("8[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("8[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[0,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Plats
            [1,18.88,0,1,9,[sprite_get("sewer_plat4"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Torches
            [1,65.63,4.13,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 65.63-0.25    ,4.13+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [-1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("8[-1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("8[-1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[-1,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Torches
            [1,147.25,1.13,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,107,7.50,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [12, 147.25-0.25,1.13+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 107-0.25 ,7.50+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //LsBird
            [6, 135, 12, 0, -5, [4, 0, 0, [], 0, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [1,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("8[1,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("8[1,-1]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[1,-1]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Torches
            [1,118.88   ,41.88,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,74       ,44.13,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [12, 118.88-0.25    ,41.88+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 74    -0.25    ,44.13+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [0,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("8[0,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("8[0,-1]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[0,-1]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
             //Plats
            [1,14.13,37.75,1,9,[sprite_get("sewer_wood_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,54.13,80,1,9,[sprite_get("sewer_wood_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,70.13,66,1,9,[sprite_get("sewer_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,152,72.75,1,0,[sprite_get("sewer_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Torches
            [1,145.63   ,64.38,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,74       ,62.38,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,27.25    ,74.38,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,12.50    ,43.38,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,30       ,56.88,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights 
            
            [12, 145.63-0.25,64.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 74-0.25    ,62.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 27.25-0.25 ,74.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 12.50-0.25 ,43.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 30-0.25    ,56.88+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 53-0.25    ,75.88+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 7-0.25    ,61.75+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            
            //Brawler
            [6, 17, 37, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Fleye
            [6, 33, 79, 0, -5, [2, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Brawler
            [6, 148, 23, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [-1,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("8[-1,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("8[-1,-1]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[-1,-1]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Plats
            [1,76,37.63,1,9,[sprite_get("sewer_wood_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,52.63,42.38,1,9,[sprite_get("sewer_plat4"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Torches
            [1,82.88 ,43.88,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,119.50,40   ,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 82.88 -0.25     ,43.88+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 119.50-0.25     ,40   +1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Room Transition To Sewer1
            [8, 55, 36, 0, 0, [0, 0, 96, 96, 7, [2,15534,10477], 1, 0, 0], [0,0]],
            
            //Water Hitbox
            [4,0,0,0,0,[7,0,0,2,sprite_get("sewer2_water_hitbox"),0,0,[0,0,2,0]],[0,0]],
            ]
        ],
    ]);

room_add(9, [ //Sewer3
    [ //Each Cell - has [cell position, cell data]
        [1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[1,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Room Transition To Sewer2
            [8, 111, 51, 0, 0, [0, 0, 96, 96, 8, [2,12420,10055], 1, 0, 0], [0,0]],
            
            //Pipe Go Up - Hitbox
            [4,73.13,53.88,0,-6,[2,0,0,1,0,64,32,[0,0,1,0]],[0,0]], // Exported from Lucid Dream
            [4,114.13,6.25,0,-6,[2,0,0,1,0,64,32,[0,0,1,0]],[0,0]], // Exported from Lucid Dream
            
            //Torches
            [1,76.75,9.25 ,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,88   ,38.13,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,75.13,45.63,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,119  ,41.63,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 76.75 -0.25     ,9.25 +1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 88    -0.25     ,38.13+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 75.13 -0.25     ,45.63+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 119   -0.25     ,41.63+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Platforms
            [1,69,15.88,1,9,[sprite_get("sewer_wood_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Brawler
            [6, 148, 23, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //LsBird
            [6, 100, 10, 0, -5, [4, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[0,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Platforms
            [1,120.88,1.88,1,9,[sprite_get("sewer_wood_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,55.13,2.50,1,9,[sprite_get("sewer_wood_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,13.75,6.75,1,9,[sprite_get("sewer_wood_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Torches
            [1,76.88,8.63,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,34   ,11  ,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 76.88 -0.25     ,8.63+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 34    -0.25     ,11  +1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Brawler
            [6, 51, 15, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            [6, 61, 0, 0, -5, [4, 0, 0, [], 0, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [-1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[-1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[-1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[-1,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Torches
            [1,147.50,1,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 147.50 -0.25     ,1+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Room Transition To Hunter Room? -> Boss area
            [8, 144, 10, 0, 0, [0, 0, 96, 96, 14, [2,11302,10361], 1, 0, 0], [0,0]],
            
            // //Room Transition To Staging
            // [8, 144, 10, 0, 0, [0, 0, 96, 96, 10, [2,8254,10598], 1, 0, 0], [0,0]],
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [1,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[1,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[1,-1]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[1,-1]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Torches
            [1,13.25 ,69.50,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,74    ,62.63,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,99.50 ,57.13,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,106.50,80.25,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 13.25 -0.25     ,69.50+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 74    -0.25     ,62.63+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 99.50 -0.25     ,57.13+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 106.50-0.25     ,80.25+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 51-0.25         ,70+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Platforms
            [1,108.88,58.75,1,9,[sprite_get("sewer_wood_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,117.88,58.75,1,9,[sprite_get("sewer_wood_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Fleye
            [6, 104, 54, 0, -5, [2, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [0,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[0,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[0,-1]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[0,-1]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Pipe Go Up - Hitbox
            [4,133,70.75,0,-6,[2,0,0,1,0,64,32,[0,0,1,0]],[0,0]], // Exported from Lucid Dream
            
            //Torches
            [1,117.25,74.38,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,17.38 ,55   ,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,60    ,43.88,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,118.63,41.75,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,145.63,64.38,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 117.25-0.25     ,74.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 17.38 -0.25     ,55   +1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 60    -0.25     ,43.88+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 118.63-0.25     ,41.75+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 145.63-0.25     ,64.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //To Side Room16
            [8,4.88,55.38,0,0,[0,0,96,96,16,[2,10149,10457],1,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Platforms
            [1,150.25,63,1,9,[sprite_get("sewer_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Potion item
            [10,72.38,58.88,0,0,[5,sprite_get("potion_item"),25,0.5,0,"Elixir",0,0,],[0,0]], // Exported from Lucid Dream
            
            //Brawler
            [6, 148, 23, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Note Monster
            [4,40.4,49,0,-6,[3,0,0,0,0,64,64,[0,1,0,0]],[0,0]], // Exported from Lucid Dream
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [-1,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[-1,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[-1,-1]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[-1,-1]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Water Hitbox
            [4,0,0,0,0,[7,0,0,2,sprite_get("sewer3_water_hitbox"),0,0,[0,0,2,0]],[0,0]],
            
            ]
        ],
    ]);

room_add(10, [ //Final Staging
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("10[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("10[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Note Worry
            [4, 115, 30, 0, -6, [2, 0, 0, 1, 0, 32, 64, [0,1,0,0]], [0,0]],
            
            
            
            // //Room Transition To Hunter Room? -> Boss area
            // [8, 0, 9, 0, 0, [0, 0, 32, 72, 14, [2,13365,10599], 1, 0, 0], [0,0]],
            
            //To Boss Room!
            // [8,4.88,55.38,0,0,[0,0,96,96,17,[2,10191,10326],1,0,0,],[0,0]], // Exported from Lucid Dream
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [-1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("10[-1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("10[-1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Room Transition To Sewer3
            [8, 55, 41, 0, 0, [0, 0, 96, 96, 9, [2,9589,10109], 1, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("10[1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("10[1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //To Boss Room!
            [8,62.75,41,0,0,[0,0,96,96,17,[2,10191,10326],1,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Light for shading to occur
            [12, 146, 50, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            ]
        ],
    ]);
    
room_add(11, [ //Mage House
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("11[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("11[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Mage
            [6,17,14,0,-5,[11,0,0,0,0,0,0,0,],[0,14]],
            
            //Camera Centering
            [7,2.88,1.38,0,0,[0,367,207,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Room Transition To Town
            [8, 0, 9, 0, 0, [0, 0, 32, 72, 2, [2,11332,10389], 0, 0, 0], [0,0]],
            ]
        ],
    ]);

room_add(12, [ //Lacuna House
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("12[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("12[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("12[0,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Platform
            [1,2,6,1,9,[sprite_get("plat_12"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Note Test
            [4, 3.13,1.88, 0, -6, [2, 0, 0, 1, 0, 32, 64, [0,1,0,0]], [0,0]],
            
            //Note Glow
            [1,3.13,4.75,0,-20,[sprite_get("scroll"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Room Transition To Town
            [8, 0, 9, 0, 0, [0, 0, 32, 72, 2, [2,8123,10546], 1, 0, 0], [0,0]],
            
            [12, 146, 50, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            ]
        ],
    ]);

room_add(13, [ //Sewer Entrance
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("13[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("13[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("13[0,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Platforms
            [1,24,43.50,1,9,[sprite_get("sewer_wood_stair"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Light 
            [12, 100, 100, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Camera Centering
            [7,21,31,0,0,[0,606,1000,0,606/2,248/2,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Room Transition To Sewer1
            [8, 47, 47, 0, 0, [0, 0, 96, 128, 7, [2,10828,8988], 0, 0, 0], [0,0]],
            ]
        ],
    ]);
    
room_add(14, [ //Hunter Room
    [ //Each Cell - has [cell position, cell data]
        [-1,0], //Cell Coordinates
        [
            //Water Hitbox
            [4,85.38,23.38,0,0,[8,0,0,2,sprite_get("sewerh_water_hitbox"),0,0,[0,0,2,0]],[0,0]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("14[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("14[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Dialog/Cutscene Start - Hunter
            [4, 85, 16, 0, 0, [5, 0, 0, -1, 0, 32, 600, []], [0,0]],
            // [4, 85, 16, 0, 0, [7, 0, 0, -1, 0, 32, 600, []], [0,0]],
            
            //Hunter
            [1,72.63,27.88,0,0,[sprite_get("hunter"),6,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,75.50,28.88,0,0,[sprite_get("campfire"),11,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 77.50-0.25     ,30+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //RT to self, for the healing effect :)
            [8, 78, 28, 0, 0, [0, 0, 32, 96, 14, [2,11054,10367], 1, 7, 0], [0,0]],
            
            //Room Transition To Staging
            [8, 27, 26, 0, 0, [0, 0, 96, 96, 10, [2,8254,10598], 1, 0, 0], [0,0]],
            ]
        ],
    ]);
    
room_add(15, [ //Sewer Side Room1
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("15[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("15[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Platforms
            [1,53.75,24.38,1,9,[sprite_get("sewer_plat4"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //To Sewer1 lower
            [8,21.88,29.50,0,0,[0,0,96,96,7,[2,13806,9951],1,0,0,],[0,0]], // Exported from Lucid Dream
            
            //To Sewer1 upper
            [8,96.88,29.50,0,0,[0,0,96,96,7,[2,12796,9145],1,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Torches
            [1,28.88,22.25,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,44.38,27.38,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,92.38,30.13,0,0,[sprite_get("torch"),7,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 28.88-0.25     ,22.25+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 44.38-0.25     ,27.38+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            [12, 92.38-0.25     ,30.13+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            
            //Burger
            [10, 59,23.38, 0, 0, [0, sprite_get("borgar"), 32, 0.3, 0, "Burger", 0, 0], [0,0]],
            ]
        ],
    ]);
    
room_add(16, [ //Sewer Side Room2
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("16[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("16[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Plat
            [1,40,26.88,1,9,[sprite_get("sewer_wood_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //To Sewer3
            [8,20,32,0,0,[0,0,96,96,9,[2,9896,9471],1,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Camera Centering
            [7,14.88,14.88,0,0,[0,720,412,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Note Monster
            [4,43,24,0,-6,[3,0,0,0,0,64,64,[0,1,0,0]],[0,0]], // Exported from Lucid Dream
            
            //Lights
            [12, 100-0.25     ,70+1.25, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,2]],
            ]
        ],
    ]);
    
room_add(17, [ //Boss Room!
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 3, [sprite_get("17[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 2, [sprite_get("17[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 31.63,21.13, 0, 1, [sprite_get("aby_seed"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Platforms
            [1,42,23,1,9,[sprite_get("boss_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,23,23,1,9,[sprite_get("boss_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Camera Centering
            [7,0,0,0,0,[0,1200,800,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Ryken Dialog Start
            [4, 30, 0, 0, 0, [5, 0, 0, -1, 0, 32, 600, []], [0,0]],
            
            //Rykenburn Himself
            [6, 47.25,29.94, 0, -5, [100, 0, 0, [], 0, 0, 0, 0], [0,17]],
            ]
        ],
    ]);

room_add(20, [ //Credits
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Only 1 Background init per Room
            [1, 0, 0, 0, 30, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 29, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            
            ]
        ],
    ]);
   
////EXAMPLE////
// room_add(3, [ //Room Name
//     [ //Each Cell - has [cell position, cell data]
//         [0,0], //Cell Coordinates
//         [
//             ]
//         ],
//     ]);

/*
################################################################################
CHEAT SHEET
################################################################################

#############
room_add(room_id, [room_data]);
room_id: The unique numerical ID of the scene.

room_data: The data of each of the articles. It's in the same order as it is in config.ini
    per article: [article,x,y,type,depth,[arg0,arg1,arg2,arg3,arg4,arg5,arg6,arg7], [custom_args]]
    
    custom_args depends on the article calling - it's there in case it's needed, but not officially supported beyond existing & loading.
#############
*/




//DO NOT EDIT BELOW
#define room_add(_room_id,room_data) //Adds a new room to the scene
while _room_id > array_length_1d(array_room_data) array_push(array_room_data,[]);
array_room_data[_room_id] = room_data;
return;
// var _room_id_ind = array_find_index(array_room_ID,_room_id);
// if _room_id_ind == - 1 {
//     // if debug print_debug("[RM] Adding... "+string(_room_id));
//     array_push(array_room_data,room_data);
//     array_push(array_room_ID,_room_id);
// } else {
//     array_room_data[_room_id_ind] = room_data;
//     array_room_ID[_room_id_ind] = _room_id;
// }