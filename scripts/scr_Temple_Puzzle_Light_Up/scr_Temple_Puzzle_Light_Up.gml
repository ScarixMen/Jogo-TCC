function Temple_Puzzle_State_Idle() {
    
    sprite_index = Idle;
    image_speed = 0.2; // caso queira animação mínima no idle

    if (distance_to_object(obj_Player) < 310)
    {
        image_index = 0;
        image_speed = 1;
        state = Temple_Puzzle_State_Light_Up;
    }
}
function Temple_Puzzle_State_Light_Up() {
    
    sprite_index = Light_Up;
    image_speed = 1;

    // Travar no frame final
    if (image_index >= image_number - 1)
    {
        image_index = image_number - 1;
        image_speed = 0;
    }

    // Player se afastou → desliga
    if (distance_to_object(obj_Player) > 310)
    {
        image_speed = 1;
        sprite_index = Turn_Off;
        image_index = 0;
        state = Temple_Puzzle_State_Turn_Off;
    }
}
function Temple_Puzzle_State_Turn_Off() {

    sprite_index = Turn_Off;
    image_speed = 1;

    // Quando terminar a animação, volta ao Idle
    if (image_index >= image_number - 1)
    {
        image_speed = 0;
        image_index = 0;
        state = Temple_Puzzle_State_Idle;
    }
}
