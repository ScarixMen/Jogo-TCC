if (!cutscene_started) {
    // Apollo entrou na área (ou já passou dela)
    if (!apollo_ready && place_meeting(x, y, obj_Apollo)) {
        apollo_ready = true;
    }
    
    // Luana entrou na área (ou já passou dela)
    if (!luana_ready && place_meeting(x, y, obj_Luana)) {
        luana_ready = true;
    }

    // Se os dois já chegaram pelo menos uma vez, ativa a cutscene
    if (apollo_ready && luana_ready) {
		with (obj_Genius_Temple) {
			if(estado == "fim") exit;
			if (!ativo) {
				ativo = true;
				estado = "tocando";
				sequencia = [];
				array_push(sequencia, irandom(3));
				indice_entrada = 0;
				indice_atual = 0;
				tempo_atual = 0;
				delay_vitoria = 0;
			}
		}
		instance_destroy();
    }
}
