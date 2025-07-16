function Plataform_Button_Idle() {
    sprite_index = spr_plataform_Apollo;
    image_index = 0;

    // Só ativa se o jogador estiver pisando no botão
    if (place_meeting(x, y - 1, obj_Player)) {
        
        // Pegamos a plataforma associada a este botão
        var p = plataform;

        // Confirma se a plataforma está pronta para ativar
        if (p != noone && p.pronta) {
            
            // Agora testamos se há jogador em cima da área da plataforma
            var jogador_em_cima = collision_rectangle(p.x, p.y, p.x + p.sprite_width, p.y + p.sprite_height, obj_Player, false, true);

            if (!jogador_em_cima) {
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

    // Se ninguém mais está pressionando o botão, desativa
    if (!place_meeting(x, y - 1, obj_Player)) {
        state = Plataform_Button_Disappear;
    }
}

function Plataform_Button_Disappear() {
    sprite_index = spr_plataform_Apollo_Reset;

    if (image_index >= image_number - 1) {
        image_index = 10;
    }

    with (plataform) {
        state = Plataform_Disappear;
    }

    // Quando a plataforma terminar de desaparecer, volta pro Idle
    with (plataform) {
        if (pronta) {
            other.state = Plataform_Button_Idle;
        }
    }
}
