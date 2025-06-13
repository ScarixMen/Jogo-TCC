function Equinnito_State_Idle(){
	
	sprite_index = spr_Equinnito_Attack
	image_index = 0
	
	if(place_meeting(x,y,obj_Player))
	{
		
		state =  Equinnito_State_Attack
		
	}

}

function Equinnito_State_Attack(){
	
	sprite_index = spr_Equinnito_Attack
	
	if(image_index >= image_number -1)
	{
		
		state = Equinnito_State_Idle
		
	}
}