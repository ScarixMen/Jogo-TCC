if (!start_dialog_done)
{
	instance_create_layer(0, 0, layer, obj_Cutscene_Manager);
	obj_Cutscene_Manager.current_cutscene = scr_Cutscene_Pass_Out;
	start_dialog_done = true;
}