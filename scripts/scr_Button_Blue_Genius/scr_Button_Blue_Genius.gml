function Button_Genius_Idle(){
	
	sprite_index = spr_Button_Blue_Idle
	
	with(obj_Plataform_Genius){
		
		sprite_index = spr_Plataform2
		
	}
	
	if place_meeting(x,y-1,obj_Box)
	{
		image_index = 0
		state = Button_Genius_Press
		
	}
	
}
function Button_Genius_Press(){

	
	sprite_index = spr_Button_Blue_Press
	
	with(obj_Plataform_Genius)
	{
		sprite_index = spr_Plataform_Disappear
		
		if(image_index >= image_number -1)
		{
			with(obj_Button_Blue_Genius)
			{
				
				state = Button_Genius_Pressed
				
			}
		}
	}
	
	
}
	
function Button_Genius_Pressed(){
	
	if(image_index >= image_number -1)
	{
	
		image_index = 7
	
	}
	
	with(obj_Plataform_Genius)
	{
		
		sprite_index = spr_Plataform_Portrait
		
	}
	
	if !place_meeting(x,y-1,obj_Box)
	{
		
		sprite_index = spr_Button_Blue_Reset
		image_index = 0
		
		state = Button_Genius_Reset
		
		
	}
	
	
}

function Button_Genius_Reset(){
	
	
	sprite_index = spr_Button_Blue_Reset
	
	with(obj_Plataform_Genius){
		sprite_index = spr_Plataform_Appear
		if(image_index >= image_number -1)
		{
		
			image_index = 21
		
		}
	}
	
	
	if(image_index >= image_number -1)
		{
			
			state = Button_Genius_Idle;
		
		}
	
	
}