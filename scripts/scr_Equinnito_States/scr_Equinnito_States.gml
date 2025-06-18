function Equinnito_State_Idle(){
	
	sprite_index = spr_Equinnito_Idle
	
	if !place_meeting(x,y,obj_Player)
	{
		
		alarm [0] = 40
		
	}

}

function Equinnito_State_Attack(){
	
	sprite_index = spr_Equinnito_Attack
	
	if(image_index >= image_number -1)
	{
		
		sprite_index = spr_Equinnito_Reset
		image_index = 0
		state = Equinnito_State_Reset
		
	}
}
function Equinnito_State_Reset(){
	
	sprite_index = spr_Equinnito_Reset
	
	if(image_index >= image_number -1)
	{
		
		state = Equinnito_State_Idle
		
	}
}