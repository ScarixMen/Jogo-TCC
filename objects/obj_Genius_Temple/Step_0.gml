if (Check_Pause()) exit;

if (!ativo) exit;


switch (estado) {
    case "tocando":
		
        tempo_atual++;

        if (tempo_atual >= tempo_espera) {
            if (indice_atual < array_length(sequencia)) {
                var qual = sequencia[indice_atual];
                with (instance_find(global.botoes_2[qual], 0)) {
                    ativar_temple();
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
        if (array_length(sequencia) >= 3) {
			
			global.som.tocarSFX(sfx_Genius_Win)
			
			delay_vitoria = room_speed * 1
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
	 
	 if (delay_vitoria > 0) {
        delay_vitoria--;
    } else{
	
    global.cam_override = true;
    global.focus_target = obj_Passage;
	
	obj_Luana.state = Luana_State_Idle
	obj_Luana.can_control = false;
	obj_Luana.hspd = 0
	
	obj_Apollo.state = Apollo_State_Idle
	obj_Apollo.can_control = false;
	obj_Apollo.hspd = 0
	
    with obj_Passage {
        sprite_index = spr_Passage;
        image_index = 0;
        image_speed = 1;
    }
	

    estado = "passagem";
	}
    break;

	case "passagem":
    with obj_Passage {
        if (image_index >= image_number - 1) {
            global.cam_override = false;
			instance_destroy(obj_Genius_Temple);
			sprite_index = spr_Noone
			obj_Apollo.sprite_index = spr_Apollo_Idle
			obj_Apollo.hspd = 0
			obj_Luana.sprite_index = spr_Luana_Idle
			obj_Luana.hspd = 0
			
			instance_destroy();
        }
    }
    break;


   case "erro":
    if (delay_vitoria > 0) {
        delay_vitoria--;
    } else {
		
		 with (obj_Genius_Red_Temple) {
             ativar_temple();
         }
		with (obj_Genius_Blue_Temple) {
            ativar_temple();
        }
		with (obj_Genius_Green_Temple) {
			ativar_temple();
        }
		with (obj_Genius_Yellow_Temple) {
			ativar_temple();
        }
		
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
