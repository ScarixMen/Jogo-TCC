if instance_exists(obj_Dialog)
{
	
	global.dialog = true;
	
}

if keyboard_check(ord("R"))
{
	audio_stop_all()
	room_restart();	
	
}
