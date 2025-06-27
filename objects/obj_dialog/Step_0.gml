if !start && npc_name != ""
{
    script_execute(scr_dialog);
    start = true;
}



//CHANGE PAGES OF DIALOG
if keyboard_check_pressed(vk_enter)
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