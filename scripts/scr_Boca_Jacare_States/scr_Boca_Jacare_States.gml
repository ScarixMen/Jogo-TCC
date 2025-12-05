function Boca_Jacare_State_Idle(){
	timer = 60
	
	sprite_index = spr_Boca_Jacare_Idle
	
	if (place_meeting(x,y-1,obj_Player))
	{
		global.som.tocarSFX(sfx_Boca_Jacare_Touch)
		sprite_index = spr_Boca_Jacare_Touching
		state = Boca_Jacare_State_Touching
	}
}

function Boca_Jacare_State_Touching(){
	
	timer--;
	if(timer <= 0)
	{
		
		state = Boca_Jacare_State_Attack
		
	}
	
	
	if(image_index >= image_number -1)
	{
		image_index = 2
		
	}
	
	if (!place_meeting(x,y-1,obj_Player))
	{
		
		sprite_index = spr_Boca_Jacare_Reset_Touching
		image_index = 0
		state = Boca_Jacare_State_Reset
			
	}
}
function Boca_Jacare_State_Reset(){
	timer = 60
	
	sprite_index = spr_Boca_Jacare_Reset_Touching
	
	if(image_index >= image_number -1)
	{
		state = Boca_Jacare_State_Idle
		
	}
	
}
function Boca_Jacare_State_Attack(){
	timer = 60
	
	sprite_index = spr_Boca_Jacare_Attack
	
	if(image_index >= 2)
	{
		if (!instance_exists(hitbox)) {
			
			hitbox = instance_create_layer(x, y, layer, obj_Hitbox_Boca_Jacare_Attack);
		}
	}

	if(image_index >= image_number -1)
	{
		
		sprite_index = spr_Boca_Jacare_Reset_Attack
		image_index = 0
		state = Boca_Jacare_State_Reset_Attack
		
	}
}

function Boca_Jacare_State_Reset_Attack(){
	timer = 60
	
	if (instance_exists(hitbox)) {
	
		instance_destroy(hitbox);
	
	}
	
	sprite_index = spr_Boca_Jacare_Reset_Attack
		
	if(image_index >= image_number -1)
	{
		
		sprite_index = spr_Boca_Jacare_Idle
		image_index = 0
		state = Boca_Jacare_State_Idle
		
	}
	
}