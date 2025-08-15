switch (estado)
{
    case Estado.ANDANDO:
        {
            // Move em passos pequenos para evitar atravessar
            var i = 0;
            var colidiu = false;

            while (i < spd) {
                if (place_meeting(x - 1, y, obj_Wall)) { // só parede lateral
                    colidiu = true;
                    break;
                }
                x -= 1;
                i += 1;
            }

            if (colidiu) {
                // Alinha exatamente na parede
                while (!place_meeting(x - 1, y, obj_Wall)) {
                    x -= 1;
                }

                // Começa a subir
                estado = Estado.SUBINDO;
                mask_index = spr_Colision_Cobra_Regia_90;
                inst_visual.image_angle = 270; // cabeça pra cima
                inst_visual.image_xscale = 1;
            }
        }
        break;

  case Estado.SUBINDO:
{
    var i;
    var colidiu = false;

    for (i = 0; i < spd; i++) {
        if (place_meeting(x, bbox_top - 1, obj_Rock_Colision)) {
            colidiu = true;
            break;
        }
        y -= 1;
    }

    if (colidiu) {
        // Alinha exatamente encostando no teto
        while (!place_meeting(x, bbox_top - 1, obj_Rock_Colision)) {
            y -= 1;
        }

        estado = Estado.DESCENDO;
        mask_index = spr_Colision_Cobra_Regia_90;
        inst_visual.image_angle = 270; // cabeça pra baixo
        inst_visual.image_xscale = -1;
    }
}
break;



    case Estado.DESCENDO:
        {
            var i = 0;
            var colidiu = false;

            while (i < spd) {
                if (place_meeting(x, y + 1, obj_Rock_Colision)) { // chão é rock
                    colidiu = true;
                    break;
                }
                y += 1;
                i += 1;
            }

            if (colidiu) {
                // Alinha exatamente no chão
                while (!place_meeting(x, y + 1, obj_Rock_Colision)) {
                    y += 1;
                }

                // Volta a andar
                estado = Estado.ANDANDO;
                mask_index = spr_Colision_Cobra_Regia_0;
                inst_visual.image_angle = 0;
                inst_visual.image_xscale = 1;
            }
        }
        break;
}

// Atualiza a posição visual para coincidir com o colisor
inst_visual.x = x;
inst_visual.y = y;
