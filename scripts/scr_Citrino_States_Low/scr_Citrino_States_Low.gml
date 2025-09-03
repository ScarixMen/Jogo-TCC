/// Função auxiliar para escolher alvo com campo de visão
function Citrino_GetTarget() {
    var looking_right = (image_xscale == 1);

    var target1 = obj_Apollo;
    var target2 = obj_Luana;

    // Verifica se cada target está dentro do campo de visão
    if (target1 != noone) {
        if ((looking_right && target1.x < x) || (!looking_right && target1.x > x) || target1.y > y) {
            target1 = noone;
        }
    }
    if (target2 != noone) {
        if ((looking_right && target2.x < x) || (!looking_right && target2.x > x) || target2.y > y) {
            target2 = noone;
        }
    }

    // Escolhe alvo mais próximo (se houver)
    if (target1 != noone && target2 != noone) {
        var dist1 = point_distance(x, y, obj_Apollo.x, obj_Apollo.y);
        var dist2 = point_distance(x, y, obj_Luana.x, obj_Luana.y);
        return (dist1 < dist2) ? obj_Apollo : obj_Luana;
    }
    if (target1 != noone) return obj_Apollo;
    if (target2 != noone) return obj_Luana;

    return noone;
}



/// Estado OFF
function Citrino_Low_State_Off() {
		tiro_tempo = 0
    sprite_index = spr_Citrino_Idle;
    if (image_index >= image_number - 1) {
        image_index = 5;
    }

    // Se os dois já passaram dele (x < Citrino)
    if (obj_Apollo.x < x && obj_Luana.x < x) {
        sprite_index = spr_Citrino_Idle;
        image_index = 0;
        state = Citrino_Low_State_Idle;
        return;
    }
}

/// Estado Idle
function Citrino_Low_State_Idle() {
		tiro_tempo = 0
    sprite_index = spr_Citrino_Idle;
    if (image_index >= image_number - 1) {
        image_index = 5;
    }

    var target = Citrino_GetTarget();

    if (target != noone) {
        var dist = point_distance(x, y, target.x, target.y);

        if (dist < 1000) {
            sprite_index = spr_Citrino_Lighting;
            image_index = 0;
			global.som.tocarSFX(sfx_Citrino)
            state = Citrino_Low_State_Lighting;
        }
    }
}


/// Estado Lighting (alerta)
function Citrino_Low_State_Lighting() {
	tiro_tempo = 0
    sprite_index = spr_Citrino_Lighting;

    if (image_index >= image_number - 1) {
        image_index = 5;
    }

    var target = Citrino_GetTarget();

    if (target != noone) {
        var dist = point_distance(x, y, target.x, target.y);

        // Se o alvo estiver muito perto, começa a atirar
        if (dist < 650) {
            state = Citrino_Low_State_Attack;
            return;
        }
    }

    // Se não há alvo válido ou está muito longe, volta pro Idle
    if (target == noone || point_distance(x, y, target.x, target.y) > 1000) {
        sprite_index = spr_Citrino_Idle;
        image_index = 0;
        state = Citrino_Low_State_Idle;
    }
}


/// Estado Attack
function Citrino_Low_State_Attack() {
    sprite_index = spr_Citrino_Attack_1;

    var target = Citrino_GetTarget();

    // Se não há alvo válido ou os dois já passaram dele
    if (target == noone || (obj_Apollo.x > x && obj_Luana.x > x)) {
        sprite_index = spr_Citrino_Idle;
        image_index = 0;
        state = Citrino_Low_State_Off;
        return;
    }

    // Volta para alerta se o alvo se afastar
    if (point_distance(x, y, target.x, target.y) > 650) {
        sprite_index = spr_Citrino_Lighting;
        image_index = 0;
        state = Citrino_Low_State_Lighting;
        return;
    }

    tiro_tempo++;
    if (tiro_tempo >= tiro_intervalo) {
        global.som.tocarSFX(sfx_Arrow, fator_volume);
        instance_create_layer(x - 50, y - 175, "Arrow", obj_Arrow);
        tiro_tempo = 0;
    }
}
