function Apollo_state_idle(){
	
	sprite_index = spr_Apollo_Idle

	if(keyboard_check(ord("A"))) {state = Apollo_state_Walking}
	if(keyboard_check(ord("D"))) {state = Apollo_state_Walking}
	if(keyboard_check_pressed(vk_space)) {state = Apollo_state_Jump}
	
}
function Apollo_state_Walking(){
	
	//controles
	var left = keyboard_check(ord("A"))
	var right = keyboard_check(ord("D"))
	var move = -left+right
	
	if (!place_meeting(x, y + 1, obj_Block)){if x < 7400 {air = true}}
	
	hspd = move*spd // movimentação horizontal
	
	if abs(hspd) > 0 { sprite_index = spr_Apollo_Walking}
	
	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if(hspd == 0) {state = Apollo_state_idle;}
	if(keyboard_check_pressed(vk_space)) {state = Apollo_state_Jump}
	if (air = true) {sprite_index = spr_Apollo_Air state = Apollo_state_Jump}
	
}


function Apollo_state_Jump() {

    if (air == false and (place_meeting(x, y + 1, obj_Block)))
	{
        vspd = jspd  
		air = true
		sprite_index = spr_Apollo_Jump
	}
	
    left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
    move = -left + right;

    hspd = move * spd;

	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if(image_index >= image_number -1){ sprite_index = spr_Apollo_Air }

	if (air == true and (place_meeting(x, y + 1, obj_Block))) 
		{
		    vspd = 0; 
	        air = false;
			hspd = 0
			sprite_index = spr_Apollo_Falling
		
	        if(image_index >= image_number -1){ y -=2 state = Apollo_state_idle }
		
	    }
	}