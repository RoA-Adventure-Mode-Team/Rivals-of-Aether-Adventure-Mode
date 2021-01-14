// Load Room Data - Room Manager

//Add Room Data Here
room_add(0,[]); //Empty Room
//room_data_temp = [article script, x, y, article type, depth, [args0-7], [custom]];

room_add(1,[
    [ //Each Cell
        [0,0], //Cell Coordinates
        [
            //[1, 2, 2, 2, 20, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]],
            //[1, 2, 2, 0, 20, [7, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            //Ground & BG Declarations
            [14, 74, 40, 0, 2, [sprite_get("thrust_vfx"), 2, 128, .2, 0, [2,-4], 1, 0, 0], [0,0]],
            [1, 0, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 66, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 126, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 10, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 9, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            /*  DITHER ARGS: [dither type, transparency (0 = partial transparency, 1 = full transparency), dither frames]
                                            [11, 20, 44, 0, 10, [0, 0, 0, 0, 5, 2, 0, 0], [0,0]], //[no dither] 
            ///*[partial w/ regular dither] [11, 50, 44, 0, -5, [1, 0, 20, 0, 0, 0, 0, 0], [0,0]],
            ///*[full w/ brick dither]      [11, 80, 44, 0, -5, [2, 1, 30, 0, 0, 0, 0, 0], [0,0]],
            ///*[dbz dither]                [11, 110, 44, 0, -5, [3, 1, 32, 0, 0, 0, 0, 0], [0,0]], */
            //[6, 80, 36, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            //[10, 50, 34, 0, 0, [1, 144, 1, 0, 0, 0, 0, 0], [0,0]],
            [4, 87, 43, 0, 0, [1, 1, 0, 0, 0, 32, 32, 0], [0,0]],
            [8, 99, 40, 0, 0, [0, 0, 64, 64, 2, 2, 1, 0, 0], [0,0]],
            //[8, 86, 47, 0, 0, [0, 0, 32, 32, 2, 1, -1, -1], [0,0]],
            //[7, 63, 30, 0, 0, [0, 700, 300, 0, 0, 0, 0, 0], [0,0]],
            //[7, 0, 25, 0, 0, [0, 900, 500, 2, 0, 0, 0, 0], [0,0]],
            //[9, 117, 25, 0, 0, [1, 900, 500, 1, 0, 3, 0, 0], [0,0]],
            
            [1, 90, 44, 0, 2, [sprite_get("stall"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            
            [1, 101, 44, 0, 1, [sprite_get("house_main"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [1, 70, 44, 0, 1, [sprite_get("house1"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [11, 83, 44, 0, 4, [sprite_get("tree1"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
            [11, 75, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
            [11, 90, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
            [1, 81, 44, 0, 0, [sprite_get("bench"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [11, 111, 44, 0, 4, [sprite_get("tree1"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
            [11, 120, 44, 0, 4, [sprite_get("tree2"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
            [1, 123, 44, 0, -1, [sprite_get("underwater"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [1, 57, 44, 0, 1, [sprite_get("well"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [12, 67, 43, 0, -10, [sprite_get("light"), 20, 1, 0, 0, 0, 0, 0], [0,68]],
            [12, 90, 44, 0, -10, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,67]],
            [12, 106, 43, 0, -10, [sprite_get("light"), 20, 0, 0, 0, 0, 0, 0], [0,69]],
            
            
            ]
        ],
    [
        [1,0],
        [
            [1, 0, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 66, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 126, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 10, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 9, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            //[1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
            [1, 90, 44, 0, 2, [sprite_get("stall"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [1, 101, 44, 0, 1, [sprite_get("house_main"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [1, 70, 44, 0, 1, [sprite_get("house1"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [11, 83, 44, 0, 4, [sprite_get("tree1"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
            [11, 75, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
            [11, 90, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
            [1, 81, 44, 0, 0, [sprite_get("bench"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [11, 111, 44, 0, 4, [sprite_get("tree1"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
            [11, 120, 44, 0, 4, [sprite_get("tree2"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
            [1, 123, 44, 0, -1, [sprite_get("underwater"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [1, 57, 44, 0, 1, [sprite_get("well"), 2, 0, 0, 0, 0, 0, 0], [0,0]]
            ]
        ],
    [ //Each Cell
        [-1,0], //Cell Coordinates
        [
            
            //[1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
            ]
        ],
    [ //Each Cell
        [0,1], //Cell Coordinates
        [
            [1, 0, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 66, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 126, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 10, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 9, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            //[1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
            ]
        ],
    [ //Each Cell
        [0,-1], //Cell Coordinates
        [
            [1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
            ]
        ],
    [ //Each Cell
        [0,2], //Cell Coordinates
        [
            [1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
            ]
        ],
    [ //Each Cell
        [0,3], //Cell Coordinates
        [
            ]
        ],
    [ //Each Cell
        [0,4], //Cell Coordinates
        [
            ]
        ]
    ]);
room_add(2,[
    [ //Each Cell
        [0,0], //Cell Coordinates
        [
            
            //[1, 0, 44, 2, 7, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            //[1, 66, 44, 2, 7, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            //[1, 126, 44, 2, 7, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 66, 44, 2, 10, [sprite_get("black_screen"), 0, 0, 0, false, 0, 0, 0], [0,0]], 
            [1, 101, 44, 0, 1, [sprite_get("house_main_inside"), 0, 0, 0, false, 0, 0, 0], [0,0]], 
            [1, 101, 44, 2, 1, [sprite_get("house_main_insideb"), 0, 0, 1, false, 0, 0, 0], [0,0]], 
            [1, 101, 36, 1, 1, [sprite_get("house_main_insideplat"), 0, 0, 1, false, 0, 0, 0], [0,0]],
            [1, 101, 44, 0, -10, [sprite_get("house_main_transparent"), 0, 0, 1, false, .5, 0, 0], [0,0]],
            [8, 92, 40, 0, 0, [0, 0, 60, 60, 3, 2, false, 0, 0], [0,0]],
            [10, 105, 35, 0, 0, [0, sprite_get("borgar"), 16, 1, 0, "Borgar", 0, 0], [0,0]]
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

            ]
        ],
    [ //Each Cell
        [0,2], //Cell Coordinates
        [

            ]
        ]
    ]);
room_add(3,[
    [ //Each Cell
        [0,0], //Cell Coordinates
        [
            //[1, 2, 2, 2, 20, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]],
            //[1, 2, 2, 0, 20, [7, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            //Ground & BG Declarations
            [1, 0, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 66, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 126, 44, 2, 1, [sprite_get("ground"), 0, 0, 0, false, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 10, [sprite_get("bg2"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            [1, 0, 0, 0, 9, [sprite_get("bg3"), 0, 0, 0, true, 0, 0, 0], [0,0]],
            /*  DITHER ARGS: [dither type, transparency (0 = partial transparency, 1 = full transparency), dither frames]
                                            [11, 20, 44, 0, 10, [0, 0, 0, 0, 5, 2, 0, 0], [0,0]], //[no dither] 
            ///*[partial w/ regular dither] [11, 50, 44, 0, -5, [1, 0, 20, 0, 0, 0, 0, 0], [0,0]],
            ///*[full w/ brick dither]      [11, 80, 44, 0, -5, [2, 1, 30, 0, 0, 0, 0, 0], [0,0]],
            ///*[dbz dither]                [11, 110, 44, 0, -5, [3, 1, 32, 0, 0, 0, 0, 0], [0,0]], */
            [6, 80, 36, 0, -5, [3, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            //[6, 120, 36, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            //[6, 80, 36, 0, -5, [2, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            [6, 120, 36, 0, -5, [1, 0, 0, 0, 0, 0, 0, 0], [0,0]],
            //[10, 50, 34, 0, 0, [1, 144, 1, 0, 0, 0, 0, 0], [0,0]],
            //[4, 87, 43, 0, 0, [1, 0, 0, 0, 0, 32, 32, 0], [0,0]],
            //[8, 99, 40, 0, 0, [0, 0, 64, 64, 2, 2, 1, 0, 0], [0,0]],
            //[8, 86, 47, 0, 0, [0, 0, 32, 32, 2, 1, -1, -1], [0,0]],
            //[7, 63, 30, 0, 0, [0, 700, 300, 0, 0, 0, 0, 0], [0,0]],
            //[7, 0, 25, 0, 0, [0, 900, 500, 2, 0, 0, 0, 0], [0,0]],
            [9, 117, 25, 0, 0, [1, 900, 500, 1, 0, 3, 0, 0], [0,0]],
            
            //[1, 90, 44, 0, 2, [sprite_get("stall"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [1, 90, 44, 0, 2, [sprite_get("stall_empty"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [1, 101, 44, 0, 1, [sprite_get("house_main"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [1, 70, 44, 0, 1, [sprite_get("house1"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [11, 83, 44, 0, 4, [sprite_get("tree1"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
            [11, 75, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
            [11, 90, 44, 0, 4, [sprite_get("tree2"), 0, 0, 0, 0, .2, 0, 0], [0,0]],
            [1, 81, 44, 0, 0, [sprite_get("bench"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [11, 111, 44, 0, 4, [sprite_get("tree1"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
            [11, 120, 44, 0, 4, [sprite_get("tree2"), 2, 0, 0, 0, .2, 0, 0], [0,0]],
            [1, 123, 44, 0, -1, [sprite_get("underwater"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            [1, 57, 44, 0, 1, [sprite_get("well"), 2, 0, 0, 0, 0, 0, 0], [0,0]],
            ]
        ],
    [
        [1,0],
        [
            //[1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
            ]
        ],
    [ //Each Cell
        [-1,0], //Cell Coordinates
        [
            //[1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
            ]
        ],
    [ //Each Cell
        [0,1], //Cell Coordinates
        [
            //[1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
            ]
        ],
    [ //Each Cell
        [0,-1], //Cell Coordinates
        [
            [1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
            ]
        ],
    [ //Each Cell
        [0,2], //Cell Coordinates
        [
            [1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0,0]]
            ]
        ],
    [ //Each Cell
        [0,3], //Cell Coordinates
        [
            ]
        ],
    [ //Each Cell
        [0,4], //Cell Coordinates
        [
            ]
        ]
    ]);

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
    if debug print_debug("[RM] Adding... "+string(_room_id));
    array_push(array_room_data,room_data);
    array_push(array_room_ID,_room_id);
} else {
    array_room_data[_room_id_ind] = room_data;
    array_room_ID[_room_id_ind] = _room_id;
}