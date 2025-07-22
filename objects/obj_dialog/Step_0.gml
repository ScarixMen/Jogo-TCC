if (Check_Pause()) exit;

if !start && npc_name != ""
{
    script_execute(scr_dialog);
    start = true;
}

script_execute(Input_Player)


//CHANGE PAGES OF DIALOG
if global.skip
{
	
	if page < array_length(text) -1
	{
		
		page++;	
		
	}
	else
	{
		
		if(npc_name == "Niobio_Statue")
		{
			
			obj_Niobio.state = Niobio_State_Uncross
			
		}
		
		if(npc_name == "Niobio_Idle_1")
		{
			
			obj_Niobio.image_index = 0
			obj_Niobio.state = Niobio_State_Jump
			
		}
		
		global.dialog = false;
		instance_destroy();	
		
	}
	
}
if(global.dialog == false)
{
	instance_destroy();	
}