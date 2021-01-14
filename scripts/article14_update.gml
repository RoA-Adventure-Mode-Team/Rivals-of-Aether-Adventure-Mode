//article14_update, Particles

if _init == 0 {
    spr_name = spawn_variables[0];
    spawn_time = spawn_variables[1];
    vfx_time = spawn_variables[2];
    anim_speed = spawn_variables[3];
    type = spawn_variables[4];
    vel = spawn_variables[5];
    alpha_ = spawn_variables[6];
    active_particles = [];
    debug = true;
    depth = -10;
    _init = 1;
} else {
    if alive_time % spawn_time == 0 && obj_stage_main.fps > 59 {
        var _p_obj = {
            x: x,
            y: y,
            sprite_index: spr_name,
            image_index: 0,
            image_number: sprite_get_number(spr_name),
            vfx_time: vfx_time,
            alive_time: 0,
            anim_speed: anim_speed,
            type: type,
            hsp: 0,
            vsp: 0,
            alpha: alpha_
        };
        switch _p_obj.type {
            case 0: //Vertical Random Fade
                _p_obj.hsp = random_func_2(array_length_1d(active_particles) % 200,floor(vel[0]*2),false)-vel[0];
                _p_obj.vsp = random_func_2(array_length_1d(active_particles)+1 % 200,floor(vel[1] + .3*vel[1]),false)-.15*vel[1];
                break;
            default: //Still
                break;
        }
        
        array_push(active_particles,_p_obj);
    }
    for (var _i = 0; _i < array_length_1d(active_particles);_i++) { //All active particles
        var _ap_i = active_particles[_i];
        switch _ap_i.type {
            case 0: //Vertical Random Fade
                _ap_i.vsp *= .98;
                _ap_i.hsp *= .98;
                break;
            default: //Still
                break;
        }
        _ap_i.y += _ap_i.vsp;
        _ap_i.x += _ap_i.hsp;
        _ap_i.image_index = _ap_i.image_number*(_ap_i.alive_time/_ap_i.vfx_time);
        _ap_i.alive_time++;
        if _ap_i.alive_time > _ap_i.vfx_time {
            active_particles = array_cut(active_particles,_i);
            _i--;
        }
    }
    print_debug(string(array_length_1d(active_particles)));
    alive_time++;
}
#define array_cut(_array, _index)
if array_length_1d(_array) == 1 || array_length_1d(_array) == 0 return [];
var _array_cut = array_create(array_length_1d(_array)-1);
var j = 0;
for (var i = 0; i < array_length_1d(_array); i++) {
	if i != _index {
		_array_cut[@j] = _array[i];
		j++;
	}
}
return _array_cut;