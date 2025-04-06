#region CHANGE OF DIRECTION

vspd = spd *v_dir;

if instance_place(x, y + vspd, obj_Limit_Plataform)
{

	spd = 0;
	
}
#endregion
#region COLISION

var h_colision = place_meeting(x, y + vspd, obj_Apolo) or place_meeting(x, y - 1, obj_Apolo);

var w_colision = place_meeting(x, y + vspd, obj_Luana) or place_meeting(x, y - 1, obj_Luana);

if h_colision
{
	
	with(obj_Apolo)
	
	if!place_meeting(x, y + other.vspd, obj_Stone)
	{
		
		y += other.vspd;
	}

	
}

if w_colision
{
	
	with(obj_Luana)
	
	if!place_meeting(x, y + other.vspd, obj_Stone)
	{
		
		y += other.vspd;
		
	}

	
}

#endregion
y+=vspd