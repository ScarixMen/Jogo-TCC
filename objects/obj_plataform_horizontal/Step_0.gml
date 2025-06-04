#region CHANGE OF DIRECTION

hspd = spd *h_dir;


if instance_place(x + hspd, y, obj_Limit_Plataform)
{

	h_dir *= -1;
	
}
#endregion
#region COLISION

var Apolo_colision = place_meeting(x + hspd, y, obj_Apollo) or place_meeting(x, y - 1, obj_Apollo);

var Luana_colision = place_meeting(x + hspd, y, obj_Luana) or place_meeting(x, y - 1, obj_Luana);

if Apolo_colision
{
	
	with(obj_Apollo)
	
	if!place_meeting(x + other.hspd, y, obj_Block)
	{
		
		x += other.hspd;
		
	}

	
}

if Luana_colision
{
	
	with(obj_Luana)
	
	if!place_meeting(x + other.hspd, y, obj_Block)
	{
		
		x += other.hspd;

		
	}

	
}

x+=hspd
#endregion