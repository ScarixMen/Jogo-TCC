script_execute(Input_Menu);
script_execute(Font);

if (!iniciar_alpha) exit;

if (keyboard_check(ord("R"))) {
    audio_stop_all();
    room_restart();	
}

// Define os itens do menu de opções (uma vez só)
if (estado_menu == "opcoes") {
    opc = ["Efeitos", "Música", "Ambiente", "Voltar"];
    opc_max = array_length(opc);
}

// Input de movimentação
var input = down - up;

if (input != 0) {
    indice += input;
    global.som.tocarSFX(sfx_Menu_Pass);
    
	var limit = (estado_menu == "principal") ? opc_max : opc_max - 1;
    if (indice > limit) indice = 0;
    if (indice < 0) indice = limit;
    
    // Reset do tamanho dos botões
    larg = larg_ini;
    alt = alt_ini;
}

// Controle de volume apenas no menu de opções
if (estado_menu == "opcoes") {
    var step = 0.1;

	if (keyboard_check_pressed(vk_right)) {
	    global.som.tocarSFX(sfx_Menu_Click);
	    switch (indice) {
	        case 0: 
	            global.som.sfx_volume = clamp(global.som.sfx_volume + step, 0, 1);
	            break;

	        case 1: 
	            global.som.set_bgm_volume(global.som.bgm_volume + step);
	            break;

	        case 2: 
	            global.som.set_amb_volume(global.som.amb_volume + step);
	            break;
	    }
	}

	if (keyboard_check_pressed(vk_left)) {
	    global.som.tocarSFX(sfx_Menu_Click);
	    switch (indice) {
	        case 0: 
	            global.som.sfx_volume = clamp(global.som.sfx_volume - step, 0, 1);
	            break;

	        case 1: 
	            global.som.set_bgm_volume(global.som.bgm_volume - step);
	            break;

	        case 2: 
				if (variable_global_exists("som") && is_struct(global.som)) {
					global.som.set_amb_volume(global.som.amb_volume - step);
				}
	            break;
	    }
	}
}

// Animações visuais
larg = lerp(larg, larg_fim, 0.2);
if (larg > larg_fim - 2) {
    alt = lerp(alt, alt_fim, 0.2);
}

// Ação ao pressionar ENTER
if (enter) {

    switch (estado_menu) {
		
        case "principal":
			global.som.tocarSFX(sfx_Menu_Click);
            switch (indice) {
                case 0:
                    room_goto(rm_Tutorial);
                    break;
                case 1:
                    opc = ["Tutorial", "Praia", "Floresta", "4", "5", "Voltar"];
                    opc_max = array_length(opc);
                    indice = 0;
                    estado_menu = "fases";
                    break;
                case 2:
                    opc = ["Efeitos", "Música", "Ambiente", "Voltar"];
                    opc_max = array_length(opc);
                    indice = 0;
                    estado_menu = "opcoes";
                    mostrar_creditos = false;
                    break;
                case 3:
                    opc = ["Voltar"];
                    opc_max = 1;
                    indice = 0;
                    estado_menu = "creditos";
                    mostrar_creditos = true;
                    break;
                case 4:
			    game_end();
			    break;

            }
            break;

        case "fases":
		
			global.som.tocarSFX(sfx_Menu_Click);
            switch (indice) {
                case 0: room_goto(rm_Tutorial); break;
                case 1: room_goto(rm_Beach); break;
                case 2: room_goto(rm_Forest); break;
                case 3: room_goto(rm_Fase4); break;
                case 4: room_goto(rm_Fase5); break;
                case 5:
                    estado_menu = "principal";
                    opc = opc_principal;
                    opc_max = array_length(opc);
                    indice = 0;
                    break;
            }
            break;

        case "opcoes":
            if (indice == 3) {
				global.som.tocarSFX(sfx_Menu_Click);
                estado_menu = "principal";
                opc = opc_principal;
                opc_max = array_length(opc);
                indice = 0;
            }
            break;

        case "creditos":
			
			global.som.tocarSFX(sfx_Menu_Click);
            mostrar_creditos = false;
            estado_menu = "principal";
            opc = opc_principal;
            opc_max = array_length(opc);
            indice = 0;
            break;
    }
}
