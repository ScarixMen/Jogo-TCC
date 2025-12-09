//if (Check_Pause()) exit;

if !start && npc_name != ""
{
    script_execute(scr_dialog);
    start = true;
}

//CHANGE PAGES OF DIALOG
if global.skip
{
    global.skip = false; // consome o "pulso" para não repetir

    if (page < array_length(text) - 1)
    {	
		global.som.tocarSFX(sfx_Menu_Pass)
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