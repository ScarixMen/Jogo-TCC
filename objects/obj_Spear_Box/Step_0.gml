if(obj_Anhanga.state != Anhanga_State_Exhausted)
{
	image_alpha = 1
	
	var box = instance_nearest(x,y,obj_Box)
	
	if(point_distance(box.x,box.y,x,y)>300)
	{
	
	image_alpha = 0.2
	exit;
	
	}
	if(place_meeting(x,y,obj_Apollo))
	{
		with(obj_Apollo){
	        if(state != Apollo_State_Death_Forest_Anhanga){
	            image_index = 0;
	            damage_Apollo_Forest_Anhanga()
	        }
	    }
	}
	if(place_meeting(x,y,obj_Luana))
	{
		with(obj_Luana){
	        if(state != Luana_State_Death_Forest_Anhanga){
	            image_index = 0;
	            damage_Luana_Forest_Anhanga()
	        }
	    }
	}
}else
{

	image_alpha = 0.2
	
}