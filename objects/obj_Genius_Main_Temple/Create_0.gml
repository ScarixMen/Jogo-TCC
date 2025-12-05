function ativar_temple() {
    if (obj_Genius_Temple.estado != "erro") {
        switch (id_botao) {
            case 0: global.som.tocarSFX(sfx_Genius_1); break;
            case 1: global.som.tocarSFX(sfx_Genius_2); break;
            case 2: global.som.tocarSFX(sfx_Genius_3); break;
            case 3: global.som.tocarSFX(sfx_Genius_4); break;
        }
    }

    ativo = true;
    timer = room_speed * 0.5;
    image_index = 0;
    image_speed = 1;
}

image_index = 0
image_speed = 0
id_botao = 0; // Mude de 0 a 3 em cada um
ativo = false;
btn_frame = 0;
btn_speed = 0.2; // velocidade da animação
timer = 0;

