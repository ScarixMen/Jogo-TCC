if (distance_to_object(obj_Player) <= 15)
{
	
	if keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(global.gamepad_id, gp_face3)
	{
		
		image_index =! image_index
		
		obj_Plataform_Vertical.spd = 2;
		obj_Plataform_Vertical.v_dir *= -1
		
	}
}