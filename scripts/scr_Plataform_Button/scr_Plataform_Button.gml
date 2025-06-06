function Plataform_Button_Appear(){
	
	with(plataform){
		
		sprite_index = spr_Plataform_Appear
		if(image_index >= image_number -1)
		{
		
			image_index = 21
		
		}
	}
		
	if(!place_meeting(x,y-1,obj_Player))
	{

		state = Plataform_Button_Disappear
	
	}
	
}

function Plataform_Button_Disappear(){
	

	with(plataform)
	{
	
		sprite_index = spr_Plataform_Disappear
		if(image_index >= image_number -1)
		{
			with(i)
			{
				state = Plataform_Button_Idle
			}
	
		}
	}


}

function Plataform_Button_Idle(){
	
	with(plataform)
	{
	
		sprite_index = spr_Plataform_Portrait
	}
	
		if(place_meeting(x,y-1,obj_Player))
		{
	
			state = Plataform_Button_Appear
	
		}
	
}
