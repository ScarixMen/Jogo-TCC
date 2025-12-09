function Plataform_Button_Idle_Temple(){
	
	
	sprite_index = spr_plataform_Apollo
	image_index = 0
	
	with(obj_Plataform_Temple_Variable_2){
		
		if(image_index >= image_number -1)
		{
			mask_index = spr_Plataform_Appear
			image_index = 5
		
		}
	}
		if(place_meeting(x,y-1,obj_Apollo))
		{
			obj_Apollo.state = Apollo_State_Idle
			global.som.tocarSFX(sfx_Plataform_Button)
			state = Plataform_Button_Press_Temple
	
		}
	
}
function Plataform_Button_Press_Temple(){
	
	
	
	sprite_index = spr_plataform_Apollo
	
	global.cam_override = true
	global.cam_override = true
	global.focus_target = inst_ABD0FE3 
	
	
	with(obj_Plataform_Temple_Variable_2)
	{
		mask_index = spr_Plataform_Temple_Disappear
		sprite_index = spr_Plataform_Temple_Disappear
		
		if(image_index >= image_number -1)
		{
			alarm [0] = 120
			with(obj_Plataform_Button_Temple)
			{
				
				state = Plataform_Button_Pressed_Temple
				
			}
		}
	}
	
	
}
	
function Plataform_Button_Pressed_Temple(){
	
	if(image_index >= image_number -1)
	{
		image_index = 10
		
	}
	
	with(obj_Plataform_Temple_Variable_2)
	{
		mask_index = spr_Noone
		sprite_index = spr_Plataform_Temple_portrait
		
	}
	
	if !place_meeting(x,y-1,obj_Player)
	{
		
		sprite_index = spr_plataform_Apollo_Reset
		image_index = 0
		
		state = Plataform_Button_Reset_Temple
		
		
	}
	
	
}

function Plataform_Button_Reset_Temple(){
	
	
	sprite_index = spr_plataform_Apollo_Reset
	
	with(obj_Plataform_Temple_Variable_2){
		
		sprite_index = spr_Plataform_Temple_Appear
		if(image_index >= image_number -1)
		{
		
			image_index = 21
		
		}
	}
	
	
	if(image_index >= image_number -1)
		{
			
			state = Plataform_Button_Idle_Temple;
		
		}
	
	
}