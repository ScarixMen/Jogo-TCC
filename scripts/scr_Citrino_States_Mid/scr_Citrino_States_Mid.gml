function Citrino_Mid_State_Off() {
	sprite_index = spr_Citrino_Idle;
	if(image_index >= image_number -1)
		{
		
			image_index = 5
		
		}
		
	 if (obj_Apollo.x < x and obj_Luana.x < x) {
		
		sprite_index = spr_Citrino_Idle;
		image_index = 0
        state = Citrino_Mid_State_Idle;
        return;
    }
}
function Citrino_Mid_State_Idle() {
    sprite_index = spr_Citrino_Idle;
	if(image_index >= image_number -1)
		{
		
			image_index = 5
		
		}
    var dist1 = abs(x - obj_Apollo.x);
    var dist2 = abs(x - obj_Luana.x);

    if (dist1 < 2000 || dist2 <2000) {
		
		sprite_index = spr_Citrino_Lighting;
		image_index = 0
        state = Citrino_Mid_State_Lighting;
    }
}


function Citrino_Mid_State_Lighting() {
    sprite_index = spr_Citrino_Lighting;
	
	if(image_index >= image_number -1)
		{
		
			image_index = 5
		
		}

    var dist1 = abs(x - obj_Apollo.x);
    var dist2 = abs(x - obj_Luana.x);

    // Se os dois estiverem muito perto, começa a atirar
    if (dist1 < 1000 || dist2 < 1000) {
        state = Citrino_Mid_State_Attack;
        return;
    }

    // Se ambos saírem do alcance, volta pro idle
    if (dist1 > 2000 and dist2 > 2000) {
		sprite_index = spr_Citrino_Idle;
		image_index = 0
        state = Citrino_Mid_State_Idle;
    }
}

function Citrino_Mid_State_Attack() {
	sprite_index = spr_Citrino_Attack_1;

    var dist1 = abs(x - obj_Apollo.x);
    var dist2 = abs(x - obj_Luana.x);

    // Parar de atirar se os dois já passaram dele
    if (obj_Apollo.x > x and obj_Luana.x > x) {
		
		sprite_index = spr_Citrino_Idle;
		image_index = 0
        state = Citrino_Mid_State_Off;
        return;
    }

    // Volta para alerta se os players se afastarem
    if (dist1 > 1000 and dist2 > 1000) {
		
		sprite_index = spr_Citrino_Lighting;
		image_index = 0
        state = Citrino_Mid_State_Lighting;
        return;
    }

    tiro_tempo++;

    if (tiro_tempo >= tiro_intervalo) {
		
		global.som.tocarSFX(sfx_Arrow, fator_volume);
		instance_create_layer(x - 50, y- 175, "Arrow", obj_Arrow);
		tiro_tempo = 0;
    }
}
