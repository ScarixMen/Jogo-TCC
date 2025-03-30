if (distance_to_object(obj_Player) <= 15)
{
	
	if keyboard_check_pressed(ord("E"))
	{
		
		image_index =! image_index
		
		obj_Plataform_Vertical.spd = 1;
		obj_Plataform_Vertical.v_dir *= -1
		
	}
}