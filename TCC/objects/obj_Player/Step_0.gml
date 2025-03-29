#region EXIT

if global.dialog == true 
{
	
	exit;	
	
}

#endregion
#region CONTROLS

var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var up = keyboard_check_pressed(ord("W"));
var move = -left+right;

#endregion	
#region MOVIMENT

hspd = move*spd; // moviment horizontal

vspd = vspd + grv; // moviment vertival

#endregion
#region JUMP

if place_meeting(x,y+1,obj_Floor)
{
    if up
    {
        vspd = jspd;
    }
}

#endregion
#region COLISION

//colisão horizontal
if place_meeting(x+hspd,y,obj_Floor)
{
    while !place_meeting(x+sign(hspd),y,obj_Floor)
    {
        x+=sign(hspd);
    }
    hspd = 0;
}

x+=hspd

//Colisão vertical
if place_meeting(x,y+vspd,obj_Floor)
{
    while !place_meeting(x,y+sign(vspd),obj_Floor)
    {
        y+=sign(vspd);
    }
    vspd = 0;
}

y+=vspd;

//OBS: ESSA COLISÃO INCLUI AS PLATAFORMAS, POIS ELAS SÃO FILHAS DO "obj_floor".

#endregion
#region DIALOG

if distance_to_object(obj_Par_Npc) <=10
{
		
		if keyboard_check_pressed(ord("E")) and global.dialog == false
		{
			
			var npc	= instance_nearest(x,y,obj_Par_Npc);
			var dialog = instance_create_layer(x,y,"dialog",obj_Dialog);
			dialog.npc_name = npc.name
			
		}
	
}

#endregion
#region CAM

	

#endregion