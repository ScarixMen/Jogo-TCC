function Button_Temple_Waiting_2()
{
	
	 timer --;
		if timer <= 0
		{
			global.cam_override = false
			state = Button_Temple_Idle_2
		}
	
}

function Button_Temple_Idle_2()
{
	timer = 120
    sprite_index = spr_Button_Blue_Idle;
    image_speed = 1;

    // se a caixa pisa no botão
    if (place_meeting(x, y-1, obj_Box))
    {
        image_index = 0;
        state = Button_Temple_Press_2;
    }

}
function Button_Temple_Press_2()
{
    sprite_index = spr_Button_Blue_Press;
    image_speed = 1;

	audio_stop_sound(sfx_Push_Box)
	global.cam_override = true
	global.focus_target = obj_Piston_2
    // animação do botão
    if (image_index >= image_number - 1)
    {
        image_index = image_number - 1;
		with (obj_Piston_2)
		{
		    v_dir *= -1;
		}
	
		state = Button_Temple_Pressed_2;
    }
}
function Button_Temple_Pressed_2()
{
	 timer --;
		if timer <= 0
		{
			global.cam_override = false
		}
    sprite_index = spr_Button_Blue_Press;
    image_speed = 0;
    image_index = image_number - 1;

    // se a caixa sair → reset
    if (!place_meeting(x, y-1, obj_Box))
    {
        state = Button_Temple_Reset_2;
		timer = 120
    }
}
function Button_Temple_Reset_2()
{
    sprite_index = spr_Button_Blue_Reset;
    image_speed = 1;
	
	audio_stop_sound(sfx_Push_Box)
	global.cam_override = true
	global.focus_target = obj_Piston_2
	
    if (image_index >= image_number - 1)
    {
		with (obj_Piston_2)
		{
		    v_dir *= -1;
		}

        image_index = image_number - 1;
        state = Button_Temple_Waiting_2;
		timer = 120
    }
}
