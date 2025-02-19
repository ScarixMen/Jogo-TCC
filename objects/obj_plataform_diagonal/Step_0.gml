#region CHANGE OF DIRECTION

hspd = spd *h_dir;
vspd = spd *v_dir;

if instance_place(x + hspd, y + vspd, obj_floor)
{

	h_dir *= -1;
	v_dir *= -1;
	
}
#endregion
#region COLISION

var h_colision = place_meeting(x + hspd, y + vspd, obj_man) or place_meeting(x, y - 1, obj_man);

var w_colision = place_meeting(x + hspd, y + vspd, obj_woman) or place_meeting(x, y - 1, obj_woman);

if h_colision
{
	
	with(obj_man)
	
	if!place_meeting(x + other.hspd, y + other.vspd, obj_floor)
	{
		
		x += other.hspd;
		y += other.vspd;
	}

	
}

if w_colision
{
	
	with(obj_woman)
	
	if!place_meeting(x + other.hspd, y + other.vspd, obj_floor)
	{
		
		x += other.hspd;
		y += other.vspd;
		
	}

	
}

#endregion
x+=hspd
y+=vspd