if (global.pause) {
    if (image_speed > 0) {
        image_index = floor(image_index); // trava no frame atual
    }
    image_speed = 0;
    exit;
}

// Timer da animação
if (ativo) {
    timer--;

    if (timer <= 0) {
        ativo = false;
        image_speed = 0;
        image_index = sprite_get_number(sprite_index) ; // <<< CONGELA NO ÚLTIMO FRAME
    }
}




function ativar_temple() {
    if (obj_Genius_Temple.estado != "erro") {
        switch (id_botao) {
            case 0: global.som.tocarSFX(sfx_Genius_1); break;
            case 1: global.som.tocarSFX(sfx_Genius_2); break;
            case 2: global.som.tocarSFX(sfx_Genius_3); break;
            case 3: global.som.tocarSFX(sfx_Genius_4); break;
        }
    }

    ativo = true;
    timer = room_speed * 0.5;
    image_index = 0;
    image_speed = 1;
}

// Inputs
Input_Luana();
Input_Apollo();

// Função para checar interação
function checar_interacao_temple(_obj, _interact) {
    if (place_meeting(x, y, _obj) && _interact) {
        with (obj_Genius_Temple) {
            if (estado == "entrada") {
                if (other.id_botao == sequencia[indice_entrada]) {
                    indice_entrada++;

                    // Ativa botão (som e animação)
                    other.ativar_temple();
					
                    // Verifica se completou a sequência
                    if (indice_entrada >= array_length(sequencia)) {
                        estado = "vitoria";
                    }
                } else {
                    estado = "erro";
                    global.som.tocarSFX(sfx_Genius_Error); // Som de erro, se quiser
                }
            }
        }
    }
}

// Verifica interação de um personagem por vez
if (!global.pause) {
    if (place_meeting(x, y, obj_Luana)) {
        checar_interacao_temple(obj_Luana, interact_Luana);
    }
    else if (place_meeting(x, y, obj_Apollo)) {
        checar_interacao_temple(obj_Apollo, interact_Apollo);
    }
}