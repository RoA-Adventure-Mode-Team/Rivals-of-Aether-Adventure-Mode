//article2_init, Obj Triggers

enum SI {
    SPAWN,
    IDLE,
    ACTIVE,
    DESTROY
};

sprite_index = asset_get("empty_sprite");

sprite_list = array_create(5);

_init = 0;
state = 0;
state_old = 0;
state_timer = 0;

anim_speed  = [.1,.1,.3];
anim_type = 0;
window = 0;

trigger_shape = 0;
trigger_var = noone;
trigger_objects = [pHitBox];
//trigger_player = [all];
collis_obj = noone;
destroy_on_trigger = true;
destroy_effect = asset_get("sfx_ice_shatter_big");


switch spawn_variables[0] { //Determines sprite set used
    case 0:
    sprite_list[SI.SPAWN] = sprite_get("target_spawn");
    sprite_list[SI.IDLE] = sprite_get("target_idle");
    sprite_list[SI.ACTIVE] = sprite_get("target_break");
    sprite_list[SI.DESTROY] = sprite_get("target_break");
}