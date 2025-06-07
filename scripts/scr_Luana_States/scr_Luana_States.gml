function Luana_state_idle(){
	
	sprite_index = spr_Luana_Idle
	
	if(gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25) {state = Luana_state_Walking}
	if(gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25) {state = Luana_state_Walking}
	if(gamepad_button_check_pressed(global.gamepad_id,gp_face1)) {image_index = 0 state = Luana_state_Jump}
	
}
function Luana_state_Walking(){
	
	//controles
	var left = gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25;
	var right =  gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25;
	var move = -left+right
	
		
	hspd = move*spd // movimentação horizontal
	
	if abs(hspd) > 0 { sprite_index = spr_Luana_Walking}
	
	if(hspd != 0 ) image_xscale = sign(hspd)
	
	
	var push_list = ds_list_create();

	var is_block = instance_place_list(x + hspd, y, obj_Box, push_list, false);
	
	if(is_block)
	{
		
		
		if(ds_list_size(push_list) > 0)	
		{
			state = Luana_state_push_idle
		}
	}
	
	if(hspd == 0) {state = Luana_state_idle;}
	if(gamepad_button_check_pressed(global.gamepad_id,gp_face1)) {image_index = 0 state = Luana_state_Jump}
	if(!place_meeting(x,y+10, obj_Ramp))
	{
		
		if (!place_meeting(x,y+1, obj_Block)) {state = Luana_state_air}
		
	}
}

function Luana_state_Jump() {
	
	sprite_index = spr_Luana_Jump
	vspd = jspd
	
	 var left = gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25;
	var right =  gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25;
	var move = -left+right
	
		
	hspd = move*spd // movimentação horizontal

	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if (vspd<=0)
	{	
		state = Luana_state_air
	}
}

	function Luana_state_air() {
	if sprite_index == spr_Luana_Jump
	{
		
		if(image_index >= image_number -1)
		{
			sprite_index = spr_Luana_Air
		}
		
	}else{
		
		sprite_index = spr_Luana_Air
	
	}
    var left = gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25;
	var right =  gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25;
	var move = -left+right
	
		
	hspd = move*spd // movimentação horizontal

	if(hspd != 0 ) image_xscale = sign(hspd)
	
		if place_meeting(x, y + 1, obj_Block)
		{
			image_index = 0
			state = Luana_state_falling
		}
		
}

		
function Luana_state_falling() {
	
	hspd = 0
	sprite_index = spr_Luana_Falling
	if(image_index >= image_number -1)
	{ 
	
		state = Luana_state_idle 
		
	}	
}
function Luana_state_push_idle() {

hspd = 0
			sprite_index = spr_Luana_Push
			if(image_index >= image_number -1)
			{	
			
				state = Luana_state_push_walking
				
			}
	
}


function Luana_state_push_walking() {
	
		image_index =	6
	
	var left = gamepad_axis_value(global.gamepad_id, gp_axislh) < -0.25;
	var right =  gamepad_axis_value(global.gamepad_id, gp_axislh) > 0.25;
	var move = -left+right
	
	hspd = move*pspd // movimentação horizontal

	if(hspd != 0 ) image_xscale = sign(hspd)
		
	var push_list = ds_list_create();

	var is_block = instance_place_list(x + hspd, y, obj_Box, push_list, false);
	
	if(is_block)
	{
		
		
		if(ds_list_size(push_list) > 0)	{
			
			for(var i = 0; i < ds_list_size(push_list);i++)
			{
				var block = push_list [| i];
				with(block){
					if(!place_meeting(x+other.hspd,y,obj_Block))
					{
						x+=other.hspd;
					}
				}
			}
		}
	}
	
	else
	{
		state = Luana_state_idle
	}

	ds_list_destroy(push_list);
		
	
	
}
