script_execute(state)

if(!global.cam_override) Input_Apollo()

if (!input)
{
	if(place_meeting(x,y,obj_Apollo) and interact_Apollo)
	{
		
		input = true
		obj_Hud_BookMark_Forest.draw = true;
		obj_Hud_BookMark_Forest.spd = 0.2
		obj_Hud_BookMark_Forest.limit = 9
		obj_Apollo.state = Apollo_State_Book;

	}
}