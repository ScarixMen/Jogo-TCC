if (Check_Pause()) exit;

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
