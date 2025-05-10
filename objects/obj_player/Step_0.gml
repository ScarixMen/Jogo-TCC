#region EXIT

if global.dialog == true 
{
	
	exit;	
	
}

#endregion



#region COLISION

if(place_meeting(x+sign(hspd),y, obj_Block)){
	if(!place_meeting(x+sign(hspd),y-2, obj_Block)){
		y -=5 ;

	}
}
/*else{

	if(!place_meeting(x+sign(hspd),y+1, obj_Block)){
		if(!place_meeting(x+sign(hspd),y+2, obj_Block)){
			
			y+=4;
			
		}	
	}	
}*/

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

/*#region PARALAX

var extremely_close = layer_get_id("b_Bush_Front")
var very_close = layer_get_id("b_Bush_Back")
var close = layer_get_id("b_Tree_Front")
var little_close = layer_get_id("b_Tree_Back")
var little_far = layer_get_id("b_Temple")
var far = layer_get_id("b_Dense_Forest_Front")
var very_far = layer_get_id("b_Dense_Forest_Back")
var extremely_far = layer_get_id("b_Sky")


layer_x(extremely_close, lerp(0, camera_get_view_x(view_camera[0]),0.1))
layer_x(very_close, lerp(0, camera_get_view_x(view_camera[0]),0.2))
layer_x(close, lerp(0, camera_get_view_x(view_camera[0]),0.3))
layer_x(little_close, lerp(0, camera_get_view_x(view_camera[0]),0.4))
layer_x(little_far, lerp(0, camera_get_view_x(view_camera[0]),0.5))
layer_x(far, lerp(0, camera_get_view_x(view_camera[0]),0.6))
layer_x(very_far, lerp(0, camera_get_view_x(view_camera[0]),0.7))
layer_x(extremely_far, lerp(0, camera_get_view_x(view_camera[0]),0.8))

#endregion*/

vspd = vspd + grv