//article9_update, Checkpoint

if !_init {
    trigger_shape = spawn_variables[0];
    trigger_w = spawn_variables[1];
    trigger_h = spawn_variables[2];
    checkpoint_id = spawn_variables[3];
    stock_type = spawn_variables[4];
    stock_limit = spawn_variables[5];

}
state_timer++;

if state == 0 { //Normal Operations
    switch trigger_shape {
        case 0:
            collis_obj = collision_rectangle(x-trigger_w/2,y-trigger_h/2,x+trigger_w,y+trigger_h,oPlayer,false,true);
            break;
        case 1:
            collis_obj = collision_circle(x,y,trigger_w,oPlayer,true,true);
            break;
        case 2:
            collis_obj  = instance_place(x,y,oPlayer);
            break;
    }
    if collis_obj != noone  with collis_obj respawn_point = [[other.init_pos[0]+other.trigger_w/2,other.init_pos[1]+other.trigger_h/2],other.cell_pos];
}