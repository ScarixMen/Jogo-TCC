if start == false
{
		
	scr_dialog();
	start = true;
	
}


//CHANGE PAGES OF DIALOG
if mouse_check_button_pressed(mb_left)
{
	
	if page < array_length(text) -1
	{
		
		page++;	
		
	}
	else
	{
		
		global.dialog = false;
		instance_destroy();	
		
	}
	
}