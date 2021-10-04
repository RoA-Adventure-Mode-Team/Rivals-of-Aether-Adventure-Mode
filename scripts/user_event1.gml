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
    DESTUCTABLE
}
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
            [4, 40, 40, 0, -6, [2, 0, 0, 0, 0, 32, 64, 0], [0,0]],
            
            //Ryken Test Spawn
            [6, 140, 36, 0, -5, [100, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Guard Test Spawn
            // [6, 140, 36, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Room Transition To Sewer
            // [8, 40, 34, 0, 0, [0, 0, 64, 64, 7, [2,10828,8988], 1, 0, 0], [0,0]],
            
            //Room Transition To Sewer2
            // [8, 40, 34, 0, 0, [0, 0, 64, 64, 8, [2,8166,9164], 1, 0, 0], [0,0]],
            
            //Room Transition To Sewer3
            // [8, 40, 34, 0, 0, [0, 0, 64, 64, 9, [2,14147,10772], 1, 0, 0], [0,0]],
            
            //Room Transition To Temple Basement
            [8, 40, 34, 0, 0, [0, 0, 64, 64, 4, [2,10135,10275], 1, 0, 0], [0,0]],
            
            //Room Transition to Hallowflame
            // [8, 40, 40, 0, 0, [0, 0, 64, 64, 2, [2,7328,10551], 1, 0, 0], [0,0]],
            
            //Debug Articles
            
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("1[-3,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("1[-3,0]fg"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("1[-3,0]bg"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            
            //Only 1 Background init per Room
            [1, 0, 0, 0, 30, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 29, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            
            //Player Shadow
            [13, 0, 0, 0, -6, [0, 0, 0, 0, 0, 0, 0, 0], [0,2]],
            [13, 0, 0, 0, -15, [1, make_color_rgb(24, 32, 64), 0, 0, 0, 0, 0, 0], [0,0]],
            
            
            // //Room Transition To Temple Inside
            // [8, 20, 40, 0, 0, [0, 0, 156, 156, 3, [2,9851,10185], 1, 0, 0], [0,0]],
            
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [-3,-1], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("[-3,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
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
            [6, 86, 43, 0, -5, [7, 0, 0, [{x: 7358, y: 10545}, {x: 9666, y: 10545}], 0, 0, 0, 0], [0,11]],
            
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
            [8,155,39.88,0,0,[0,0,64,64,2,[2,7328,10551],1,0,0,],[0,0]], // Exported from Lucid Dream
            
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
            [6, 110, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            // [6, 70, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            [6, 30, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //End Quest - To Town
            // [4, 20, 38, 0, 0, [2, 1, 0, -1, 0, 300, 200, 0], [0,0]], //See [-2,0]
            
            
            //Room Transition To Shrine Inside
            [8,31,36.38,0,0,[0,0,64,120,6, [2,9794,9975],1,0,0,],[0,0]], // Exported from Lucid Dream
            // [8, 30, 38, 0, 0, [0, 0, 64, 120, 6, [2,9794,9975], 1, 0, 0], [0,0]],
            
            //Room Transition To House Inside
            [8,54.13,36.38,0,0,[0,0,64,120,6, [2,9794,9975], 1,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Room Transition To Temple Inside
            [8, 154, 34, 0, 0, [0, 0, 156, 156, 3, [2,9851,10185], 1, 0, 0], [0,0]],
            
            
            //Camera Centering
            [7,135,9,0,0,[0,764,600,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [0,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("2[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("2[0,0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("2[0,0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Room Transition To Outside Right
            [8, 156, 37, 0, 0, [0, 0, 64, 120, 5, [2,9847,10544], 1, 0, 0], [0,0]],
            
            [1,95.13,24,1,9,[sprite_get("m_f_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,92.13,24.88,1,9,[sprite_get("m_f_plat1"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,87.75,34,1,9,[sprite_get("raised_steps_plat"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [1,116.88,18,1,9,[sprite_get("m_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            [1,116.88,10,1,9,[sprite_get("m_plat3"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            // //Camera Centering - DEBUG
            // [7,26,28,0,0,[0,1528,247,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Guard Spawns
            // [6, 140, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            [6, 110, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            [6, 70, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
            // [6, 30, 43.94, 0, -5, [8, 0, 0, [], 0, 0, 0, 0], [0,0]],
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
            
            [1,19,6.25,0,1,[sprite_get("RykenAM_Sit"),10,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            //Camera Centering
            [7, 0, 0, 0, 0, [0, 640, 358, 0, 0, 0, 0, 0], [0,0]],
            
            //Room Transition To Town
            [8, 0, 14, 0, 0, [0, 0, 16, 110, 2, [2,9774,10547], 1, 0, 0], [0,0]],
            
            //Kei Spawn, Temple
            [6,9.38,22.19,0,-5,[7,0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
            
            [8,33.25,15.38,0,0,[0,0,16,110,2, [2,9774,10547], 1,0,0,],[0,0]], // Exported from Lucid Dream
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
            [6, 0, 38, 0, -5, [10, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
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
            [8, 0, 37, 0, 0, [0, 0, 16, 110, 2, [2,12265,10549], 1, 0, 0], [0,0]],
            
            //Enemy Spawns
            //Brawler
            [6, 87, 38, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Fleye
            [6, 102, 23, 0, -5, [2, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //LsBird
            [6, 127, 42, 0, -5, [4, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
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
            
            //Brawler
            [6, 62, 43, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //LsBird
            [6, 80, 43, 0, -5, [4, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Brawler
            [6, 126, 37, 0, -5, [1, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            //Fleye
            [6, 148, 23, 0, -5, [2, 0, 0, [], 0, 0, 0, 0], [0,0]],
            
            
            //Take Crate From Player
            [4, 14, 37, 0, 0, [4, 0, oPlayer, 120, 0, 200, 144, [1]], [0,0]],
            
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
            [1, 0, 0, 0, 1, [sprite_get("6[F0]sign"), 0, 0, 0, false, 0, 0, 0], [0,1]],
            
            //Camera Centering
            [7, 0, 0, 0, 0, [0, 260, 180, 0, 0, 0, 0, 0], [0,0]],
            
            //Room Transition To Town
            [8, 0, 6, 0, 0, [0, 0, 32, 72, 2, [2,7765,10529], 1, 0, 0], [0,0]],
            ]
        ],
    ]);
    

room_add(7, [ //Sewer Start
    [ //Each Cell - has [cell position, cell data]
        [0,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("7[0,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 2, [sprite_get("7[0,-1]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("7[0,-1]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            
            
            
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
            
            //Triplat Section Init
            [4,11,70,0,0,[10,0,0,-1,0,200,332,[]],[0,0]],
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
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [2,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("7[2,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 2, [sprite_get("7[2,0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("7[2,0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            ]
        ],
    ]);

room_add(8, [ //Sewer Left
    [ //Each Cell - has [cell position, cell data]
        [1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("8[1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("8[1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[1,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
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
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [-1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("8[-1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("8[-1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[-1,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [1,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("8[1,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("8[1,-1]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[1,-1]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
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
            [1,152,72.75,1,9,[sprite_get("sewer_plat2"),0,0,0,0,0,0,0,],[0,0]], // Exported from Lucid Dream
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
            ]
        ],
    ]);

room_add(9, [ //Sewer Jump
    [ //Each Cell - has [cell position, cell data]
        [1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[1,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[0,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[0,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [-1,0], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[-1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[-1,0]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[-1,0]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [1,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[1,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[1,-1]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[1,-1]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [0,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[0,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[0,-1]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[0,-1]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
           ]
        ],
    [ //Each Cell - has [cell position, cell data]
        [-1,-1], //Cell Coordinates
        [
            //Static Sprites
            [1, 0, 0, 2, 1, [sprite_get("9[-1,-1]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("9[-1,-1]bg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            // [1, 0, 0, 0, -8, [sprite_get("8[-1,-1]fg"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            ]
        ],
    ]);

room_add(10, [ //Final Staging
    [ //Each Cell - has [cell position, cell data]
        [0,0], //Cell Coordinates
        [
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



    
// room_add(1,[
//     [ //Each Cell
//         [0,0], //Cell Coordinates
//         [
//             //[1, 2, 2, 2, 20, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]],
//             //[1, 2, 2, 0, 20, [7, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            
//             //Ground & BG Declarations
//             [1, 0, 0, 2, -1, [sprite_get("marble_ground"), 0, 0, true, false, 0, 0, 0], [0,0]],
//             //[1, 0, 0, 0, -8, [sprite_get("ground_top"), 0, 0, false, false, 0, 0, 0], [0,0]],
//             [1, 66, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             [1, 126, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             [1, 0, 0, 0, 30, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
//             [1, 0, 0, 0, 29, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
//             // [6, 84, 44, 0, -5, [4, 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             /*  DITHER ARGS: [dither type, transparency (0 = partial transparency, 1 = full transparency), dither frames]
//                                             [11, 20, 44, 0, 10, [0, 0, 0, 0, 5, 2, 0, 0], [0,0]], //[no dither] 
//             ///*[partial w/ regular dither] [11, 50, 44, 0, -5, [1, 0, 20, 0, 0, 0, 0, 0], [0,0]],
//             ///*[full w/ brick dither]      [11, 80, 44, 0, -5, [2, 1, 30, 0, 0, 0, 0, 0], [0,0]],
//             ///*[dbz dither]                [11, 110, 44, 0, -5, [3, 1, 32, 0, 0, 0, 0, 0], [0,0]], */
//             //[6, 80, 36, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[10, 50, 34, 0, 0, [1, 144, 1, 0, 0, 0, 0, 0], [0,0]],
//             [4, 87, 43, 0, 0, [2, 1, 0, 0, 0, 32, 32, 0], [0,0]],
//             [8, 99, 40, 0, 0, [0, 0, 64, 64, 2, 2, 1, 0, 0], [0,0]],
//             //[8, 86, 47, 0, 0, [0, 0, 32, 32, 2, 1, -1, -1], [0,0]],
//             //
//             //[7, 0, 25, 0, 0, [0, 900, 500, 2, 0, 0, 0, 0], [0,0]],
//             [9, 90, 25, 0, 0, [1, 300, 500, 1, 0, 3, 0, 0], [0,0]], //Checkpoint
//             [1, 90, 44, 0, 2, [sprite_get("stall"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 101, 44, 0, 1, [sprite_get("house_main"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 70, 44, 0, 7, [sprite_get("house1"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [11, 83, 44, 0, 4, [sprite_get("tree1"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
//             [11, 75, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
//             [11, 90, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
//             [1, 81, 44, 0, 0, [sprite_get("bench"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[11, 111, 44, 0, 4, [sprite_get("tree1"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
//             //[11, 120, 44, 0, 4, [sprite_get("tree2"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
//             [1, 123, 44, 0, -1, [sprite_get("underwater"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 57, 44, 0, 1, [sprite_get("well"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[12, 67, 43, 0, -20, [sprite_get("light_dimver"), 10, 1, 0, 0, 0, 0, 0], [0,68]],
//             //[12, 90, 44, 0, -20, [sprite_get("light_dimver"), 20, 0, 0, 0, 0, 0, 0], [0,67]],
//             [12, 106, 43, 0, -20, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,69]],
            
//             [1, 16, 44, 0, 1, [sprite_get("house_2stor"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             // [15, 20, 20, 0, 1, [sprite_get("torchtower"), 2, 0, sound_get("sfx_fade"), 0, 0, 0, 20], [0,0]], Old
//             [15,20,28,0,1,[sprite_get("torchtower"),2,0,sound_get("sfx_fade"),0,0,0,20,],[0,0]],
//             [1, 16, 28.125, 1, 1, [sprite_get("house_2stor_plath"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 16, 36.125, 1, 1, [sprite_get("house_2stor_platl"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            
//             //[11, 38, 44-(71/8), 1, -7, [sprite_get("arch1"), 2, 0, 20, 0, 0, 0, 0], [0,0]],
//             [1, 44, 44-(71/8), 1, -7, [sprite_get("arch1"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
            
//             //SEWER ADDITIONS
//             [1, 29, 43, 0, -9, [sprite_get("sewer_top"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 29, 44, 1, 0, [sprite_get("sewer_well_start"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [13, 0, 0, 0, -6, [0, 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [13, 0, 0, 0, -15, [1, make_color_rgb(24, 32, 64), 0, 0, 0, 0, 0, 0], [0,0]],
            
//             [7, 63, 30, 0, 0, [0, 700, 300, 0, 0, 0, 0, 0], [0,0]], //Camera Area
//             //[14, 74, 40, 0, 2, [sprite_get("thrust_vfx"), 2, 128, .2, 0, [2,-4], 1, 0, 0], [0,0]],
//             ]
//         ],
//     [
//         [1,0],
//         [
//             [1, 0, 0, 2, -1, [sprite_get("marble_ground"), 0, 0, true, false, 0, 0, 0], [0,0]],
//             /*[1, 0, 0, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 66, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 126, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             [1, 0, 0, 0, 10, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
//             [1, 0, 0, 0, 9, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            
//             [1, 90, 44, 0, 2, [sprite_get("stall"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 101, 44, 0, 1, [sprite_get("house_main"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 70, 44, 0, 1, [sprite_get("house1"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [11, 83, 44, 0, 4, [sprite_get("tree1"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
//             [11, 75, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
//             [11, 90, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
//             [1, 81, 44, 0, 0, [sprite_get("bench"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [11, 111, 44, 0, 4, [sprite_get("tree1"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
//             [11, 120, 44, 0, 4, [sprite_get("tree2"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
//             [1, 123, 44, 0, -1, [sprite_get("underwater"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 57, 44, 0, 1, [sprite_get("well"), 2, 0, 0, 0, 0, 0, 0], [0,0]]*/
//             ]
//         ],
//     [ //Each Cell
//         [-1,0], //Cell Coordinates
//         [
//             [1, 0, 0, 2, -1, [sprite_get("marble_ground"), 0, 0, true, false, 0, 0, 0], [0,0]],
//             //[1, 0, 0, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 2, 0, 0, -8, [sprite_get("ground_top"), 0, 0, false, false, 0, 0, 0], [0,0]],
//             //[1, 66, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 126, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]]
            
//             ]
//         ],
//     [ //Each Cell
//         [-2,0], //Cell Coordinates
//         [
//             //[1, 0, 0, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
//             //[1, 66, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 126, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]]
            
//             ]
//         ],
//     [ //Each Cell
//         [0,1], //Cell Coordinates
//         [
//             //[1, 0, 0, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             [4, 29, 10, 0, 0, [7, 1, 0, 0, 0, 128, 32, 0], [0,0]],
//             //[4, 29, 0, 0, 0, [4, 1, 0, 0, 0, 128, 32, 0], [0,0]],
//             [1, 29, 0, 0, 0, [sprite_get("sewer_well_cont"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 29, 43, 0, 0, [sprite_get("sewer_well_cont"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[8, 29, 43, 0, 0, [0, 0, 64, 64, 4, 2, 0, 0, 0], [0,0]],
//             //[4, 29, 43, 0, 0, [100, 0, 0, 0, 0, 128, 32, 0], [0,0]],
//             [1, 0, 0, 0, 1, [sprite_get("black"), 0, 0, 0, 0, 0, 0, 0], [0,0]]

//             ]
//         ],
//     [ //Each Cell
//         [0,-1], //Cell Coordinates
//         [
//             // [1,122,4,0,1,[sprite_get("vtemple"),0,0,0,0,0,0,0,],[0,0]],
            
//             //[1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
//             ]
//         ],
//     [ //Each Cell
//         [-1,1], //Cell Coordinates
//         [
//             [1, 0, 0, 0, 1, [sprite_get("black"), 0, 0, 0, 0, 0, 0, 0], [0,0]]

//             ]
//         ],
//     [ //Each Cell
//         [-1,-1], //Cell Coordinates
//         [
//             [1,121,76,0,1,[sprite_get("vtemple"),0,0,0,0,0,0,0,],[0,0]],
//             // [7, 63, 30, 0, 0, [0, 700, 300, 0, 0, 0, 0, 0], [0,0]], //Camera Area
//             [7,121,82,0,1,[0,840,840,0,0,0,0,0,],[0,0]],
//             ]
//         ],
        
//     [ //Each Cell
//         [0,2], //Cell Coordinates
//         [
//             /*[1, 29, 0, 0, 0, [sprite_get("sewer_well_cont"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 29, 43, 0, 0, [sprite_get("sewer_well_cont"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 0, 0, 2, -1, [sprite_get("sewer_ground_left"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             [1, 0, 0, 0, 3, [sprite_get("black"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 63, 0, 0, 2, [sprite_get("sewer_bg"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 30, 54, 0, 1, [sprite_get("sewer_sect1"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 59, 46, 0, -1, [sprite_get("torch"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [12, 59, 46, 0, -20, [sprite_get("light"), 12, 0, 0, 0, 0, 0, 0], [0,69]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 84, 52, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 100, 44, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],*/
//             //[6, 76, 48, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[6, 76, 48, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,0]]
//             ]
//         ],
//     [ //Each Cell
//         [-1,2], //Cell Coordinates
//         [
//             //[1, 0, 0, 0, 2, [sprite_get("black"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[1, 0, 0, 2, -1, [sprite_get("sewer_ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],

//             ]
//         ],
//     [ //Each Cell
//         [0,3], //Cell Coordinates
//         [
//             ]
//         ],
//     [ //Each Cell
//         [0,4], //Cell Coordinates
//         [
//             ]
//         ]
//     ]);
// room_add(2,[
//     [ //Each Cell
//         [0,0], //Cell Coordinates
//         [
            
//             //[1, 0, 44, 2, 7, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 66, 44, 2, 7, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 126, 44, 2, 7, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             [1, 66, 44, 2, 10, [sprite_get("black_screen"), 0, 0, 0, false, 0, 0, 0], [0,0]], 
//             [1, 101, 44, 0, 1, [sprite_get("house_main_inside"), 0, 0, 0, false, 0, 0, 0], [0,0]], 
//             [1, 101, 44, 2, 1, [sprite_get("house_main_insideb"), 0, 0, 1, false, 0, 0, 0], [0,0]], 
//             [1, 101, 36, 1, 1, [sprite_get("house_main_insideplat"), 0, 0, 1, false, 0, 0, 0], [0,0]],
//             [1, 101, 44, 0, -10, [sprite_get("house_main_transparent"), 0, 0, 1, false, .5, 0, 0], [0,0]],
//             [8, 92, 40, 0, 0, [0, 0, 60, 60, 3, 2, false, 0, 0], [0,0]],
//             [10, 105, 35, 0, 0, [0, sprite_get("borgar"), 16, 1, 0, "Borgar", 0, 0], [0,0]]
//             ]
//         ],
//     [
//         [1,0],
//         [

//             ]
//         ],
//     [ //Each Cell
//         [-1,0], //Cell Coordinates
//         [

//             ]
//         ],
//     [ //Each Cell
//         [0,1], //Cell Coordinates
//         [

//             ]
//         ],
//     [ //Each Cell
//         [0,2], //Cell Coordinates
//         [

//             ]
//         ]
//     ]);
// room_add(3,[
//     [ //Each Cell
//         [0,0], //Cell Coordinates
//         [
//             //[1, 2, 2, 2, 20, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]],
//             //[1, 2, 2, 0, 20, [7, 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //Ground & BG Declarations
//             [1, 0, 0, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 66, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 126, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             [1, 0, 0, 0, 10, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
//             [1, 0, 0, 0, 9, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
//             /*  DITHER ARGS: [dither type, transparency (0 = partial transparency, 1 = full transparency), dither frames]
//                                             [11, 20, 44, 0, 10, [0, 0, 0, 0, 5, 2, 0, 0], [0,0]], //[no dither] 
//             ///*[partial w/ regular dither] [11, 50, 44, 0, -5, [1, 0, 20, 0, 0, 0, 0, 0], [0,0]],
//             ///*[full w/ brick dither]      [11, 80, 44, 0, -5, [2, 1, 30, 0, 0, 0, 0, 0], [0,0]],
//             ///*[dbz dither]                [11, 110, 44, 0, -5, [3, 1, 32, 0, 0, 0, 0, 0], [0,0]], */
//             [6, 80, 36, 0, -5, [3, 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[6, 120, 36, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[6, 80, 36, 0, -5, [2, 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [6, 120, 36, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[10, 50, 34, 0, 0, [1, 144, 1, 0, 0, 0, 0, 0], [0,0]],
//             //[4, 87, 43, 0, 0, [1, 0, 0, 0, 0, 32, 32, 0], [0,0]],
//             //[8, 99, 40, 0, 0, [0, 0, 64, 64, 2, 2, 1, 0, 0], [0,0]],
//             //[8, 86, 47, 0, 0, [0, 0, 32, 32, 2, 1, -1, -1], [0,0]],
//             //[7, 63, 30, 0, 0, [0, 700, 300, 0, 0, 0, 0, 0], [0,0]],
//             //[7, 0, 25, 0, 0, [0, 900, 500, 2, 0, 0, 0, 0], [0,0]],
//             [9, 117, 25, 0, 0, [1, 900, 500, 1, 0, 3, 0, 0], [0,0]],
            
//             //[1, 90, 44, 0, 2, [sprite_get("stall"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 90, 44, 0, 2, [sprite_get("stall_empty"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 101, 44, 0, 1, [sprite_get("house_main"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 70, 44, 0, 1, [sprite_get("house1"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [11, 83, 44, 0, 4, [sprite_get("tree1"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
//             [11, 75, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
//             [11, 90, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
//             [1, 81, 44, 0, 0, [sprite_get("bench"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[11, 111, 44, 0, 4, [sprite_get("tree1"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
//             //[11, 120, 44, 0, 4, [sprite_get("tree2"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
//             [1, 123, 44, 0, -1, [sprite_get("underwater"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 57, 44, 0, 1, [sprite_get("well"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             ]
//         ],
//     [
//         [1,0],
//         [
            
//             ]
//         ],
//     [ //Each Cell
//         [-1,0], //Cell Coordinates
//         [
            
//             ]
//         ],
//     [ //Each Cell
//         [0,1], //Cell Coordinates
//         [
            
//             ]
//         ],
//     [ //Each Cell
//         [0,-1], //Cell Coordinates
//         [
//             ]
//         ],
//     [ //Each Cell
//         [0,2], //Cell Coordinates
//         [
//             ]
//         ],
//     [ //Each Cell
//         [0,3], //Cell Coordinates
//         [
//             ]
//         ],
//     [ //Each Cell
//         [0,4], //Cell Coordinates
//         [
//             ]
//         ]
//     ]);
// room_add(4,[
//     [ //Each Cell
//         [0,0], //Cell Coordinates
//         [
//             [1, 0, 0, 2, 1, [sprite_get("ground"), 0, 0, true, false, 0, 0, 0], [0,0]],
//             [1, 29, 44, 0, 0, [sprite_get("sewer_well_start"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             ]
//         ],
//     [
//         [1,0],
//         [
//             ]
//         ],
//     [ //Each Cell
//         [-1,0], //Cell Coordinates
//         [
//             //[1, 0, 0, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 66, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 126, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]]
            
//             ]
//         ],
//     [ //Each Cell
//         [-2,0], //Cell Coordinates
//         [
//             //[1, 0, 0, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
//             //[1, 66, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[1, 126, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]]
            
//             ]
//         ],
//     [ //Each Cell
//         [0,1], //Cell Coordinates
//         [
//             //[1, 0, 0, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             //[4, 29, 10, 0, 0, [7, 1, 0, 0, 0, 128, 32, 0], [0,0]],
//             [4, 29, 0, 0, 0, [3, 1, 0, 0, 0, 128, 32, 0], [0,0]],
//             [1, 29, 0, 0, 0, [sprite_get("sewer_well_cont"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 29, 43, 0, 0, [sprite_get("sewer_well_cont"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[8, 29, 43, 0, 0, [0, 0, 64, 64, 4, 2, 0, 0, 0], [0,0]],
//             //[4, 29, 43, 0, 0, [100, 0, 0, 0, 0, 128, 32, 0], [0,0]],
//             [1, 0, 0, 0, 1, [sprite_get("black"), 0, 0, 0, 0, 0, 0, 0], [0,0]]

//             ]
//         ],
//     [ //Each Cell
//         [0,-1], //Cell Coordinates
//         [
            
//             //[1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
//             ]
//         ],
//     [ //Each Cell
//         [-1,1], //Cell Coordinates
//         [
//             [1, 0, 0, 0, 1, [sprite_get("black"), 0, 0, 0, 0, 0, 0, 0], [0,0]]

//             ]
//         ],
//     [ //Each Cell
//         [0,2], //Cell Coordinates
//         [
//             [1, 29, 0, 0, 0, [sprite_get("sewer_well_cont"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 29, 43, 0, 0, [sprite_get("sewer_well_cont"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 0, 0, 2, -1, [sprite_get("sewer_ground_left"), 0, 0, 0, false, 0, 0, 0], [0,0]],
//             [1, 0, 0, 0, 3, [sprite_get("black"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 65, 0, 0, 2, [sprite_get("sewer_bg1"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[1, 65, 0, 0, 1, [sprite_get("sewer_pipes1"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 65, 0, 2, -3, [sprite_get("sewer_ceil1"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 30, 54, 0, 1, [sprite_get("sewer_sect1"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
            
//             [1, 59, 46, 0, -1, [sprite_get("torch"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [12, 59, 46, 0, -20, [sprite_get("light"), 12, 0, 0, 0, 0, 0, 0], [0,69]],
//             [1, 38, 50, 0, -1, [sprite_get("torch"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [12, 38, 50, 0, -20, [sprite_get("light"), 12, 0, 0, 0, 0, 0, 0], [0,69]],
//             [1, 136, 50, 0, -1, [sprite_get("torch"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [12, 136, 50, 0, -20, [sprite_get("light"), 12, 0, 0, 0, 0, 0, 0], [0,69]],
//             [1, 175, 30, 0, -1, [sprite_get("torch"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [12, 175, 30, 0, -20, [sprite_get("light"), 12, 0, 0, 0, 0, 0, 0], [0,69]],
//             [1, 72, 54, 0, -10, [sprite_get("steam_lantern"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [12, 72, 50, 0, -20, [sprite_get("light"), 12, 0, 0, 0, 0, 0, 0], [0,69]],
            
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 95, 52, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 114, 44, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 154, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 76, 48, 1, 0, [sprite_get("sewer_plat"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            
//             [14, 117, 58, 0, 1, [sprite_get("steam_vfx"), 60, 180, .2, 0, [.5,-1], 1, 0, 0], [0,0]],
//             [6, 80, 48, 0, -5, [2, 0, 0, 0, 0, 0, 0, 0], [0,0]], //Flying Spitter
//             //[6, 80, 48, 0, -5, [2, 0, 0, 0, 0, 0, 0, 0], [0,0]]
//             ]
//         ],
//     [ //Each Cell
//         [1,2], //Cell Coordinates
//         [
//             [1, 0, 0, 0, 2, [sprite_get("sewer_bg2"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 65, 0, 2, -3, [sprite_get("sewer_ceil1"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[1, 0, 0, 0, 2, [sprite_get("black"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             [1, 0, 0, 2, -1, [sprite_get("sewer_water1"), 0, 0, 0, false, 0, 0, 0], [0,0]],

//             ]
//         ],
//     [ //Each Cell
//         [-1,2], //Cell Coordinates
//         [
//             [1, 0, 0, 0, 2, [sprite_get("black"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
//             //[1, 0, 0, 2, -1, [sprite_get("sewer_ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],

//             ]
//         ],
//     [ //Each Cell
//         [0,3], //Cell Coordinates
//         [
//             ]
//         ],
//     [ //Each Cell
//         [0,4], //Cell Coordinates
//         [
//             ]
//         ]
//     ]);
/*room_add(4,[
    [ //Each Cell
        [0,0], //Cell Coordinates
        [
            
            ]
        ],
    [
        [1,0],
        [
            
            ]
        ],
    [ //Each Cell
        [-1,0], //Cell Coordinates
        [
            
            ]
        ],
    [ //Each Cell
        [0,1], //Cell Coordinates
        [
            [1, 29, 0, 0, 0, [sprite_get("sewer_well_cont"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
            [1, 29, 43, 0, 0, [sprite_get("sewer_well_cont"), 0, 0, 0, 0, 0, 0, 0], [0,0]],
            [8, 29, 43, 0, 0, [0, 0, 64, 64, 4, 2, 0, 0, 0], [0,0]],
            //[4, 29, 43, 0, 0, [100, 0, 0, 0, 0, 128, 32, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("black"), 0, 0, 0, 0, 0, 0, 0], [0,0]]
            ]
        ],
    [ //Each Cell
        [0,-1], //Cell Coordinates
        [
            
            ]
        ]
    ]);*/
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
var _room_id_ind = array_find_index(array_room_ID,_room_id);
if _room_id_ind == - 1 {
    // if debug print_debug("[RM] Adding... "+string(_room_id));
    array_push(array_room_data,room_data);
    array_push(array_room_ID,_room_id);
} else {
    array_room_data[_room_id_ind] = room_data;
    array_room_ID[_room_id_ind] = _room_id;
}