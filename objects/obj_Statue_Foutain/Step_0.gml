if(place_meeting(x,y,obj_Player))
{
	if (!start_dialog_done)
	{
		instance_create_layer(0, 0, layer, obj_Cutscene_Manager);
		obj_Cutscene_Manager.current_cutscene = scr_Cutscene_Ravi;
		start_dialog_done = true;
	}
}