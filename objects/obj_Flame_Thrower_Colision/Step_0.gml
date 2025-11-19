if place_meeting(x,y,obj_Apollo)
{
	with obj_Apollo{
		if state != Apollo_State_Death_Boca
		{
			image_index = 0
			damage_Apollo()
		
		}
	}
}

if place_meeting(x,y,obj_Luana)
{
	with obj_Luana{
		if state != Luana_State_Death_Boca
		{
			image_index = 0
			damage_Luana()
		
		}
	}
}