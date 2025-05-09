#region CHANGE OF DIRECTION

vspd = spd *v_dir;

if instance_place(x, y + vspd, obj_Limit_Plataform)
{

 v_dir *= -1;
	
}
#endregion
#region COLISION

var A_colision = place_meeting(x, y + vspd, obj_Apollo) or place_meeting(x, y , obj_Apollo);

var L_colision = place_meeting(x, y + vspd, obj_Luana) or place_meeting(x, y , obj_Luana);

if A_colision
{
	
	with(obj_Apollo)
	
	if!place_meeting(x, y + other.vspd, obj_Block)
	{
		
		y += other.vspd;
	}

	
}

if L_colision
{
	
	with(obj_Luana)
	
	if!place_meeting(x, y + other.vspd, obj_Block)
	{
		
		y += other.vspd;
		
	}

	
}

#endregion
y+=vspd