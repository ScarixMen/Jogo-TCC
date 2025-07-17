if !start && npc_name != ""
{
    script_execute(scr_dialog);
    start = true;
}

script_execute(Input_Dialog)


//CHANGE PAGES OF DIALOG
if skip
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
if(global.dialog == false)
{
	instance_destroy();	
}