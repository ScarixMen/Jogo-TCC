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
		
		x += (xTo - x)/15
		
	}
	
	

	y += (yTo - y )/20
		

camera_set_view_pos(view_camera[0], x-(width_/2), y-(heigth_/1.4));
