if (distance_to_object(obj_Player) <= 15)
{
		
	image_index = 1
		
	obj_Plataform_Vertical.v_dir = 1
		
}else
{

	obj_Plataform_Vertical.v_dir = -1
	image_index = 0
}