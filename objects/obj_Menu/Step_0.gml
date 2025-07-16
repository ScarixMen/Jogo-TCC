script_execute(Input_Menu);
script_execute(Font);

if (!iniciar_alpha) exit;

if (keyboard_check(ord("R"))) {
    audio_stop_all();
    room_restart();	
}

var input = down - up;

if (input != 0) {
    indice += input;
    larg = larg_ini;
    alt = alt_ini;
	
	global.som.tocarSFX(sfx_Menu_Pass);
	
	var limit = (estado_menu == "principal") ? opc_max : opc_max - 1;

	if (indice > limit) indice = 0;
	if (indice < 0) indice = limit;

}

// Animações visuais
larg = lerp(larg, larg_fim, 0.2);

if (larg > larg_fim - 2) {
    alt = lerp(alt, alt_fim, 0.2);
}

// Ação ao pressionar ENTER
if (enter) {
	
	global.som.tocarSFX(sfx_Menu_Click);
	
    if (estado_menu == "principal") {
        switch (indice) {
            case 0: // Jogar
                room_goto(rm_Tutorial);
                break;

            case 1: // Fases
                opc = ["Tutorial", "Praia", "Floresta", "4", "5", "Voltar"];
                opc_max = array_length(opc);
                indice = 0;
                estado_menu = "fases";
                break;

            case 2: 
                break;

            case 3: // Créditos
                opc = ["Voltar"];
                opc_max = 0;
                indice = 0;
                estado_menu = "creditos";
                mostrar_creditos = true;
                break;

			case opc_max: // botão "Sair" fora do array
				game_end();
				break;
        }
    }
    else if (estado_menu == "fases") {
        switch (indice) {
            case 0:
				room_goto(rm_Tutorial); 
				break;
					
            case 1:
				room_goto(rm_Beach);
                break;
				
            case 2:
				room_goto(rm_Forest);
                break;
				
            case 3: room_goto(rm_Fase4); break;
            case 4: room_goto(rm_Fase5); break;
            case 5:
                estado_menu = "principal";
                opc = opc_principal
                opc_max = array_length(opc);
                indice = 0;
                break;
        }
    }
    else if (estado_menu == "creditos") {
        mostrar_creditos = false;
        estado_menu = "principal";
        opc = opc_principal
        opc_max = array_length(opc);
        indice = 0;
    }
}
