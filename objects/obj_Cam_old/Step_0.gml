if(obj_Apolo.x>obj_Luana.x)
{
	
	target_ = obj_Apolo
	not_target = obj_Luana
	
}
else
{

	target_ = obj_Luana
	not_target = obj_Apolo
}

if (target_ != noone)
{
	xTo = target_.x
	yTo = target_.y
}


	if(x<640 and target_.x < 640) 
	{
	
		x = 640
		camera_set_view_pos(view_camera[0], x-(width_/2), y-(heigth_/1.2));
	}
	else if (target_.x >= 640 or x > 640)
	{
	
		if (distance_to_object(not_target)<560)
		{
			x += (xTo - x)/60;
		}
		else if(distance_to_object(not_target)<520)
		{
			
				x += (xTo - x)/15
		}
		camera_set_view_pos(view_camera[0], x-(width_/2), y-(heigth_/1.2));
		
	}
	if (target_.x >= 1800 and not_target.x>= 1800)
	{
		
			y += (1850 - y)/100
			y += (yTo - y)/100
			x += (2600 - x)/60
			
		
	}
	

		//y += (yTo - y)/100

