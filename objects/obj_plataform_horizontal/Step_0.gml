#region CHANGE OF DIRECTION

hspd = spd *h_dir;


if instance_place(x + hspd, y, obj_Floor)
{

	h_dir *= -1;
	
}
#endregion
#region COLISION

var h_colision = place_meeting(x + hspd, y, obj_Man) or place_meeting(x, y - 1, obj_Man);

var w_colision = place_meeting(x + hspd, y, obj_Woman) or place_meeting(x, y - 1, obj_Woman);

if h_colision
{
	
	with(obj_Man)
	
	if!place_meeting(x + other.hspd, y, obj_Floor)
	{
		
		x += other.hspd;
		
	}

	
}

if w_colision
{
	
	with(obj_Woman)
	
	if!place_meeting(x + other.hspd, y, obj_Floor)
	{
		
		x += other.hspd;

		
	}

	
}

#endregion
x+=hspd
