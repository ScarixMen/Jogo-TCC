#region CHANGE OF DIRECTION

vspd = spd *v_dir;

if instance_place(x, y + vspd, obj_Limit_Plataform)
{

 vspd = 0
	
}
#endregion
#region COLISION

var A_colision = place_meeting(x, y + 1, obj_Apollo) or place_meeting(x, y-1 , obj_Apollo);

var L_colision = place_meeting(x, y + 1, obj_Luana) or place_meeting(x, y-1 , obj_Luana);

if A_colision
{
	
	with(obj_Apollo)
	
		y += other.vspd;

	
}

if L_colision
{
	
	with(obj_Luana)
	
		y += other.vspd;
	
}

#endregion
y+=vspd