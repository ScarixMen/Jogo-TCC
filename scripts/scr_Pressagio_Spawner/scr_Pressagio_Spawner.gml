function Pressagio_Idle(){
	
	image_speed = 0
	image_index = 0
	if(obj_Luana.can_control)script_execute(Input_Luana)
	if(obj_Apollo.can_control)script_execute(Input_Apollo)
	
	
	if point_distance(x,y,obj_Apollo.x,obj_Apollo.y) < 700
	{
		if(interact_Apollo)
		{
			target = obj_Apollo
			id.state = Pressagio_Active
			
		}
	}
	if point_distance(x,y,obj_Luana.x,obj_Luana.y) < 700
	{
		if(interact_Luana)
		{
			target = obj_Luana
			id.state = Pressagio_Active
			
		}
	}
}
function Pressagio_Active(){
	
	image_speed = 1
	if(image_index >= image_number -1)
	{
		instance_create_layer(x,y,layer,obj_Pressagio)
		id.state = Pressagio_Idle
	}

}
	