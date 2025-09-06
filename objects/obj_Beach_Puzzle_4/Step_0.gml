script_execute(state)

if(!global.cam_override) Input_Apollo()

if (!input and obj_Hud_BookMark.limit == 3)
{
	if(place_meeting(x,y,obj_Apollo) and interact_Apollo)
	{
		input = true
		obj_Hud_BookMark.spd = 0.1
		obj_Hud_BookMark.limit = 1
		obj_Apollo.state = Apollo_State_Book;

	}
}