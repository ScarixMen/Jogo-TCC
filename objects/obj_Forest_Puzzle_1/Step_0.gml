script_execute(state)

if(!global.cam_override) Input_Apollo()

if (!input)
{
	if(place_meeting(x,y,obj_Apollo) and interact_Apollo)
	{
		
		input = true
		obj_Hud_BookMark.draw = true;
		obj_Hud_BookMark.spd = 0.2
		obj_Hud_BookMark.limit = 9
		obj_Apollo.state = Apollo_State_Book;

	}
}