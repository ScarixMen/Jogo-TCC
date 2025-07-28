function Plataform_Button_Idle_Tutorial(){
	
	
	sprite_index = spr_plataform_Apollo
	image_index = 0
	
	with(obj_Plataform_Tutorial){
		
		if(image_index >= image_number -1)
		{
			mask_index = spr_Plataform_Appear
			image_index = 19
		
		}
	}
		if(place_meeting(x,y-1,obj_Player))
		{
			
			global.som.tocarSFX(sfx_Cristal)
			state = Plataform_Button_Press_Tutorial
	
		}
	
}
function Plataform_Button_Press_Tutorial(){
	
	
	
	sprite_index = spr_plataform_Apollo
	
	global.cam_override = true
	global.focus_target = obj_Box
	
	
	with(obj_Plataform_Tutorial)
	{
		mask_index = spr_Plataform_Disappear
		sprite_index = spr_Plataform_Disappear
		
		if(image_index >= image_number -1)
		{
			alarm [0] = 120
			with(obj_Plataform_Button_Tutorial)
			{
				
				state = Plataform_Button_Pressed_Tutorial
				
			}
		}
	}
	
	
}
	
function Plataform_Button_Pressed_Tutorial(){
	
	if(image_index >= image_number -1)
	{
		image_index = 10
		
	}
	
	with(obj_Plataform_Tutorial)
	{
		mask_index = spr_Noone
		sprite_index = spr_Plataform_Portrait
		
	}
	
	if !place_meeting(x,y-1,obj_Player)
	{
		
		sprite_index = spr_plataform_Apollo_Reset
		image_index = 0
		
		state = Plataform_Button_Reset_Tutorial
		
		
	}
	
	
}

function Plataform_Button_Reset_Tutorial(){
	
	
	sprite_index = spr_plataform_Apollo_Reset
	
	with(obj_Plataform_Tutorial){
		
		sprite_index = spr_Plataform_Appear
		if(image_index >= image_number -1)
		{
		
			image_index = 21
		
		}
	}
	
	
	if(image_index >= image_number -1)
		{
			
			state = Plataform_Button_Idle_Tutorial;
		
		}
	
	
}