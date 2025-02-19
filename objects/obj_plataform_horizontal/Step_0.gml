#region CHANGE OF DIRECTION

hspd = spd *h_dir;


if instance_place(x + hspd, y, obj_floor)
{

	h_dir *= -1;
	
}
#endregion
#region COLISION

var h_colision = place_meeting(x + hspd, y, obj_man) or place_meeting(x, y - 1, obj_man);

var w_colision = place_meeting(x + hspd, y, obj_woman) or place_meeting(x, y - 1, obj_woman);

if h_colision
{
	
	with(obj_man)
	
	if!place_meeting(x + other.hspd, y, obj_floor)
	{
		
		x += other.hspd;
		
	}

	
}

if w_colision
{
	
	with(obj_woman)
	
	if!place_meeting(x + other.hspd, y, obj_floor)
	{
		
		x += other.hspd;

		
	}

	
}

#endregion
x+=hspd
