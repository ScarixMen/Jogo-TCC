if (Check_Pause()) exit;
Input_Luana();

if (battle_active) {
	
	
	instance_activate_object(obj_Invisible_Wall_Boss_Fight)
	
    // Níobio corre contra a Luana
    if (niobio != noone) {
        if (niobio.state != Niobio_State_Push) niobio.state = Niobio_State_Push;
    }

    // Luana tenta segurar
    if (interact_Luana) {
        bar_value += luana_force;
	
        // Se Luana não está empurrando ainda → força estado de empurrar
        if (luana != noone && luana.state != Luana_State_Push_Niobio) {
            luana.image_index = 0;
            luana.state = Luana_State_Push_Niobio;
        }
    } else {
        bar_value -= penalty_luana;
    }

    // Níobio força constante
    bar_value -= boss_force;

    // Limites
    bar_value = clamp(bar_value, bar_min, bar_max);

    // Checa derrota
    if (bar_value <= bar_min) {
        battle_active = false;
        battle_result = -1;

        if (niobio != noone) niobio.state = Niobio_State_Reset; // continua correndo (pode mudar para outro se tiver)
        if (luana != noone) luana.state = Luana_State_Death; // estado de cair já existe
    }

    // Checa vitória (Apollo terminou puzzle)
    if (apollo_finished) {
        battle_active = false;
        battle_result = 1;

		//if (niobio != noone) niobio.state = Niobio_State_Idle_Dialog_2;  // congelado como estátua
        if (luana != noone) luana.state = Luana_State_Idle;      // pode usar outro estado se quiser comemoração
    }
	
	if (niobio != noone && luana != noone) {
	    var offset = (bar_value - 50) * 5; // -25 a +25 de deslocamento
	    niobio.x = lerp(niobio.x, 31324 + offset, 0.1);
	    luana.x  = lerp(luana.x, 31170 + offset, 0.1);
	}
	
	timer--;
	
	if(timer <= 0)
	{
		
		luana_force -= 0.5
		boss_force += 0.05
		timer = room_speed*30
		
	}
}else {
	
	instance_deactivate_object(obj_Invisible_Wall_Boss_Fight)
}




