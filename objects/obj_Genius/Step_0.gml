if (!ativo) exit;


switch (estado) {
    case "tocando":
        tempo_atual++;

        if (tempo_atual >= tempo_espera) {
            if (indice_atual < array_length(sequencia)) {
                var qual = sequencia[indice_atual];
                with (instance_find(global.botoes[qual], 0)) {
                    ativar();
                }

                tempo_atual = 0;
                indice_atual++;
            } else {
                estado = "entrada";
                indice_atual = 0;
            }
        }
        break;

    case "entrada":
        // Espera jogador tocar os botões (não faz nada aqui)
        break;

   case "vitoria":
    // Espera antes de começar a próxima rodada
    if (delay_vitoria > 0) {
        delay_vitoria--;
    } else {
        if (array_length(sequencia) >= 7) {
            //show_debug_message("Genius finalizado!");
            estado = "fim";
            break;
        }

        array_push(sequencia, irandom(3));
        indice_entrada = 0;
        indice_atual = 0;
        tempo_atual = 0;
        delay_vitoria = room_speed * 1; // 1 segundo de delay
        estado = "esperando_proxima";
    }
    break;
	
	case "esperando_proxima":
    delay_vitoria--;

    if (delay_vitoria <= 0) {
        estado = "tocando";
    }
    break;
	
	case "fim":
	
    global.cam_override = true;
    global.focus_target = obj_Bridge_Genius;
	
	camera_set_view_pos(view_camera [2] ,24800, 2000)
	

    with obj_Bridge_Genius {
        sprite_index = spr_Bridge_Appear;
        image_index = 0;
        image_speed = 1;
    }
	

    estado = "ponte";
    break;

	case "ponte":
    with obj_Bridge_Genius {
        if (image_index >= image_number - 1) {
            image_speed = 0;
            image_index = 48; // frame final, se necessário
            global.cam_override = false;
			
        }
    }
    break;


   case "erro":
    if (delay_vitoria > 0) {
        delay_vitoria--;
    } else {
       // show_debug_message("Errou! Reiniciando sequência...");

        // Reinicia com nova sequência
        sequencia = [];
        array_push(sequencia, irandom(3));

        indice_entrada = 0;
        indice_atual = 0;
        tempo_atual = 0;

        delay_vitoria = room_speed * 1; // nova pausa antes da próxima
        estado = "esperando_proxima";
    }
    break;


}
