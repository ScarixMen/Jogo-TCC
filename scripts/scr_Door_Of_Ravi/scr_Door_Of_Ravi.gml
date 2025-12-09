function Door_Of_Ravi_State_Idle(){

	instance_deactivate_object(obj_End_Room)

	sprite_index = spr_Door_Of_Ravi_Idle

	if(!instance_exists(obj_Passage) and !instance_exists(obj_Passage_2))
	{
		
		state =  Door_Of_Ravi_State_Opening
		
	}
}

function Door_Of_Ravi_State_Opening()
{

	sprite_index = spr_Door_Of_Ravi	
	global.cam_override = true
	global.focus_target = obj_Door_Of_Ravi
	
	if(image_index >= image_number -1)
	{
		
		state =  Door_Of_Ravi_State_Open
		
	}
	
}
function Door_Of_Ravi_State_Open()
{
	
	instance_activate_object(obj_End_Room)
	global.cam_override = false
	global.focus_target = noone
	
	sprite_index = spr_Door_Of_Ravi_Open
	
}
