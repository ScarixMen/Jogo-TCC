if mode == "fade_out"
{
	
	alpha += fade_speed
	if alpha >= 1
	{
		
		alpha = 1
		room_goto(target_room)
		mode = "fade_in"
		
	}
	
}else if mode == "fade_in"
{
	
	alpha -= fade_speed
	if alpha <= 0
	{
		
		instance_destroy();
			
	}
	
	
}