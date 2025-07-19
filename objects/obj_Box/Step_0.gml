if (Check_Pause()) exit;

//Colisão vertical
if place_meeting(x,y+vspd,obj_Block)
{
    while !place_meeting(x,y+sign(vspd),obj_Block)
    {
        y+=sign(vspd);
    }
    vspd = 0;
}

y+=vspd;

vspd = vspd + grv

if (vspd > grv){
	if (place_meeting(x, y + vspd, obj_Apollo)) {
	        with (instance_place(x, y + vspd, obj_Apollo)) {
	             damage_Apollo();
	        }
	    }


	if (place_meeting(x, y + vspd, obj_Luana)) {
	        with (instance_place(x, y + vspd, obj_Luana)) {
	             damage_Luana();
	        }
	    }
}