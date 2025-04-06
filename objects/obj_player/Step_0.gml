#region EXIT

if global.dialog == true 
{
	
	exit;	
	
}

#endregion

script_execute(Player_States)

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
#region PARALAX

	

#endregion