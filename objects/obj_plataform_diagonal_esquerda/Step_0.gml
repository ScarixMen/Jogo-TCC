#region CHANGE OF DIRECTION

hspd = spd *h_dir;
vspd = spd *v_dir;

if instance_place(x + hspd, y + vspd, obj_Floor)
{

	h_dir *= -1;
	v_dir *= -1;
	
}
#endregion
#region COLISION

var h_colision = place_meeting(x + hspd, y + vspd, obj_Apolo) or place_meeting(x, y - 1, obj_Apolo);

var w_colision = place_meeting(x + hspd, y + vspd, obj_Luana) or place_meeting(x, y - 1, obj_Luana);

if h_colision
{
	
	with(obj_Apolo)
	
	switch(obj_Plataform_Diagonal_Esquerda.h_dir)
	{
		
		case 1:
			if!place_meeting(x - other.hspd, y, obj_Floor)
			{
		
				x += other.hspd;
				y += other.vspd;
			}
	
		break;
		
		case -1:
			if!place_meeting(x + other.hspd, y + other.vspd, obj_Floor)
			{
		
				x += other.hspd;
				y += other.vspd;
			}
	
		break;
		
	}
	
}

if w_colision
{
	
	with(obj_Luana)
	
	switch(obj_Plataform_Diagonal_Esquerda.h_dir)
	{
		
		case 1:
			if!place_meeting(x - other.hspd, y, obj_Floor)
			{
		
				x += other.hspd;
				y += other.vspd;
			}
	
		break;
		
		case -1:
			if!place_meeting(x + other.hspd, y + other.vspd, obj_Floor)
			{
		
				x += other.hspd;
				y += other.vspd;
			}
	
		break;
		
	}
	
}

#endregion
x+=hspd
y+=vspd