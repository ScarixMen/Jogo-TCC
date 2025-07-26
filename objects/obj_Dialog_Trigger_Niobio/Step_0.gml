if !activated && place_meeting(x, y, obj_Apollo) and !global.dialog
{
	
	var cutscene = instance_create_layer(0, 0, "Instances", obj_CutsceneManager);

	global.cam_override = true
	global.focus_target = obj_Apollo
	activated = true
	
}
