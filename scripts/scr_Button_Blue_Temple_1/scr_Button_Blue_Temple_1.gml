function Button_Temple_Idle()
{
    sprite_index = spr_Button_Blue_Idle;
    image_speed = 1;

    // se a caixa pisa no botão
    if (place_meeting(x, y-1, obj_Box))
    {
        image_index = 0;
        state = Button_Temple_Press;
    }

    // garante que a plataforma saiba que o botão não está pressionado
    with (obj_Plataform_Temple_Variable_1)
    {
        button_pressed = false;
    }
}
function Button_Temple_Press()
{
    sprite_index = spr_Button_Blue_Press;
    image_speed = 1;

    // plataforma sabe que o botão está pressionado
    with (obj_Plataform_Temple_Variable_1)
    {
        button_pressed = true;
    }

    // animação do botão
    if (image_index >= image_number - 1)
    {
        image_index = image_number - 1;
        state = Button_Temple_Pressed;
    }
}
function Button_Temple_Pressed()
{
    sprite_index = spr_Button_Blue_Press;
    image_speed = 0;
    image_index = image_number - 1;

    // se a caixa sair → reset
    if (!place_meeting(x, y-1, obj_Box))
    {
        state = Button_Temple_Reset;

        // plataforma começa a desaparecer se já apareceu
        with (obj_Plataform_Temple_Variable_1)
        {
            button_pressed = false;
            if (appear_finished)
                state = Plataform_Temple_Disappear;
        }
    }
}
function Button_Temple_Reset()
{
    sprite_index = spr_Button_Blue_Reset;
    image_speed = 1;

    if (image_index >= image_number - 1)
    {
        image_index = image_number - 1;
        state = Button_Temple_Idle;
    }
}
