//Custom Item behavior - DEPRACATED

enum EVT {
    GRAB,
    IDLE,
    USE
}

//Item Template

switch item_id {
    case 0:
        switch event_flag {
            case EVT.GRAB:
                break;
            case EVT.IDLE:
                break;
            case EVT.USE:
                break;
        }
        break;
}

