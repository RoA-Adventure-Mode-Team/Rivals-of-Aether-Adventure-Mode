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
    [ //Each Cell - has [cell position, cell data]
        [-3,0], //Cell Coordinates
        [
            //Solid collision
            [1, 0, 0, 2, 1, [sprite_get("[-3,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            
            //Only 1 Background init per Room
            [1, 0, 0, 0, 30, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 29, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            
            //Player Shadow, Only 1 init as well
            [13, 0, 0, 0, -6, [0, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            [13, 0, 0, 0, -15, [1, make_color_rgb(24, 32, 64), 0, 0, 0, 0, 0, 0], [0,0]],
            
            //Room Transition
            [8, 20, 40, 0, 0, [0, 0, 64, 64, 2, 2, 1, 0, 0], [0,0]],
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
            //Solid collision
            [1, 0, 0, 2, 1, [sprite_get("[-2,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            
            //Fluff behind the player
            [1, 0, 0, 0, 1, [sprite_get("[-2,0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Fluff in front of the player
            [1, 0, 0, 0, -8, [sprite_get("[-2,0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            
            //Platforms (exported from Lucid Dream)
            [1,57,35.25,1,1,[sprite_get("short_fc_plat"),0,0,0,0,0,0,0,],[0,0]],
            
            //Platforms (exported from Lucid Dream)
            [1,106,35.25,1,1,[sprite_get("short_fc_plat"),0,0,0,0,0,0,0,],[0,0]],
            [1,75,38,1,1,[sprite_get("fc_box_plat"),0,0,0,0,0,0,0,],[0,0]],
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [-1,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("[-1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [8, 20, 40, 0, 0, [0, 0, 64, 64, 2, 2, 1, 0, 0], [0,0]],
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
            
            //Player Shadow, Only 1 init as well
            [13, 0, 0, 0, -6, [0, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            [13, 0, 0, 0, -15, [1, make_color_rgb(24, 32, 64), 0, 0, 0, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [-1,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("2[-1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("2[-1,0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("2[-1,0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [0,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("2[0,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 1, [sprite_get("2[0,0]bfluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, -8, [sprite_get("2[0,0]ffluff"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            ]
        ],
    [ //Each Cell - has [cell coordinates, cell data]
        [1,0], //Cell Coordinates
        [
            [1, 0, 0, 2, 1, [sprite_get("2[1,0]ground"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            ]
        ],
        
    
    
    ]);
    
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