function Floor_Lumini_Active(){
	
	script_execute(Input_Luana)
	image_speed = 0
	
	if point_distance(x,y,obj_Luana.x,obj_Luana.y) < 400
	{
		if(interact_Luana)
		{
		
			id.state = Floor_Lumini_Deactive
			
		}
	}
}
function Floor_Lumini_Deactive(){
	
	image_speed = 1
	if(image_index >= image_number -1)
	{
		mask_index = spr_Noone
		image_speed = 0
		
	}
}
	