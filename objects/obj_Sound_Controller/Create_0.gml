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
    tocarSFX: function(som) {
        var_id_sfx = audio_play_sound(som, 0, false);
        audio_sound_gain(var_id_sfx, self.sfx_volume, 0);
    }
};
