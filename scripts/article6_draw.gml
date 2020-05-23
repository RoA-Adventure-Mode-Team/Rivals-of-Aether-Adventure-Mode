//draw stuff for enemy

if !_init exit; //Only draw stuff after initializing

if debug {
    draw_sprite_ext(collision_box,0,x,y,1,1,0,c_white,.6);
    draw_debug_text(x-128,y,string(attack_down));
    draw_debug_text(x-128,y+16,string(down_down));
    draw_debug_text(x-128,y-16,string(up_down));
    draw_debug_text(x-112,y,string(right_down));
    draw_debug_text(x-144,y,string(left_down));
    draw_debug_text(x-100,y,string(jump_down));
    draw_debug_text(x-100,y-32,string(shield_down));
    draw_debug_text(x,y-32,string(get_state_name(art_state)));
    //draw_debug_text(x-64,y+32,string(get_attack_name(attack)));
    draw_debug_text(x-64,y+32,string(kb_angle));
    draw_debug_text(x+32,y,string(window));
    draw_debug_text(x+32,y+32,string(window_timer));
    /*draw_debug_text(x+16,y+32,string(!(place_meeting(x,y+1,asset_get("solid_32_obj")) || 
                  place_meeting(x,y+1,asset_get("jumpthrough_32_obj")) || 
                  place_meeting(x,y+1,obj_stage_article_solid) ||
                  place_meeting(x,y+1,obj_stage_article_platform))));*/

}

draw_debug_text(x-10,y-(char_height*2)-20,string(percent)+"%");

draw_sprite_ext(char_arrow,0,x-10,y-char_height*2-6,1,1,0,c_white,1);


#define get_attack_name(_attack) //get the name of an attack

switch _attack {
    case AT_JAB:
        return "AT_JAB";
    case AT_DATTACK:
        return "AT_DATTACK";
    case AT_FTILT:
        return "AT_FTILT";
    case AT_DTILT:
        return "AT_DTILT";
    case AT_UTILT:
        return "AT_UTILT";
    case AT_NAIR:
        return "AT_NAIR";
    case AT_FAIR:
        return "AT_FAIR";
    case AT_UAIR:
        return "AT_UAIR";
    case AT_DAIR:
        return "AT_DAIR";
    case AT_BAIR:
        return "AT_BAIR";
    case AT_FSTRONG:
        return "AT_FSTRONG";
    case AT_USTRONG:
        return "AT_USTRONG";
    case AT_DSTRONG:
        return "AT_DSTRONG";
    case AT_DSPECIAL:
        return "AT_DSPECIAL";
    case AT_USPECIAL:
        return "AT_USPECIAL";
    case AT_FSPECIAL:
        return "AT_FSPECIAL";
    case AT_NSPECIAL:
        return "AT_FSPECIAL";
    case AT_DSPECIAL_AIR:
        return "AT_DSPECIAL_AIR";
    case AT_USPECIAL_GROUND:
        return "AT_USPECIAL_GROUND";
    case AT_FSPECIAL_AIR:
        return "AT_FSPECIAL_AIR";
    case AT_NSPECIAL_AIR:
        return "AT_FSPECIAL_AIR";
    case AT_TAUNT:
        return "AT_TAUNT";
    case AT_DTHROW:
        return "AT_DTHROW";
    case AT_FTHROW:
        return "AT_FTHROW";
    case AT_NTHROW:
        return "AT_NTHROW";
    case AT_UTHROW:
        return "AT_UTHROW";
    case AT_FSTRONG_2:
        return "AT_FSTRONG_2";
    case AT_USTRONG_2:
        return "AT_USTRONG_2";
    case AT_DSTRONG_2:
        return "AT_DSTRONG_2";
    case AT_TAUNT_2:
        return "AT_TAUNT_2";
    case AT_EXTRA_1:
        return "AT_EXTRA_1";
    case AT_EXTRA_2:
        return "AT_EXTRA_2";
    case AT_EXTRA_3:
        return "AT_EXTRA_3";
}