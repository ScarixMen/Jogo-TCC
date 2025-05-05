function Luana_state_idle(){
	
	sprite_index = spr_Luana_Idle
	
	if(gamepad_button_check_pressed(global.gamepad_id,gp_face1)) {
		
		if place_meeting(x,y+1,obj_Block)
		{
		    
			vspd = jspd;
			
		}
	}
	
	if(gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25) {state = Luana_state_Walking}
	if(gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25) {state = Luana_state_Walking}

	
}
function Luana_state_Walking(){
	
	//controles
	var left = gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25;
	var right =  gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25;
	var move = -left+right
	
		
	hspd = move*spd // movimentação horizontal
	
	if(gamepad_button_check_pressed(global.gamepad_id,gp_face1)) {
		
		if place_meeting(x,y+1,obj_Block)
		{
		    
			vspd = jspd;
			
		}
	}
	
	if abs(hspd) > 0 { sprite_index = spr_Luana_Walking}
	
	if(hspd != 0 ) image_xscale = sign(hspd)
	
	
	if(hspd == 0) {state = Luana_state_idle;}
}

/*function Apollo_state_jump() {

        if(keyboard_check_pressed(vk_space)) {vspd = jspd;}   

    left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
    move = -left + right;

    hspd = move * spd;
	
	vspd = vspd + grv; // moviment vertival
	
	if(hspd != 0 ) image_xscale = sign(hspd)
	
    if (place_meeting(x, y + 1, obj_Block)) {
	    vspd = 0; 
        state = Apollo_state_idle;
    }
}
function Apollo_state_jump() {

    if (air == false and (place_meeting(x, y + 1, obj_Block)))
	{
        vspd = jspd  
        air = true  
    }

    left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
    move = -left + right;

    hspd = move * spd;

	if(hspd != 0 ) image_xscale = sign(hspd)

	if (air == true and (place_meeting(x, y + 1, obj_Block))) 
	{
	    vspd = 0; 
        air = false;
        state = Apollo_state_idle;
    }
}

