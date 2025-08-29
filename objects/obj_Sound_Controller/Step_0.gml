if(keyboard_check_pressed(ord("M")))  global.som.set_bgm_volume(0)


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
		case rm_Menu:
			global.som.tocarMusica(bgm_Menu);
			global.som.pararAmbiente("forest");
			global.som.pararAmbiente("ocean");
			
            break;
		
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
			
		case rm_Forest:
			global.som.tocarMusica(bgm_Sunset);
			global.som.pararAmbiente("ocean");
			global.som.tocarAmbiente("forest", bgm_Forest);
			
            break;

        // Adicione outros cases para outras rooms/fases

        default:
            // Pode parar música e sons ou deixar como está
            break;
    }
}

if (global.som.fade_ativo) {
    global.som.fade_progresso += delta_time / 1000000;
    var t = (global.som.fade_tempo > 0)
        ? clamp(global.som.fade_progresso / global.som.fade_tempo, 0, 1)
        : 1;

    if (global.som.fade_tipo == "in") {
        audio_sound_gain(global.som.musica_id, lerp(0, global.som.bgm_volume, t), 0);
        if (t >= 1) global.som.fade_ativo = false;

    } else if (global.som.fade_tipo == "out") {
        audio_sound_gain(global.som.musica_id, lerp(global.som.bgm_volume, 0, t), 0);
        if (t >= 1) {
            audio_stop_sound(global.som.musica_id);
            global.som.musica_id = noone;
            global.som.fade_ativo = false;
        }
    }
}


