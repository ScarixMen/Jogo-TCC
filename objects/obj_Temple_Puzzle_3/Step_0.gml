script_execute(state)

if(!global.cam_override) Input_Apollo()

if (!input)
{
	if(place_meeting(x,y,obj_Apollo) and interact_Apollo)
	{
		
		input = true
		obj_Hud_BookMark_Temple.draw = true;
		obj_Hud_BookMark_Temple.spd = 0.2
		obj_Hud_BookMark_Temple.limit = 5
		obj_Apollo.state = Apollo_State_Book;

	}
}