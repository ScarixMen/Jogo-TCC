function Check_Pause(){

    if (global.pause) {
        image_speed = 0;
        return true;
    } else {
        image_speed = 1;
        return false;
    }

}