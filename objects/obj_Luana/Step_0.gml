if global.dialog
{
	image_speed = 0
	exit;	
	
}else{
image_speed = 1
}
if global.cam_override
{
	image_speed = 0
	exit;	
	
}else{
image_speed = 1
}
event_inherited();

script_execute(Input_luana)
script_execute(state)

