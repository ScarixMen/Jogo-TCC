script_execute(Input_Menu);
script_execute(Font);

if (!iniciar_alpha) exit;

if (keyboard_check(ord("R"))) {
    audio_stop_all();
    room_restart();	
}

// Voltar pro menu principal ao apertar ESC
if (back) {
    switch (estado_menu) {
        case "fases":
        case "opcoes":
        case "creditos":
            global.som.tocarSFX(sfx_Menu_Click); // som de clique
            estado_menu = "principal";
            opc = opc_principal; // array de opções do menu principal
            opc_max = array_length(opc);
            indice = 0;
            mostrar_creditos = false; // caso venha dos créditos
            break;
    }
}

// Define os itens do menu de opções (uma vez só)
if (estado_menu == "opcoes") {
    opc = ["Efeitos", "Música", "Ambiente"];
    opc_max = array_length(opc);
}

// Input de movimentação
var input = down - up;

if (input != 0) {
    indice += input;
    global.som.tocarSFX(sfx_Menu_Pass);
    
    var limit = opc_max; // agora sempre conta +1 pro botão extra
    if (indice > limit) indice = 0;
    if (indice < 0) indice = limit;
    
    // Reset do tamanho dos botões
    larg = larg_ini;
    alt = alt_ini;
}
#region Créditos - Passar de tela (Step Event)
if (estado_menu == "creditos") {
    if (keyboard_check_pressed(vk_right)) { // seta direita
        credit_index += 1;
        if (credit_index >= array_length(Bee)) credit_index = array_length(Bee) - 1; // limita
    }
    if (keyboard_check_pressed(vk_left)) { // seta esquerda
        credit_index -= 1;
        if (credit_index < 0) credit_index = 0;
    }
}
#endregion


// Controle de volume apenas no menu de opções
if (estado_menu == "opcoes") {
    var step = 0.1;

	if (right) {
	    global.som.tocarSFX(sfx_Menu_Click);
	    switch (indice) {
	        case 0: global.som.sfx_volume = clamp(global.som.sfx_volume + step, 0, 1); break;
	        case 1: global.som.set_bgm_volume(global.som.bgm_volume + step); break;
	        case 2: global.som.set_amb_volume(global.som.amb_volume + step); break;
	    }
	}

	if (left) {
	    global.som.tocarSFX(sfx_Menu_Click);
	    switch (indice) {
	        case 0: global.som.sfx_volume = clamp(global.som.sfx_volume - step, 0, 1); break;
	        case 1: global.som.set_bgm_volume(global.som.bgm_volume - step); break;
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
            if (indice < opc_max) {
                global.som.tocarSFX(sfx_Menu_Click);
                switch (indice) {
                    case 0: room_goto(rm_Cutscene); break;
                    case 1:
                        opc = ["Tutorial", "Praia", "Floresta", "Templo", "Insula"];
                        opc_max = array_length(opc);
                        indice = 0;
                        estado_menu = "fases";
                        break;
                    case 2:
                        opc = ["Efeitos", "Música", "Ambiente"];
                        opc_max = array_length(opc);
                        indice = 0;
                        estado_menu = "opcoes";
                        mostrar_creditos = false;
                        break;
                    case 3:
                        opc = []; // créditos só usam botão voltar separado
                        opc_max = 0;
                        indice = 0;
                        estado_menu = "creditos";
                        mostrar_creditos = true;
                        break;
                }
            }
            else if (indice == opc_max) {
                // Botão SAIR
                global.som.tocarSFX(sfx_Menu_Click);
                game_end();
            }
            break;

        case "fases":
            if (indice < opc_max) {
                global.som.tocarSFX(sfx_Menu_Click);
                switch (indice) {
                    case 0: room_goto(rm_Tutorial); break;
                    case 1: room_goto(rm_Beach); break;
                    case 2: room_goto(rm_Forest); break;
                    case 3: room_goto(rm_Temple); break;
                    case 4: room_goto(rm_Boss); break;
                }
            }
            else if (indice == opc_max) {
                // Botão VOLTAR
                global.som.tocarSFX(sfx_Menu_Click);
                estado_menu = "principal";
                opc = opc_principal;
                opc_max = array_length(opc);
                indice = 0;
            }
            break;

        case "opcoes":
            if (indice == opc_max) {
                // Botão VOLTAR
                global.som.tocarSFX(sfx_Menu_Click);
                estado_menu = "principal";
                opc = opc_principal;
                opc_max = array_length(opc);
                indice = 0;
            }
            break;

        case "creditos":
            if (indice == opc_max) {
                // Botão VOLTAR
                global.som.tocarSFX(sfx_Menu_Click);
                mostrar_creditos = false;
                estado_menu = "principal";
                opc = opc_principal;
                opc_max = array_length(opc);
                indice = 0;
            }
            break;
    }
}