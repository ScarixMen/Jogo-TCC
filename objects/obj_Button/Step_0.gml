if place_meeting(x,y,obj_Player)
{

	image_speed = 1
	
	if(image_index >= image_number -1)
	{
		image_speed = 0
		image_index = 8
		
	}
	
	obj_Plataform_Vertical.v_dir = 1
		
}else
{
	
	image_index = 0
	image_speed = 0
	
}