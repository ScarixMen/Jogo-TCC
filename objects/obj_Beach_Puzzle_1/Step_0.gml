script_execute(state)

if(!global.cam_override) Input_Apollo()

if (!input)
{
	if(place_meeting(x,y,obj_Apollo) and interact_Apollo)
	{
		
		input = true
		obj_Hud_BookMark_Beach.draw = true;
		obj_Hud_BookMark_Beach.spd = 0.2
		obj_Hud_BookMark_Beach.limit = 9
		obj_Apollo.state = Apollo_State_Book;

	}
}

if(keyboard_check_pressed(ord("T")))
{
	
	obj_Hud_BookMark_Beach.limit = 3
	obj_Luana.x	= 19988
	obj_Luana.y	= 2365
	obj_Apollo.x = 19968
	obj_Apollo.y = 2368

	
}