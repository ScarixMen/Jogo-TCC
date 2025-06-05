function Apollo_state_idle(){
	
	sprite_index = spr_Apollo_Idle

	if(keyboard_check(ord("A"))) {state = Apollo_state_Walking}
	if(keyboard_check(ord("D"))) {state = Apollo_state_Walking}
	if(keyboard_check_released(ord("S"))) {state = Apollo_state_crouched_idle}
	if(keyboard_check_pressed(vk_space)) {image_index = 0 state = Apollo_state_Jump}
	
}
function Apollo_state_Walking(){
	
	//controles
	var left = keyboard_check(ord("A"))
	var right = keyboard_check(ord("D"))
	var move = -left+right
	
	
	hspd = move*spd // movimentação horizontal
	
	if abs(hspd) > 0 { sprite_index = spr_Apollo_Walking}
	
	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if(hspd == 0) {state = Apollo_state_idle;}
	if(keyboard_check(ord("S"))) {state = Apollo_state_crouched_idle}
	if(keyboard_check_pressed(vk_space)) {image_index = 0 state = Apollo_state_Jump}
	if(!place_meeting(x,y+10, obj_Ramp))
	{
		
		if (!place_meeting(x,y+1, obj_Block)) {state = Apollo_state_air}
		
	}
	
}


function Apollo_state_Jump() {
	
	sprite_index = spr_Apollo_Jump
	vspd = jspd
	
	left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
    move = -left + right;

    hspd = move * spd;

	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if (vspd<=0)
	{	
		state = Apollo_state_air
	}
}

	function Apollo_state_air() {
	if sprite_index == spr_Apollo_Jump
	{
		
		if(image_index >= image_number -1)
		{
			sprite_index = spr_Apollo_Air
		}
		
	}else{
		
		sprite_index = spr_Apollo_Air
	
	}
    left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
    move = -left + right;

    hspd = move * spd;

	if(hspd != 0 ) image_xscale = sign(hspd)
	
		if place_meeting(x, y + 1, obj_Block)
		{
			image_index = 0
			state = Apollo_state_falling
		}
		
}

		
function Apollo_state_falling() {
	
	hspd = 0
	sprite_index = spr_Apollo_Falling
	if(image_index >= image_number -1)
	{ 
	
		state = Apollo_state_idle 
		
	}	
}
function Apollo_state_crouched_idle() {
	sprite_index = spr_Apollo_Crouched_Idle
	
	if(keyboard_check(ord("A"))) {state = Apollo_state_crouched}
	if(keyboard_check(ord("D"))) {state = Apollo_state_crouched}
	
	if !place_meeting(x,y-46,obj_Block)
	{
		if(keyboard_check_released(ord("W"))) {state = Apollo_state_idle}
	}
	
}
function Apollo_state_crouched() {
	
	sprite_index = spr_Apollo_Crouched
	
    left = keyboard_check(ord("A"));
    right = keyboard_check(ord("D"));
    move = -left + right;

    hspd = move * cspd;

	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if(hspd == 0) {state = Apollo_state_crouched_idle;}
	
	if !place_meeting(x,y-46,obj_Block)
	{
		if(keyboard_check_released(ord("W"))) {state = Apollo_state_idle}
	}
	
}