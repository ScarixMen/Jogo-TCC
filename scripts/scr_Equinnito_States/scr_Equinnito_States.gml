function Equinnito_State_Idle(){
	
	sprite_index = spr_Equinnito_Idle
	
	if !place_meeting(x,y,obj_Player)
	{
		
		alarm [0] = 35
		
	}

}

function Equinnito_State_Attack(){
	
	sprite_index = spr_Equinnito_Attack
	
	if (image_index == 1) {
		global.som.tocarSFX(sfx_Equinnito);
	
		if (!instance_exists(hitbox) || !instance_exists(hitbox.id)) {
			hitbox = instance_create_layer(x, y, layer, obj_Hitbox_Equinnito);
			hitbox.dono = id; // opcional, pra linkar o dono
		}
	}

	if(image_index >= image_number -1)
	{
		
		sprite_index = spr_Equinnito_Reset
		image_index = 0
		state = Equinnito_State_Reset
		
	}
}
function Equinnito_State_Reset(){
	
	sprite_index = spr_Equinnito_Reset
	
	if(image_index >= image_number -1)
	{
		if (instance_exists(hitbox)) {
		instance_destroy(hitbox);
		}
		state = Equinnito_State_Idle
		
	}
}