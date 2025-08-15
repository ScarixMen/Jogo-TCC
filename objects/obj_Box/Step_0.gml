if (Check_Pause()) exit;

// Verifica se estava no chão no frame anterior
var estava_no_chao = place_meeting(x, y + 1, obj_Block) || place_meeting(x, y + 1, obj_Box);

// === Colisão vertical ===
if (place_meeting(x, y + vspd, obj_Block) || place_meeting(x, y + vspd, obj_Box)) {
    while (!place_meeting(x, y + sign(vspd), obj_Block) && !place_meeting(x, y + sign(vspd), obj_Box)) {
        y += sign(vspd);
    }

    // Toca som somente se caiu do ar para o chão
    if (!no_chao_anterior && vspd > 0) {
        global.som.tocarSFX(sfx_Box_Fall);
    }

    vspd = 0;
}

y += vspd;
vspd += grv;

// === Dano nos jogadores ===
if (vspd > grv) {
    var alvo = instance_place(x, y + vspd, obj_Apollo);
    if (alvo != noone) {
        with (alvo) damage_Apollo();
    }

    alvo = instance_place(x, y + vspd, obj_Luana);
    if (alvo != noone) {
        with (alvo) damage_Luana();
    }
}

// Atualiza estado anterior
no_chao_anterior = estava_no_chao;
