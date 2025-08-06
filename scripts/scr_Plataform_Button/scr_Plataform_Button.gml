function Plataform_Button_Idle() {
    sprite_index = spr_plataform_Apollo;
    image_index = 0;

    // Só continua se algum jogador estiver pisando no botão
    if (place_meeting(x, y - 1, obj_Apollo)) {
        var p = plataform;

        // Verifica se a plataforma está válida e pronta
        if (p != noone && p.pronta) {

            // Checa se ALGUM jogador está em cima da plataforma associada
            var jogador_em_cima = false;

            with (obj_Player) {
                // Confere se este jogador está colidindo com a plataforma associada ao botão
                if (place_meeting(x, y, other.plataform)) {
                    jogador_em_cima = true;
                }
            }
			with (obj_Box) {
                // Confere se este jogador está colidindo com a plataforma associada ao botão
                if (place_meeting(x, y, other.plataform)) {
                    jogador_em_cima = true;
                }
            }

            // Só ativa se ninguém estiver em cima da plataforma
            if (!jogador_em_cima) {
				global.som.tocarSFX(sfx_Plataform_Button);
                state = Plataform_Button_Appear;
            }
        }
    }
}


function Plataform_Button_Appear() {
	
	
	
    sprite_index = spr_plataform_Apollo;
    
    if (image_index >= image_number - 1) {
        image_index = 10;
    }

    with (plataform) {
        state = Plataform_Appear;
    }

    // Se a plataforma ainda não terminou de aparecer, aguarda
    if (!plataform.pronta)
        exit;

    // Só desativa se ninguém estiver mais no botão
    if (!place_meeting(x, y - 1, obj_Apollo)) {
        state = Plataform_Button_Disappear;
		sprite_index = spr_plataform_Apollo_Reset;
		image_index = 0
    }
}

function Plataform_Button_Disappear() {
    

    // Deixa a animação rodar até o final
    if (image_index >= image_number - 1) {
        // Quando terminar a animação do botão, volta para Idle
        with (plataform) {
            state = Plataform_Disappear;
        }

        if (plataform.pronta) {
            state = Plataform_Button_Idle;
        }
        exit;
    }
}
