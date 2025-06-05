if(!place_meeting(x,y-1,obj_Player))
{

	with(obj_Plataform_One_Five){
		image_index = 0
	}
	instance_deactivate_object(obj_Plataform_One_Five)

}
else
{

	with(obj_Plataform_One_Five){
		
		sprite_index = spr_Plataform_Appear
		if(image_index >= image_number -1)
		{
	
		image_index = 21
	
		}
	}
	instance_activate_object(obj_Plataform_One_Five)

}
