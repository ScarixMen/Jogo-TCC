function Boca_Jacare_State_Idle_Wall(){
	timer = 60
	
	sprite_index = spr_Boca_Jacare_Idle_Wall
	
	if (place_meeting(x,y-1,obj_Player))
	{
		
		sprite_index = spr_Boca_Jacare_Touching_Wall
		state = Boca_Jacare_State_Touching_Wall
			
	}
}

function Boca_Jacare_State_Touching_Wall(){
	
	timer--;
	if(timer <= 0)
	{
		
		state = Boca_Jacare_State_Attack_Wall
		
	}
	
	
	if(image_index >= image_number -1)
	{
		image_index = 2
		
	}
	
	if (!place_meeting(x,y-1,obj_Player))
	{
		
		sprite_index = spr_Boca_Jacare_Reset_Touching_Wall
		image_index = 0
		state = Boca_Jacare_State_Reset_Wall
			
	}
}
function Boca_Jacare_State_Reset_Wall(){
	timer = 60
	
	sprite_index = spr_Boca_Jacare_Reset_Touching_Wall
	
	if(image_index >= image_number -1)
	{
		state = Boca_Jacare_State_Idle_Wall
		
	}
	
}
function Boca_Jacare_State_Attack_Wall(){
	timer = 60
	
	sprite_index = spr_Boca_Jacare_Attack_Wall
	
	if(image_index >= 2)
	{
		if (!instance_exists(hitbox)) {
		
			hitbox = instance_create_layer(x, y, layer, obj_Hitbox_Boca_Jacare_Attack);
		}
	}

	if(image_index >= image_number -1)
	{
		
		sprite_index = spr_Boca_Jacare_Reset_Attack_Wall
		image_index = 0
		state = Boca_Jacare_State_Reset_Attack_Wall
		
	}
}

function Boca_Jacare_State_Reset_Attack_Wall(){
	timer = 60
	
	if (instance_exists(hitbox)) {
	
		instance_destroy(hitbox);
	
	}
	
	sprite_index = spr_Boca_Jacare_Reset_Attack_Wall
		
	if(image_index >= image_number -1)
	{
		
		sprite_index = spr_Boca_Jacare_Idle_Wall
		image_index = 0
		state = Boca_Jacare_State_Idle_Wall
		
	}
	
}