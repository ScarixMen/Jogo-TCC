function Apollo_State_Idle(){
	
	hspd = 0
	
	sprite_index = spr_Apollo_Idle

	if(left) {state = Apollo_State_Walking}
	if(right) {state = Apollo_State_Walking}
	if(crounch) {state = Apollo_State_Crouched_Idle}
	if(jump) {image_index = 0 state = Apollo_State_Jump}
	
}
function Apollo_State_Walking(){
		
	hspd = move*spd // movimentação horizontal
	
	if abs(hspd) > 0 { sprite_index = spr_Apollo_Walking}
	
	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if(hspd == 0) {state = Apollo_State_Idle;}
	if(crounch) {state = Apollo_State_Crouched_Idle}
	if(jump) {image_index = 0 state = Apollo_State_Jump}
	if(!place_meeting(x,y+10, obj_Ramp))
	{
		
		if (!place_meeting(x,y+1, obj_Block)) {state = Apollo_State_Air}
		
	}
	
}


function Apollo_State_Jump() {
	
	sprite_index = spr_Apollo_Jump
	vspd = jspd

    hspd = move * spd;

	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if (vspd<=0)
	{	
		state = Apollo_State_Air
	}
}

	function Apollo_State_Air() {
	if sprite_index == spr_Apollo_Jump
	{
		
		if(image_index >= image_number -1)
		{
			sprite_index = spr_Apollo_Air
		}
		
	}else{
		
		sprite_index = spr_Apollo_Air
	
	}

    hspd = move * spd;

	if(hspd != 0 ) image_xscale = sign(hspd)
	
		if place_meeting(x, y + 1, obj_Block)
		{
			image_index = 0
			state = Apollo_State_Falling
		}
		
}

		
function Apollo_State_Falling() {
	
	hspd = 0
	sprite_index = spr_Apollo_Falling
	if(image_index >= image_number -1)
	{ 
	
		state = Apollo_State_Idle
		
	}	
}
function Apollo_State_Crouched_Idle() {
	
	hspd = 0
	
	sprite_index = spr_Apollo_Crouched_Idle
	
	if(left) {state = Apollo_State_Crouched}
	if(right) {state = Apollo_State_Crouched}
	
	if !place_meeting(x,y-46,obj_Block)
	{
		if(!crounch) {state = Apollo_State_Idle}
	}
	
}
function Apollo_State_Crouched() {
	
	if abs(hspd) > 0 { sprite_index = spr_Apollo_Crouched}
	
    hspd = move * cspd;

	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if(hspd == 0) {state = Apollo_State_Crouched_Idle;}
	
	if !place_meeting(x,y-46,obj_Block)
	{
		if(!crounch) {state = Apollo_State_Idle}
	}
	
}
function Apollo_State_Death() {
	
	sprite_index = spr_Apollo_Death
	
	hspd = 0
	
	if(image_index >= image_number -1)
	{
			
		image_index = 7
		instance_create_layer(0, 0, layer, obj_Transition_Death);
		
	}
	if instance_exists( obj_Transition_Death)
	{
		if obj_Transition_Death.alpha == 1
		{	
			x = global.check_X
			y = global.check_Y
			obj_Luana.x = global.check_X
			obj_Luana.y = global.check_Y
			state = Apollo_State_Idle
		}
	}
}

function Apollo_State_Death_Forest() {
	
	sprite_index = spr_Apollo_Death
	
	hspd = 0
	
	if(image_index >= image_number -1)
	{
			
		image_index = 7
		instance_create_layer(0, 0, layer, obj_Transition_Death);
		
	}
	
	if instance_exists( obj_Transition_Death)
	{
		if obj_Transition_Death.alpha == 1
		{	
			x = global.check_X
			y = global.check_Y
			obj_Luana.x = global.check_X
			obj_Luana.y = global.check_Y
			state = Apollo_State_Idle
		}
	}
	
	
}

function Apollo_State_Death_Boca() {
	
	sprite_index = spr_Noone
	
	hspd = 0
	vspd = 0
	
	if(image_index >= image_number -1)
	{
			
		image_index = 7
		instance_create_layer(0, 0, layer, obj_Transition_Death);
		
	}
	
	if instance_exists( obj_Transition_Death)
	{
		if obj_Transition_Death.alpha == 1
		{	
			x = global.check_X
			y = global.check_Y
			obj_Luana.x = global.check_X
			obj_Luana.y = global.check_Y
			state = Apollo_State_Idle
		}
	}
	
	
}

function Apollo_State_Cutscene() {
    if (hspd != 0) {
        sprite_index = spr_Apollo_Walking;
        image_xscale = sign(hspd);
    } else {
        sprite_index = spr_Apollo_Idle;
    }
	
	
	if(!global.cam_override)
	{
		
		state = Apollo_State_Idle
		
	}
	
}
function Apollo_State_Book(){
	
	hspd = 0
	
	sprite_index = spr_Apollo_Book;
	
	if(image_index >= image_number -1)
	{
		
		state = Apollo_State_Write
		
	}
}
function Apollo_State_Write()
{
	
	hspd = 0
	
	sprite_index = spr_Apollo_Write
	
	timer--;
	if(timer<=0)
	{
		timer = 120
		state = Apollo_State_Book_Reset
		
	}
}
function Apollo_State_Book_Reset()
{
	
	hspd = 0
	
	sprite_index = spr_Apollo_Book_Reset
	
	if(image_index >= image_number -1)
	{
		
		state = Apollo_State_Idle
		
	}
}