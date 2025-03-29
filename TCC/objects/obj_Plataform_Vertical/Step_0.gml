#region CHANGE OF DIRECTION

vspd = spd *v_dir;

if instance_place(x, y + vspd, obj_Limit_Plataform)
{

	v_dir *= -1;
	
}
#endregion
#region COLISION

var h_colision = place_meeting(x, y + vspd, obj_Man) or place_meeting(x, y - 1, obj_Man);

var w_colision = place_meeting(x, y + vspd, obj_Woman) or place_meeting(x, y - 1, obj_Woman);

if h_colision
{
	
	with(obj_Man)
	
	if!place_meeting(x, y + other.vspd, obj_Stone)
	{
		
		y += other.vspd;
	}

	
}

if w_colision
{
	
	with(obj_Woman)
	
	if!place_meeting(x, y + other.vspd, obj_Limit_Plataform)
	{
		
		y += other.vspd;
		
	}

	
}

#endregion
y+=vspd