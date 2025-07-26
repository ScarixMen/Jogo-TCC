room_anterior = noone;
global.som = {
    musica_id: noone,
    ambiente_ids: ds_map_create(),
    sfx_volume: 1,
    bgm_volume: 1,
    amb_volume: 1,

    // 🎵 Tocar música principal
    tocarMusica: function(snd) {
        if (self.musica_id != noone && audio_is_playing(self.musica_id)) {
            audio_stop_sound(self.musica_id);
        }
        self.musica_id = audio_play_sound(snd, 1, true);
        audio_sound_gain(self.musica_id, self.bgm_volume, 0);
    },

    // ⛔ Parar música
    pararMusica: function() {
        if (self.musica_id != noone && audio_is_playing(self.musica_id)) {
            audio_stop_sound(self.musica_id);
            self.musica_id = noone;
        }
    },

    // 🌲 Tocar som ambiente com chave
    tocarAmbiente: function(chave, som) {
        if (ds_map_exists(self.ambiente_ids, chave)) {
            if (audio_is_playing(self.ambiente_ids[? chave])) {
                audio_stop_sound(self.ambiente_ids[? chave]);
            }
        }
        self.ambiente_ids[? chave] = audio_play_sound(som, 0, true);
        audio_sound_gain(self.ambiente_ids[? chave], self.amb_volume, 0);
    },

    // ⛔ Parar som ambiente
    pararAmbiente: function(chave) {
        if (ds_map_exists(self.ambiente_ids, chave)) {
            if (audio_is_playing(self.ambiente_ids[? chave])) {
                audio_stop_sound(self.ambiente_ids[? chave]);
            }
            ds_map_delete(self.ambiente_ids, chave);
        }
    },

    // 💥 Tocar efeito sonoro
	tocarSFX: function(som, vol_relativo) {
	    var volume_rel = (argument_count > 1 && is_real(vol_relativo)) ? vol_relativo : 1;
	    var volume_final;

	    if (is_real(self.sfx_volume)) {
	        volume_final = clamp(self.sfx_volume * volume_rel, 0, 1);
	    } else {
	        volume_final = clamp(volume_rel, 0, 1);
	    }

	    var id_sfx = audio_play_sound(som, 0, false);
	    audio_sound_gain(id_sfx, volume_final, 0);
	}
};
