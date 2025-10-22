room_anterior = noone;
global.som = {
    musica_id: noone,
    ambiente_ids: ds_map_create(),
    sfx_volume: 1,
    bgm_volume: 0,
    amb_volume: 0,
    fade_ativo: false,
    fade_tipo: "", // "in" ou "out"
    fade_tempo: 0,
    fade_progresso: 0,

    // ===== Funções de Volume =====
    set_bgm_volume: function(novo_volume) {
        self.bgm_volume = clamp(novo_volume, 0, 1);
        if (self.musica_id != noone && audio_is_playing(self.musica_id)) {
            audio_sound_gain(self.musica_id, self.bgm_volume, 0);
        }
    },

    set_amb_volume: function(novo_volume) {
	    // Atualiza o valor global do volume
	    self.amb_volume = clamp(novo_volume, 0, 1);

	    // Se houver sons ativos, aplica o novo volume
	    if (!variable_instance_exists(self, "ambiente_ids")) return;
	    if (self.ambiente_ids == undefined) return;

	    if (ds_map_size(self.ambiente_ids) > 0) {
	        var keys = ds_map_keys(self.ambiente_ids);
	        for (var i = 0; i < array_length(keys); i++) {
	            var key = keys[i];
	            var snd_id = self.ambiente_ids[? key];
	            if (audio_is_playing(snd_id)) {
	                audio_sound_gain(snd_id, self.amb_volume, 0);
	            }
	        }
	    }
	},


    // ===== Música =====
    tocarMusicaFade: function(snd, tempo) {
        if (self.musica_id != noone && audio_is_playing(self.musica_id)) {
            audio_stop_sound(self.musica_id);
        }
        self.musica_id = audio_play_sound(snd, 1, true);
        audio_sound_gain(self.musica_id, 0, 0);

        self.fade_ativo = true;
        self.fade_tipo = "in";
        self.fade_tempo = max(0.01, tempo);
        self.fade_progresso = 0;
    },

    tocarMusicaNiobio: function(snd) {
        if (self.musica_id != noone && audio_is_playing(self.musica_id)) {
            audio_stop_sound(self.musica_id);
        }
        audio_sound_set_track_position(snd, 26); // começa no segundo 26
        self.musica_id = audio_play_sound(snd, 1, true);
        audio_sound_gain(self.musica_id, self.bgm_volume, 0);
    },

    tocarMusica: function(snd) {
        if (self.musica_id != noone && audio_is_playing(self.musica_id)) {
            audio_stop_sound(self.musica_id);
        }
        self.musica_id = audio_play_sound(snd, 1, true);
        audio_sound_gain(self.musica_id, self.bgm_volume, 0);
    },

    pararMusica: function() {
        if (self.musica_id != noone && audio_is_playing(self.musica_id)) {
            audio_stop_sound(self.musica_id);
            self.musica_id = noone;
        }
    },

    PararMusicaFade: function(tempo) {
        if (self.musica_id != noone && audio_is_playing(self.musica_id)) {
            self.fade_ativo = true;
            self.fade_tipo = "out";
            self.fade_tempo = max(0.01, tempo);
            self.fade_progresso = 0;
        }
    },

    // ===== Ambiente =====
    tocarAmbiente: function(chave, som) {
        if (variable_instance_exists(self, "ambiente_ids") && self.ambiente_ids != undefined) {
            if (ds_map_exists(self.ambiente_ids, chave)) {
                if (audio_is_playing(self.ambiente_ids[? chave])) {
                    audio_stop_sound(self.ambiente_ids[? chave]);
                }
            }
            self.ambiente_ids[? chave] = audio_play_sound(som, 0, true);
            audio_sound_gain(self.ambiente_ids[? chave], self.amb_volume, 0);
        }
    },

    pararAmbiente: function(chave) {
        if (variable_instance_exists(self, "ambiente_ids") && self.ambiente_ids != undefined) {
            if (ds_map_exists(self.ambiente_ids, chave)) {
                if (audio_is_playing(self.ambiente_ids[? chave])) {
                    audio_stop_sound(self.ambiente_ids[? chave]);
                }
                ds_map_delete(self.ambiente_ids, chave);
            }
        }
    },

    // ===== Efeitos sonoros =====
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
