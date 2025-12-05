function Flame_Thrower_State_Idle(){
	
	sprite_index = spr_Flame_Thrower_Idle
	
	if (instance_exists(hitbox)) {
	
		instance_destroy(hitbox);
	
	}
	
	if(place_meeting(x,y,obj_Player))
	{
		state = Flame_Thrower_State_Attack
		
	}
	

}
function Flame_Thrower_State_Attack(){
	
	timer++;
	
	if(timer >= timer_delay)
	{
		sprite_index = spr_Flame_Thrower_Attack
	
		if(image_index == 1)
		{
			global.som.tocarSFX(sfx_Flame_Thrower)
		}
	
		if(image_index == 10)
		{
			if (!instance_exists(hitbox)) {
				hitbox = instance_create_layer(x, y, "Luminis", obj_Flame_Thrower_Colision)
			
			}
		}
	
		if(image_index >= image_number -1)
		{
			timer = 0
			state = Flame_Thrower_State_Idle
	
		}
	}
}