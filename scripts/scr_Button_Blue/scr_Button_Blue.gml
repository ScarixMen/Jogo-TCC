function Button_Blue_Idle(){
	
	with obj_Bridge
	{
	
		image_index = 0
		
	}
	
	sprite_index = spr_Button_Blue_Idle
	
	if place_meeting(x,y-1,obj_Box)
	{
		image_index = 0
		state = Button_Blue_Pressed
		
	}
	
}

function Button_Blue_Pressed(){
	global.cam_override = true
	global.focus_target = instance_nearest(x,y,obj_Box)
	
	if(image_index >= image_number -1)
	{	
		
		 timer --;
		if timer <= 0
		{
		
			global.focus_target = instance_nearest(x,y,obj_Bridge)
			with obj_Bridge
			{
	
				sprite_index = spr_Bridge_Appear
		
				if(image_index >= image_number -1)
				{	
			
					image_index = 49
					global.cam_override = false
					instance_destroy(obj_Button_Blue);
			
				}
		}
		
		}
	}
	
	sprite_index = spr_Button_Blue_Press
	
	
	if(image_index >= image_number -1)
	{
		
		image_index = 7
	
	}
}