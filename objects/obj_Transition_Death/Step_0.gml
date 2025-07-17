if mode == "fade_out"
{
	
	alpha += fade_speed
	if alpha >= 1
	{
		
		alpha = 1
		mode = "fade_in"
		show_debug_message(alpha)
		
	}
	
}else if mode == "fade_in"
{
	
	alpha -= fade_speed
	if alpha <= 0
	{
	global.damage = false;
		instance_destroy();
			
	}
	
	
}