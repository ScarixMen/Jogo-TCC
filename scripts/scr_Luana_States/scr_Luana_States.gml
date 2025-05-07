function Luana_state_idle(){
	
	sprite_index = spr_Luana_Idle
	
	if(gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25) {state = Luana_state_Walking}
	if(gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25) {state = Luana_state_Walking}
	if(gamepad_button_check_pressed(global.gamepad_id,gp_face1)) {state = Luana_state_Jump}
	
}
function Luana_state_Walking(){
	
	//controles
	var left = gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25;
	var right =  gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25;
	var move = -left+right
	
		
	hspd = move*spd // movimentação horizontal
	
	if (!place_meeting(x, y + 1, obj_Block)){air = true}
	
	if abs(hspd) > 0 { sprite_index = spr_Luana_Walking}
	
	if(hspd != 0 ) image_xscale = sign(hspd)
	
	
	if(hspd == 0) {state = Luana_state_idle;}
	if(gamepad_button_check_pressed(global.gamepad_id,gp_face1)) {state = Luana_state_Jump}
	if (air = true) {sprite_index = spr_Luana_Air state = Luana_state_Jump}
	
}

function Luana_state_Jump() {

    if (air == false and (place_meeting(x, y + 1, obj_Block)))
	{
        vspd = jspd  
        air = true
		sprite_index = spr_Luana_Jump
	}
	
	var left = gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25;
	var right =  gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25;
    move = -left + right;

    hspd = move * spd;

	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if(image_index >= image_number -1){ sprite_index = spr_Luana_Air }

	if (air == true and (place_meeting(x, y + 1, obj_Block))) 
	{
	    vspd = 0; 
        air = false;
		hspd = 0
		sprite_index = spr_Luana_Falling
		
        if(image_index >= image_number -1){ y -=2 state = Luana_state_idle }
		
    }
}