//Colisão vertical
if place_meeting(x,y+vspd,obj_Block)
{
    while !place_meeting(x,y+sign(vspd),obj_Block)
    {
        y+=sign(vspd);
    }
	instance_destroy(obj_Box_Hitbox)
    vspd = 0;
}

y+=vspd;

vspd = vspd + grv

if (place_meeting(x, y + vspd, obj_Apollo)) {
        with (instance_place(x, y + vspd, obj_Apollo)) {
             damage_Apollo();
        }
    }


if (place_meeting(x, y + vspd, obj_Luana)) {
        with (instance_place(x, y + vspd, obj_Luana)) {
             damage_Luana();
        }
    }


/*if (vspd != 0)
{
	if !instance_exists(obj_Box_Hitbox)
	{
	
		instance_create_layer(x,y,layer,obj_Box_Hitbox)
		
	}
	
}