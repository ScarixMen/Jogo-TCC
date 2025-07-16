// Detecta troca de room
if (room != room_anterior) {
    room_anterior = room;
    ReconfigurarSomPorRoom();
}

// Verifica se a música foi interrompida (por room_restart por exemplo)
if (!audio_is_playing(global.som.musica_id)) {
    // Reforça a música da room atual
    ReconfigurarSomPorRoom();
}


function ReconfigurarSomPorRoom() {
	switch(room) {
		case rm_Beach:
			global.som.tocarMusica(bgm_The_Moon);
			global.som.tocarAmbiente("forest", bgm_Forest);
			global.som.tocarAmbiente("ocean", bgm_Ocean_Ambience);
	
            break;

		case rm_Tutorial:
			global.som.tocarMusica(bgm_The_Breeze);
			global.som.tocarAmbiente("ocean", bgm_Ocean_Ambience);
			global.som.pararAmbiente("forest");
			
            break;

        // Adicione outros cases para outras rooms/fases

        default:
            // Pode parar música e sons ou deixar como está
            break;
    }
}
