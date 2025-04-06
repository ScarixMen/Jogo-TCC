function Player_States(){

#region CONTROLS
if(object_index == obj_Apolo)
{
	
	var left = keyboard_check(ord("A"));
	var right = keyboard_check(ord("D"));
	var up = keyboard_check_pressed(vk_space);
	
}
else{

var left = gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25;
var right = gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25;
var up = gamepad_button_check_pressed(global.gamepad_id,gp_face1);

}

var move = -left+right;
#endregion	
#region MOVIMENT

hspd = move*spd; // moviment horizontal

vspd = vspd + grv; // moviment vertival

#endregion
#region JUMP

if place_meeting(x,y+1,obj_Floor)
{
    if up
    {
        vspd = jspd;
    }
}

#endregion


}