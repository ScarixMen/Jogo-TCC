#region CHANGE OF DIRECTION

hspd = spd *h_dir;


if instance_place(x + hspd, y, obj_Floor)
{

	h_dir *= -1;
	
}
#endregion
#region COLISION

var Luana_colision = place_meeting(x + hspd, y, obj_Apolo) or place_meeting(x, y - 1, obj_Apolo);

var Apolo_colision = place_meeting(x + hspd, y, obj_Luana) or place_meeting(x, y - 1, obj_Luana);

if Apolo_colision
{
	
	with(obj_Apolo)
	
	if!place_meeting(x + other.hspd, y, obj_Floor)
	{
		
		x += other.hspd;
		
	}

	
}

if Luana_colision
{
	
	with(obj_Luana)
	
	if!place_meeting(x + other.hspd, y, obj_Floor)
	{
		
		x += other.hspd;

		
	}

	
}

x+=hspd
#endregion