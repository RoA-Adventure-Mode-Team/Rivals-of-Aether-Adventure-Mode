// Load Room Data - Room Manager

//Add Room Data Here
room_add(0,[]); //Empty Room
//room_data_temp = [article script, x, y, article type, depth, [args0-7], [custom]];

room_add(1,[
    [ //Each Cell
        [0,0], //Cell Coordinates
        [
        /*  DITHER ARGS: [dither type, transparency (0 = partial transparency, 1 = full transparency), dither frames]
        /*[no dither]*/                 [11, 20, 44, 0, -5, [0, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[partial w/ regular dither]*/ [11, 50, 44, 0, -5, [1, 0, 20, 0, 0, 0, 0, 0], [0]],
        /*[full w/ brick dither]*/      [11, 80, 44, 0, -5, [2, 1, 30, 0, 0, 0, 0, 0], [0]],
        /*[dbz dither]*/                [11, 110, 44, 0, -5, [3, 1, 32, 0, 0, 0, 0, 0], [0]],
        /*[obj1]*/ [6, 80, 36, 0, -5, [0, 0, 0, 0, 0, 0, 0, 0], [0]],
        ///*[obj2]*/ [4, 89, 47, 0, 0, [1, 0, 0, 0, 0, 32, 32, -1], [0]],
        /*[obj2]*/ [8, 75, 40, 0, 0, [0, 0, 32, 32, 2, 2, 1, 0], [0]],
        ///*[obj2]*/ [8, 86, 47, 0, 0, [0, 0, 32, 32, 2, 1, -1, -1], [0]],
        ///*[obj3]*/ [7, 63, 30, 0, 0, [0, 700, 300, 0, 0, 0, 0, 0], [0]],
        ///*[obj3]*/ [7, 0, 25, 0, 0, [0, 900, 500, 2, 0, 0, 0, 0], [0]],
        ///*[obj3]*/ [9, 117, 25, 0, 0, [1, 900, 500, 1, 0, 3, 0, 0], [0]],
        /*[obj1]*/ [1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0]],
            [1, 2, 2, 0, 1, [7, 0, 0, 0, 0, 0, 0, 0], [0]]
            ]
        ],
    [
        [1,0],
        [
            [1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0]]
            ]
        ],
    [ //Each Cell
        [-1,0], //Cell Coordinates
        [
            [1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0]]
            ]
        ],
    [ //Each Cell
        [0,1], //Cell Coordinates
        [
            [1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0]]
            ]
        ],
    [ //Each Cell
        [0,-1], //Cell Coordinates
        [
            [1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0]]
            ]
        ],
    [ //Each Cell
        [0,2], //Cell Coordinates
        [
            [1, 2, 2, 2, 0, [6, 0, 0, 1, 0, 0, 0, 0], [0]]
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
        /*[obj2]*/ [4, 100, 47, 0, 0, [2, 0, 0, 0, 0, 32, 32, 0], [0]],
        /*[obj2]*/ [1, 163, 85, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj4]*/ [1, 5, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj6]*/ [1, 25, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj7]*/ [1, 47, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj9]*/ [1, 83, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj10]*/ [1, 99, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj12]*/ [1, 137, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj13]*/ [1, 155, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj14]*/ [1, 71, 33, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj15]*/ [1, 103, 33, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]]
            ]
        ],
    [
        [1,0],
        [
        /*[obj2]*/ [1, 163, 85, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj4]*/ [1, 5, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj6]*/ [1, 25, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj7]*/ [1, 47, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj8]*/ [1, 65, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj9]*/ [1, 83, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj10]*/ [1, 99, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj11]*/ [1, 119, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj12]*/ [1, 137, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj13]*/ [1, 155, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]]
            ]
        ],
    [ //Each Cell
        [-1,0], //Cell Coordinates
        [
        /*[obj2]*/ [1, 163, 85, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj4]*/ [1, 5, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj6]*/ [1, 25, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj7]*/ [1, 47, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj8]*/ [1, 65, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj9]*/ [1, 83, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj10]*/ [1, 99, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj11]*/ [1, 119, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj12]*/ [1, 137, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj13]*/ [1, 155, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]]
            ]
        ],
    [ //Each Cell
        [0,1], //Cell Coordinates
        [
        ///*[obj1]*/ [6, 80, 36, 0, 0, [0, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj2]*/ [1, 163, 85, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj4]*/ [1, 5, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj6]*/ [1, 25, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj7]*/ [1, 47, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj8]*/ [1, 65, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj9]*/ [1, 83, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj10]*/ [1, 99, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj11]*/ [1, 119, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj12]*/ [1, 137, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj13]*/ [1, 155, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]]
            ]
        ],
    [ //Each Cell
        [0,2], //Cell Coordinates
        [
        ///*[obj1]*/ [6, 80, 36, 0, 0, [0, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj2]*/ [1, 163, 85, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj4]*/ [1, 5, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj6]*/ [1, 25, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj7]*/ [1, 47, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj8]*/ [1, 65, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj9]*/ [1, 83, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj10]*/ [1, 99, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj11]*/ [1, 119, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj12]*/ [1, 137, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]],
        /*[obj13]*/ [1, 155, 49, 2, 0, [2, 0, 0, 0, 0, 0, 0, 0], [0]]
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