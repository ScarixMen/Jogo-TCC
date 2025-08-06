function Luana_State_Idle(){
	
	hspd = 0
	
	sprite_index = spr_Luana_Idle
	
	if(left) {state = Luana_State_Walking}
	if(right) {state = Luana_State_Walking}
	if(jump) {image_index = 0 state = Luana_State_Jump}
	
}
function Luana_State_Walking(){
		
	hspd = move*spd // movimentação horizontal
	
	if abs(hspd) > 0 { sprite_index = spr_Luana_Walking}
	
	if(hspd != 0 ) image_xscale = sign(hspd)
	
	
	var push_list = ds_list_create();

	var is_block = instance_place_list(x + hspd, y, obj_Box, push_list, false);
	
	if(is_block)
	{
		
		
		if(ds_list_size(push_list) > 0)	
		{
			state = Luana_State_Push
		}
	}
	
	if(hspd == 0) {state = Luana_State_Idle;}
	if(jump) {image_index = 0 state = Luana_State_Jump}
	if(!place_meeting(x,y+10, obj_Ramp))
	{
		
		if (!place_meeting(x,y+1, obj_Block)) {state = Luana_State_Air}
		
	}
}

function Luana_State_Jump() {
	
	sprite_index = spr_Luana_Jump
	vspd = jspd
		
	hspd = move*spd // movimentação horizontal

	if(hspd != 0 ) image_xscale = sign(hspd)
	
	if (vspd<=0)
	{	
		state = Luana_State_Air
	}
}

	function Luana_State_Air() {
	if sprite_index == spr_Luana_Jump
	{
		
		if(image_index >= image_number -1)
		{
			sprite_index = spr_Luana_Air
		}
		
	}else{
		
		sprite_index = spr_Luana_Air
	
	}
		
	hspd = move*spd // movimentação horizontal

	if(hspd != 0 ) image_xscale = sign(hspd)
	
		if place_meeting(x, y + 1, obj_Block)
		{
			image_index = 0
			state = Luana_State_Falling
		}
		
}

		
function Luana_State_Falling() {
	
	hspd = 0
	sprite_index = spr_Luana_Falling
	if(image_index >= image_number -1)
	{ 
	
		state = Luana_State_Idle 
		
	}	
}
function Luana_State_Push() {

hspd = 0
			sprite_index = spr_Luana_Push
			if(image_index >= image_number -1)
			{	
				sprite_index = spr_Luana_Push_Idle
				image_index = 0
				state = Luana_State_Push_Idle
				
			}
	
}

function Luana_State_Push_Idle() {
	
	sprite_index = spr_Luana_Push_Idle
	
	hspd = 0
	
	if(left) {state = Luana_State_Push_Walking}
	if(right) {state = Luana_State_Push_Walking}
	
	
	
}

function Luana_State_Push_Walking() {
	
	sprite_index = spr_Luana_Push_Wallking
	
	//if(hspd == 0) {state = Luana_State_Push_Idle;}
	
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
					if(!place_meeting(x+other.hspd,y,obj_Block) and !place_meeting(x+other.hspd,y,obj_Apollo)) and !place_meeting(x + other.hspd,y,obj_Post)
					{
						if!audio_is_playing(sfx_Push_Box)
						{
							audio_play_sound(sfx_Push_Box,1,true)
						}
						x+=other.hspd;
					}
				}
			}
		}
	}
	
	else
	{
		audio_stop_sound(sfx_Push_Box);
		state = Luana_State_Idle
	}

	ds_list_destroy(push_list);
		
	
	
}
function Luana_State_Death() {
	
	sprite_index = spr_Luana_Death
	
	hspd = 0
	vspd = 0
	
	if(image_index >= image_number -1)
	{
			
		image_index = 4
		if !instance_exists( obj_Transition_Death)
		{
			instance_create_layer(0, 0, layer, obj_Transition_Death);
		}
		
	}
	if instance_exists( obj_Transition_Death)
	{
		if obj_Transition_Death.alpha == 1
		{	
			x = global.check_X
			y = global.check_Y
			obj_Apollo.x = global.check_X
			obj_Apollo.y = global.check_Y
			obj_Niobio.x = 32014
			obj_Niobio.y = 2386
			obj_Cutscene_Trigger_Niobio.cutscene_started = false
			obj_Boss_Fight_Control.bar_value = 100
			state = Luana_State_Idle
		}
	}
}

function Luana_State_Death_Forest() {
	
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
			obj_Apollo.x = global.check_X
			obj_Apollo.y = global.check_Y
			state = Luana_State_Idle
		}
	}
	
	
}
function Luana_State_Cutscene() {
    // Continua andando se hspd for diferente de 0
    if (hspd != 0) {
        sprite_index = spr_Luana_Walking;
        image_xscale = sign(hspd);
    } else {
        sprite_index = spr_Luana_Idle;
    }
	
	if(!global.cam_override)
	{
		
		state = Luana_State_Idle
		
	}
	
}
function Luana_State_Push_Niobio() {
	sprite_index = spr_Luana_Push_Niobio_Wallking;
    if (interact_Luana) {
		passador_de_frame++;
		
		image_index = passador_de_frame
    }else {
		
		image_speed = 0
	}
	
}