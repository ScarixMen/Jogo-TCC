if place_meeting(x,y,obj_Player)
{
	
	instance_create_layer(0, 0, layer, obj_Transition_Room);
	
	switch(room)
	{
		case rm_Tutorial:
		
			obj_Transition_Room.target_room = rm_Beach
		break;
		
		case rm_Beach:
		
			obj_Transition_Room.target_room = rm_Forest
		break;
	}	
}