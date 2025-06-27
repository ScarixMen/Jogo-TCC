#region COLISION
if room == rm_Beach
{
	if x > 11800 and x < 12900
	{
		if(place_meeting(x+sign(hspd),y, obj_Ramp)){
			if(!place_meeting(x+sign(hspd),y-2, obj_Block)){

				y -=4 ;

			}
		}

		else{
	
			if(!place_meeting(x+sign(hspd),y+1, obj_Block)){
				if(!place_meeting(x+sign(hspd),y+2, obj_Block)){
			
			
					y+=4;
			
				}	
			}	
		}
	}
	
	if x > 9856 and x < 9984
	{
		if(place_meeting(x+sign(hspd),y, obj_Ramp)){
			if(!place_meeting(x+sign(hspd),y-2, obj_Block)){

				y -=4 ;

			}
		}

		else{
	
			if(!place_meeting(x+sign(hspd),y+1, obj_Block)){
				if(!place_meeting(x+sign(hspd),y+2, obj_Block)){
			
			
					y+=4;
			
				}	
			}	
		}
	}

	if x > 19264 and x < 20094
	{
		if(place_meeting(x+sign(hspd),y, obj_Ramp)){
			if(!place_meeting(x+sign(hspd),y-2, obj_Block)){

				y -=4 ;

			}
		}

		else{
	
			if(!place_meeting(x+sign(hspd),y+1, obj_Block)){
				if(!place_meeting(x+sign(hspd),y+2, obj_Block)){
			
			
					y+=4;
			
				}	
			}	
		}
	}
}

if x > 27584 and x < 28032
	{
		if(place_meeting(x+sign(hspd),y, obj_Ramp)){
			if(!place_meeting(x+sign(hspd),y-2, obj_Block)){

				y -=4 ;

			}
		}

		else{
	
			if(!place_meeting(x+sign(hspd),y+1, obj_Block)){
				if(!place_meeting(x+sign(hspd),y+2, obj_Block)){
			
			
					y+=4;
			
				}	
			}	
		}
	}

if room == rm_Tutorial
{
	if x > 3776 and x < 4480
	{
		if(place_meeting(x+sign(hspd),y, obj_Ramp)){
			if(!place_meeting(x+sign(hspd),y-2, obj_Block)){

				y -=4 ;

			}
		}

		else{
	
			if(!place_meeting(x+sign(hspd),y+1, obj_Block)){
				if(!place_meeting(x+sign(hspd),y+2, obj_Block)){
			
			
					y+=4;
			
				}	
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
#region DIALOG
		
		/*if place_meeting(x,y,obj_Par_Npc) and global.dialog == false
		{
			
			var npc	= instance_nearest(x,y,obj_Par_Npc);
			var dialog = instance_create_layer(x,y,"dialog",obj_Dialog);
			dialog.npc_name = npc.name
			
		}*/
	

vspd = vspd + grv

show_debug_message(global.cam_override)