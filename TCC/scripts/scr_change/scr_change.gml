function scr_change()
{
	
	var on = keyboard_check_pressed(ord("F"));

		if on
	{
	
	 global.on = !global.on;
   
	}
	switch global.on
	{
		case 0:
	
			obj_Man.jspd = obj_Player.jspd;
			obj_Man.spd = obj_Player.spd;
			obj_Woman.spd = 0;
			obj_Woman.jspd = 0;
		
			break;
		
			case 1:
		
			obj_Woman.jspd = obj_Player.jspd;
			obj_Woman.spd = obj_Player.spd;
			obj_Man.spd = 0;
			obj_Man.jspd = 0;
		
			break;

	}

}
