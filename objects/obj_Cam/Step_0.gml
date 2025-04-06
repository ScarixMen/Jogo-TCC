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

	if(x<960 and target_.x < 960) 
	{
	
		x = 960
	}
	else if (target_.x >= 960 or x>960)
	{
		
		if (distance_to_object(not_target)<900)
		{
			x += (xTo - x)/100
		}
		/*else if(distance_to_object(not_target)<760)
		{
			
			x += (xTo - x)/20
			
		}*/
		else if(distance_to_object(not_target)<880)
		{
			
			x += (xTo - x)/15
			
		}
	}
	
	

	y += (yTo - y )/20
		

camera_set_view_pos(view_camera[0], x-(width_/2), y-(heigth_/2));