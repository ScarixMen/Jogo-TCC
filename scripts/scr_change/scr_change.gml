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
	
			obj_Apolo.jspd = obj_Player.jspd;
			obj_Apolo.spd = obj_Player.spd;
			obj_Luana.spd = 0;
			obj_Luana.jspd = 0;
		
			break;
		
			case 1:
		
			obj_Luana.jspd = obj_Player.jspd;
			obj_Luana.spd = obj_Player.spd;
			obj_Apolo.spd = 0;
			obj_Apolo.jspd = 0;
		
			break;

	}

}
