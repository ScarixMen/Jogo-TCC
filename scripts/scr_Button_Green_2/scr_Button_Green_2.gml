function Button_Green_Idle_2(){
	
	sprite_index = spr_Button_Green_Idle
	
	if place_meeting(x,y-1,obj_Player)
	{
		image_index = 0
		state = Button_Green_Pressed_2
		
	}
	
}

function Button_Green_Pressed_2(){

	
	sprite_index = spr_Button_Green_Press
	
	
	if(image_index >= image_number -1)
	{
	
		image_index = 8
	
	}
	
	obj_Plataform_Vertical_2.v_dir = 1
	
	if !place_meeting(x,y-1,obj_Player)
	{
		
		sprite_index = spr_Button_Green_Reset
		image_index = 0
		
		state = Button_Green_Reset_2
		
		
	}
	
	
}

function Button_Green_Reset_2(){
	
	
	sprite_index = spr_Button_Green_Reset
	
	if(image_index >= image_number -1)
		{
			
			state = Button_Green_Idle_2;
		
		}
	
	
}