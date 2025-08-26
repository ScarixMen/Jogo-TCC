// Colisão com Apollo
if(place_meeting(x, y, obj_Apollo)){
    with(obj_Apollo){
        if(state != Apollo_State_Death_Forest){
            image_index = 0;
            damage_Apollo_Forest();
        }
    }
}

// Colisão com Luana
if(place_meeting(x, y, obj_Luana)){
    with(obj_Luana){
        if(state != Luana_State_Death_Forest){
            image_index = 0;
            damage_Luana_Forest();
        }
    }
}
