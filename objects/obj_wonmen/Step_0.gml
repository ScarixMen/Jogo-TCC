#region CONTROLES

var left = keyboard_check(vk_left);
var right = keyboard_check(vk_right);
var up = keyboard_check_pressed(vk_up);
var move = -left+right;
var on = keyboard_check_pressed(vk_enter);

if on
{
	
 global.on = !global.on;
   
}
switch global.on
{
	case 0:
	
		jspd = -13;
		spd = 3;
		obj_wonmen_2.spd = 0;
		obj_wonmen_2.jspd = 0;
		
		break;
		
		case 1:
		
		obj_wonmen_2.jspd = -13;
		obj_wonmen_2.spd = 3;
		spd = 0;
		jspd = 0;
		
		break;

}


#endregion
#region MOVIMENTAÇÃO

hspd = move*spd; // movimentação horizontal

vspd = vspd + grv; // movimentação vertival

#endregion
#region PULO

if place_meeting(x,y+1,obj_floor)
{
    if up
    {
        vspd = jspd;
    }
}

#endregion
#region COLISÃO

//colisão horizontal
if place_meeting(x+hspd,y,obj_floor)
{
    while !place_meeting(x+sign(hspd),y,obj_floor)
    {
        x+=sign(hspd);
    }
    hspd = 0;
}


x+=hspd;

//Colisão vertical
if place_meeting(x,y+vspd,obj_floor)
{
    while !place_meeting(x,y+sign(vspd),obj_floor)
    {
        y+=sign(vspd);
    }
    vspd = 0;
}

y+=vspd;

#endregion