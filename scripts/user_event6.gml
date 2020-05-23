//Custom AI Behavior. see article6 code for details.

//Enum Declarations, DO NOT EDIT
enum TR {
    NEAR,
    MID,
    FAR,
    RANDOM,
    LOW,
    HIGH
}
//

//Custom Code Here

enum EN {
    OU, //0
    BIR, //1
};

switch enem_id {
    case EN.OU:
        if !committed && attack_down next_attack = AT_JAB;
        //Custom State Stuff
        switch art_state {
            case PS_DOUBLE_JUMP:
                sprite_index = enemy_sprite_get(enem_id,"PS_FIRST_JUMP");
                break;
        }
        break;
}
//

//DO NOT EDIT BELLOW
#define enemy_sprite_get(_num,_sprite) //Get the sprite of this article
return sprite_get("enemy_"+string(_num)+"_"+string(_sprite));