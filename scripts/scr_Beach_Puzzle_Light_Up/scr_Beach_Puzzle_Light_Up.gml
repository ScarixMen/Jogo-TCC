function Beach_Puzzle_State_Idle(){
	
	sprite_index = Idle
	
	if (distance_to_object(obj_Player) < 310)
	{
		
		state = Beach_Puzzle_State_Light_Up
		
	}
	
}
function Beach_Puzzle_State_Light_Up(){
	
	sprite_index = Light_Up
	
	if(image_index >= image_number -1)
	{
		
		image_speed = 0
		
	}
	
	
	if (distance_to_object(obj_Player) > 310)
	{
		image_speed = 1
		sprite_index = Turn_Off
		image_index = 0
		state = Beach_Puzzle_State_Turn_Off
	
	}
	
}
function Beach_Puzzle_State_Turn_Off(){
	
	
	if(image_index >= image_number -1)
	{
		
		state = Beach_Puzzle_State_Idle
		
	}
	
}