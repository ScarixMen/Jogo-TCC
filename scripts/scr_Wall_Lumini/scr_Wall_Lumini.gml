function Wall_Lumini_Active(){
	
	if(!global.cam_override)script_execute(Input_Luana)
	image_speed = 0
	
	if point_distance(x,y,obj_Luana.x,obj_Luana.y) < 600
	{
	
	if(interact_Luana)
	{
		global.som.tocarSFX(sfx_Lumini_Wall)
		id.state = Wall_Lumini_Deactive
			
	}
	
}
	
}
function Wall_Lumini_Deactive(){
	
	image_speed = 1
	if(image_index >= image_number -1)
	{
		mask_index = spr_Noone
		image_speed = 0
		
	}

}
	