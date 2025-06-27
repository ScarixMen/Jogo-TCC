if (x < 0 or x > room_width or y < 0 or y > room_height) {
    instance_destroy();
}

if place_meeting(x,y,obj_Block)
{
	hspd = 0
	sprite_index = spr_Arrow_Broken
	if(image_index >= image_number -1)
	{
	
		
		instance_destroy();
	
	}
	
}
x -= hspd