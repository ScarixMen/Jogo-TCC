if instance_exists(obj_dialog)
{
	
	global.dialog = true;
	
}

script_execute(scr_change);


if keyboard_check(ord("R"))
{
	
	room_restart();	
	
}