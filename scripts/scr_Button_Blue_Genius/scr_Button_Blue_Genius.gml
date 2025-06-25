function Button_Genius_Idle(){
	
	sprite_index = spr_Button_Blue_Idle
	
	with(obj_Plataform_Genius_Short){
		
		sprite_index = spr_Plataform2
		
	}
	
	with(obj_Plataform_Genius){
		
		sprite_index = spr_Plataform_Genius
		
	}
	
	if place_meeting(x,y-1,obj_Box)
	{
		image_index = 0
		state = Button_Genius_Press
		
	}
	
}
function Button_Genius_Press(){

	sprite_index = spr_Button_Blue_Press
	
	if(image_index >= image_number -1)
	{
	
		image_index = 7
	
	}
	
	with(obj_Plataform_Genius_Short)
	{
		sprite_index = spr_Plataform_Disappear
		
		if(image_index >= image_number -1)
		{
			
			image_index = 5
			
		}
	}
	with(obj_Plataform_Genius)
	{
		sprite_index = spr_Plataform_Genius_Disappear
		
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
	
	image_index = 7
	
	
	with(obj_Plataform_Genius_Short)
	{
		
		sprite_index = spr_Plataform_Portrait
		
	}
	
	with(obj_Plataform_Genius)
	{
		
		sprite_index = spr_Plataform_Genius_Portrait
		
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
	
	with(obj_Plataform_Genius_Short){
		sprite_index = spr_Plataform_Appear
		if(image_index >= image_number -1)
		{
		
			image_index = 19
		
		}
	}
	
	with(obj_Plataform_Genius){
		sprite_index = spr_Plataform_Genius_Appear
		if(image_index >= image_number -1)
		{
		
			image_index = 24
			with(obj_Button_Blue_Genius)
			{
				state = Button_Genius_Idle;
			}
		}
	}
	
	if(image_index >= image_number -1)
		{
			
			image_index = 7
		
		}
}