script_execute(Input_Luana)
script_execute(Input_Apollo)
if (ativo) {
    timer--;

    // Quando acabar o tempo, volta para o primeiro frame
    if (timer <= 0) {
        ativo = false;
        image_index = 0;
        image_speed = 0;
    }
}
function ativar() {
	
	switch (id_botao){
			
			case 0 : 
				global.som.tocarSFX(sfx_Genius_1)
			break;
			
			case 1 : 
				global.som.tocarSFX(sfx_Genius_2)
			break;
			
			case 2 : 
				global.som.tocarSFX(sfx_Genius_3)
			break;
			
			case 3 : 
				global.som.tocarSFX(sfx_Genius_4)
			break;
		
		}
	
    ativo = true;
    timer = room_speed * 0.5 ;

    image_index = 0;
    image_speed = 1; 
	//show_debug_message("Ativando botão: " + string(id_botao));

}
if (place_meeting(x, y, obj_Luana)) {
    if (interact_Luana) {
        // Só reage se o controlador estiver esperando entrada
        with (obj_Genius) {
            if (estado == "entrada") {
                if (other.id_botao == sequencia[indice_entrada]) {
                    // Acertou esse botão
                    indice_entrada++;

                    if (indice_entrada >= array_length(sequencia)) {
                        estado = "vitoria"; // Vai gerar nova sequência no próximo Step
                    }
                } else {
					
                    estado = "erro"; // Errou
                }
            }
        }

        // Ativa animação do botão
        ativar();
    }
}

if (place_meeting(x, y, obj_Apollo)) {
    if (interact_Apollo) {
        // Só reage se o controlador estiver esperando entrada
        with (obj_Genius) {
            if (estado == "entrada") {
                if (other.id_botao == sequencia[indice_entrada]) {
                    // Acertou esse botão
                    indice_entrada++;

                    if (indice_entrada >= array_length(sequencia)) {
                        estado = "vitoria"; // Vai gerar nova sequência no próximo Step
                    }
                } else {
                    estado = "erro"; // Errou
                }
            }
        }

        // Ativa animação do botão
        ativar();
    }
}


