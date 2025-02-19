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
	
			obj_man.jspd = -13;
			obj_man.spd = 3;
			obj_woman.spd = 0;
			obj_woman.jspd = 0;
		
			break;
		
			case 1:
		
			obj_woman.jspd = -13;
			obj_woman.spd = 3;
			obj_man.spd = 0;
			obj_man.jspd = 0;
		
			break;

	}

}
