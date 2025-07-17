#region COLISION

	if (place_meeting(x + sign(hspd), y + 1, obj_Ramp) || place_meeting(x + sign(hspd), y + 12, obj_Ramp)) {
	    if (place_meeting(x + sign(hspd), y, obj_Ramp)) {
	        if (!place_meeting(x + sign(hspd), y - 2, obj_Block)) {
	            y -= 4;
	        }
	    }
	
		else {
	        if(!place_meeting(x+sign(hspd),y+1, obj_Block)){
				if(!place_meeting(x+sign(hspd),y+2, obj_Block)){
					y += 4;
				}
			}
		}
	}
//colisão horizontal
if place_meeting(x+hspd,y,obj_Block)
{
    while !place_meeting(x+sign(hspd),y,obj_Block)
    {
        x+=sign(hspd);
    }
    hspd = 0;
}

x+=hspd

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

//OBS: ESSA COLISÃO INCLUI AS PLATAFORMAS, POIS ELAS SÃO FILHAS DO "obj_Block".

#endregion
	
vspd = vspd + grv