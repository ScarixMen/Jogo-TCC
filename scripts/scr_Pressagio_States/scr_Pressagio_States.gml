function Pressagio_State_Following(){

	if (instance_exists(target)) {

	    // --- Posição alvo ---
	    var tx = target.x
	    var ty = target.y - 200;

	    // seguir suavemente
		var dir = point_direction(base_x, base_y, tx, ty)
		
		if (point_distance(base_x, base_y, obj_Pressagio_Spawner.x, obj_Pressagio_Spawner.y) > 1300)
		{
			
			state = Pressagio_State_Reset;
		
		}
		
		if (point_distance(base_x, base_y, tx, ty) < 1300)
		{
			
		base_x+= lengthdir_x(spd, dir)
		base_y+= lengthdir_y(spd, dir)
		
		}

	    // --- Flutuação ---
	    osc += 0.12;
	    var offset_y = sin(osc) * 20;

	    x = base_x;
	    y = base_y + offset_y;
	
		if (tx < x) {
			image_xscale = 1; // olhando pra esquerda
		} else {
		    image_xscale = -1;  // olhando pra direita
		}
	
		if (place_meeting(x,y,target))
		{
			
			state = Pressagio_State_Touching
			
		}
	}

}

function Pressagio_State_Touching(){
	if(target == obj_Apollo){
		with(obj_Apollo){
			if(state != Apollo_State_Death_Forest){
				image_index = 0;
				damage_Apollo_Forest();
	        }
	    }
	}
	
	if(target == obj_Luana){
		with(obj_Luana){
	        if(state != Luana_State_Death_Forest){
	            image_index = 0;
	            damage_Luana_Forest();
	        }
	    }
	}
	state = Pressagio_State_Reset
	
}

function Pressagio_State_Reset(){
	
	instance_destroy();
	
}