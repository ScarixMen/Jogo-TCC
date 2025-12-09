if (Check_Pause()) exit;
timer--;

if (timer <= 0) {
    sprite_index = spr_Attack_Splash;
    image_speed  = 1;
}

if (sprite_index == spr_Attack_Splash && image_index >= image_number - 1) {
    instance_destroy();
}
for (var i = 0; i < array_length(global.splash_ocupado); i++)
{
    if (abs(global.splash_ocupado[i] - x) < 10)
    {
        array_delete(global.splash_ocupado, i, 1);
        break;
    }
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