function Plataform_Button_Appear(){
	
	sprite_index = spr_plataform_Apollo
	
	if(image_index >= image_number -1)
	{
		
		image_index = 10
		
	}
	
	
	
	with(plataform){
		
		sprite_index = spr_Plataform_Appear
		if(image_index >= image_number -1)
		{
		
			image_index = 21
		
		}
	}
		
	if(!place_meeting(x,y-1,obj_Player))
	{
		sprite_index = spr_plataform_Apollo_Reset
		image_index = 0
		state = Plataform_Button_Disappear
	
	}
	
}

function Plataform_Button_Disappear(){
	
	sprite_index = spr_plataform_Apollo_Reset
	
	
	if(image_index >= image_number -1)
	{
		
		image_index = 10
		
	}
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
	
	image_index = 0
	sprite_index = spr_plataform_Apollo
	
	with(plataform)
	{
	
		sprite_index = spr_Plataform_Portrait
	}
	
		if(place_meeting(x,y-1,obj_Player))
		{
	
			state = Plataform_Button_Appear
	
		}
	
}
