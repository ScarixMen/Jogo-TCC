if !iniciar_alpha
{

	exit
	
}

if keyboard_check(ord("R"))
{
	audio_stop_all()
	room_restart();	
	
}

	var up = keyboard_check_pressed(vk_up)
	var down = keyboard_check_pressed(vk_down)
	var enter = keyboard_check_pressed(vk_enter)

	var input = down - up

	if input != 0
	{

		indice += input
		larg = larg_ini
		alt = alt_ini
		
	}
	if indice > opc_max -1
	{
	
		indice = 0
	
	} 
	if indice < 0
	{
	
		indice = opc_max -1
	
	}


larg = lerp(larg, larg_fim,.2)

if larg > larg_fim -2
{
	
	alt = lerp(alt, alt_fim,.2)

}
if(enter)
{

    if (estado_menu == "principal") {
        switch (indice) {
            case 0:
                room_goto(rm_Tutorial);
                break;

            case 1:
				
                opc = ["Tutorial", "Praia", "Floresta", "4", "5","Voltar"];
                opc_max = array_length(opc);
                indice = 0;
                estado_menu = "fases";
                break;

            case 3:
			    opc = ["Voltar"];
			    opc_max = 0;
			    indice = 0;
			    estado_menu = "creditos";
			break;


            case 4:
                game_end();
                break;
        }
    }
    else if (estado_menu == "fases") {
        switch (indice) {
            case 0: room_goto(rm_Tutorial); break;
            case 1: room_goto(rm_Beach); break;
            case 2: room_goto(rm_Forest); break;
            case 3: room_goto(rm_Fase4); break;
            case 4: room_goto(rm_Fase5); break;
			case 5:
			mostrar_creditos = false;
	        estado_menu = "principal";
	        opc = ["Jogar", "Fases", "Opções", "Créditos", "Sair"];
	        opc_max = array_length(opc);
	        indice = 0;
			break;
        }
    }
    else if (estado_menu == "creditos") {
        // Pressionar Enter no botão Voltar
        mostrar_creditos = false;
        estado_menu = "principal";
        opc = ["Jogar", "Fases", "Opções", "Créditos", "Sair"];
        opc_max = array_length(opc);
        indice = 0;
    }
}
