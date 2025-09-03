if(place_meeting(x,y,obj_Player))
{
	global.check_X = x
	global.check_Y = y
	
	instance_destroy(id);
	
	global.save = true;
}