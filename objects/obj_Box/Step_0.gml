if (Check_Pause()) exit;

var estava_no_chao = place_meeting(x, y+1, obj_Block) || place_meeting(x, y+1, obj_Box);


// Colisão vertical
if place_meeting(x,y+vspd,obj_Block)
{
    while !place_meeting(x,y+sign(vspd),obj_Block)
    {
        y+=sign(vspd);
    }

    // Tocando som apenas na transição AR → CHÃO
    if (!no_chao_anterior && vspd > 0) {
        global.som.tocarSFX(sfx_Box_Fall);
    }

    vspd = 0;
}

y += vspd;
vspd += grv;

// Dano nos jogadores
if (vspd > grv) {
    if (place_meeting(x, y + vspd, obj_Apollo)) {
        with (instance_place(x, y + vspd, obj_Apollo)) {
            damage_Apollo();
        }
    }

    if (place_meeting(x, y + vspd, obj_Luana)) {
        with (instance_place(x, y + vspd, obj_Luana)) {
            damage_Luana();
        }
    }
}

// Atualiza estado anterior
no_chao_anterior = estava_no_chao;
