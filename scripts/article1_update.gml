//article1_update, Simple Platform

if _init == 0 {
    sprite_index = sprite_get("article1_"+string(spawn_variables[0]));
    anim_speed = spawn_variables[1]*.01;
    marker[0] = spawn_variables[2];
    marker[1] = spawn_variables[3];
    wait_time_max = spawn_variables[4];
    spe = spawn_variables[5];
    current_marker = 0;
    wait_time = wait_time_max;
    //print_debug(string(spawn_variables));
    _init = 1;
} else {
    //print_debug(string(marker[current_marker]));
    if wait_time > 0 {
        wait_time--;
        hsp = 0;
        vsp = 0;
    }
    if wait_time == 0 && marker[current_marker] != 0 move_to(current_marker,spe);
    
    frame_update();
    
    image_index = (image_index + anim_speed) % image_number;
}
#define move_to(mark, spee)
//if mark >= array_length_1d(marker) mark = 0;
var xx = get_marker_x(marker[mark]);
var yy = get_marker_y(marker[mark]);
var direc = point_direction(0,0,xx-x,yy-y);
hsp = spee*dcos(direc);
vsp = -spee*dsin(direc);

if abs(xx - x) < range[0] && abs(yy - y) < range[1] next_mark();


#define next_mark()

wait_time = wait_time_max;
current_marker = (current_marker + 1) % array_length_1d(marker);


#define frame_update()

//clamp speeds
//hsp = clamp(hsp, -max_speed[0],max_speed[0]);
//vsp = clamp(vsp, -max_speed[1],max_speed[1]);
