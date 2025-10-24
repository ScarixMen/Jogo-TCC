function Floor_Lumini_Active(){
	
	mask_index = spr_Floor_Lumini_Deactive
	
	if(!global.cam_override)script_execute(Input_Luana)
	image_speed = 0
	
	if point_distance(x,y,obj_Luana.x,obj_Luana.y) < 400
	{
		if(interact_Luana)
		{
			sprite_index = spr_Floor_Lumini_Deactive
			image_index = 0
			id.state = Floor_Lumini_Deactive
			
		}
	}
}
function Floor_Lumini_Deactive(){
	
	
	timer++;
	image_speed = 1
	if(image_index >= image_number -1)
	{
		mask_index = spr_Noone
		image_speed = 0
		
	}
	if (timer >= timer_delay)
	{
		sprite_index = spr_Floor_Lumini_Active
		image_index = 0
		state = Floor_Lumini_Reset
	
	}
}
function Floor_Lumini_Reset(){
	
	timer = 0
	
	image_speed = 1
	if(image_index >= image_number -1)
	{
		state = Floor_Lumini_Active
		
		image_speed = 0
		
	}
}
	