if (Check_Pause()) exit;

	/*var distancia = 0
	if(point_distance(x, y, obj_Apollo.x, obj_Apollo.y) > point_distance(x, y, obj_Luana.x, obj_Luana.y))
	{
		 distancia = point_distance(x, y, obj_Luana.x, obj_Luana.y)
	}
	
	else
	{
		 distancia = point_distance(x, y, obj_Apollo.x, obj_Apollo.y)
	}
	
	var distancia_max = 500;
	var distancia_min = 30;
	var fator_volume = 1 * clamp(1 - (distancia - distancia_min) / (distancia_max - distancia_min), 0, 100);
	
	if(distancia < distancia_max)audio_sound_gain(sfx_Arrow_Broken, fator_volume, 0);*/

// Sai da room
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

// Movimento normal só se não colidiu ainda
if (!colidiu) {
    x -= hspd;

    // Colisão com bloco
    if (place_meeting(x, y, obj_Block)) {
        hspd = 0;
		global.som.tocarSFX(sfx_Arrow_Broken)
        sprite_index = spr_Arrow_Broken;
        image_index = 0;
        image_speed = 1;
        colidiu = true;
        timer_destruir = 30; // ou o tempo desejado
    }

    // Colisão com Apollo
    if (place_meeting(x, y, obj_Apollo)) {
        hspd = 0;
        with obj_Apollo{
			if state != Apollo_State_Death
			{
				image_index = 0
				damage_Apollo()
		
			}
		}
		global.som.tocarSFX(sfx_Arrow_Broken)
        sprite_index = spr_Arrow_Broken;
        image_index = 0;
        image_speed = 1;
        colidiu = true;
        timer_destruir = 30;
    }

    // Colisão com Luana
    if (place_meeting(x, y, obj_Luana)) {
        hspd = 0;
       with obj_Luana{
			if state != Luana_State_Death
			{
				image_index = 0
				damage_Luana()
		
			}
		}
		global.som.tocarSFX(sfx_Arrow_Broken)
        sprite_index = spr_Arrow_Broken;
        image_index = 0;
        image_speed = 1;
        colidiu = true;
        timer_destruir = 30;
    }
}

// Contador de destruição
if (colidiu) {
    timer_destruir--;
    if (timer_destruir <= 0) {
        instance_destroy();
    }
}
