if (Check_Pause()) exit;
switch (wave_state)
{
    case "spawn":
        if (image_index >= image_number - 1)
        {
            sprite_index = spr_Attack_Wave_Run_Invert;
            wave_state = "run";
        }
        break;

    case "run":
        x -= wave_speed;
        if (x <= run_end_x)
        {
            wave_state = "reset";
            sprite_index = spr_Attack_Wave_Reset_Invert;
        }
        break;

    case "reset":
        if (image_index >= image_number - 1)
            instance_destroy();
        break;
}

if place_meeting(x,y,obj_Apollo)
{
	with obj_Apollo{
		if state != Apollo_State_Death_Ravi
		{
			image_index = 0
			damage_Apollo_Ravi()
		
		}
	}
}

if place_meeting(x,y,obj_Luana)
{
	with obj_Luana{
		if state != Luana_State_Death_Ravi
		{
			image_index = 0
			damage_Luana_Ravi()
		
		}
	}
}