//draw_debug_text(x,y,"HELLO, GORDON! "+string(timer))

//Action Particle Draws
for (var _i = 0; _i < array_length_1d(active_particles);_i++) {
    draw_sprite_ext(active_particles[_i].sprite_index,active_particles[_i].image_index,
    active_particles[_i].x,active_particles[_i].y,2,2,0,c_white,active_particles[_i].alpha);
    // print(active_particles[_i]);
}