#region CHANGE OF DIRECTION

vspd = spd *v_dir;

if instance_place(x, y + vspd, obj_floor)
{

	v_dir *= -1;
	
}
#endregion
#region COLISION

var h_colision = place_meeting(x, y + vspd, obj_man) or place_meeting(x, y - 1, obj_man);

var w_colision = place_meeting(x, y + vspd, obj_woman) or place_meeting(x, y - 1, obj_woman);

if h_colision
{
	
	with(obj_man)
	
	if!place_meeting(x, y + other.vspd, obj_floor)
	{
		
		y += other.vspd;
	}

	
}

if w_colision
{
	
	with(obj_woman)
	
	if!place_meeting(x, y + other.vspd, obj_floor)
	{
		
		y += other.vspd;
		
	}

	
}

#endregion
y+=vspd