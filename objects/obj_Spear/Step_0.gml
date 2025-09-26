spd+= grv

y+=spd

if(place_meeting(x,y,obj_Apollo))
{
	with(obj_Apollo){
        if(state != Apollo_State_Death_Forest){
            image_index = 0;
            damage_Apollo_Forest();
        }
    }
}