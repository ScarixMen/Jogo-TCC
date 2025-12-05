function Pressagio_Idle() {
    sprite_index = spr_Pressagio_Spawner;
    image_speed = 0;
    image_index = 0;

    // Se já existe um Pressagio ativo, não faz nada
    if (instance_exists(obj_Pressagio)) return;

    // Executa inputs se a câmera não estiver em cutscene
    if (!global.cam_override) {
        script_execute(Input_Luana);
        script_execute(Input_Apollo);
    }

    // --- Checagem Apollo ---
    if (instance_exists(obj_Apollo) && point_distance(x, y, obj_Apollo.x, obj_Apollo.y) < 700) {
        if (interact_Apollo) {
            global.som.tocarSFX(sfx_Runa);
            target = obj_Apollo;
            state = Pressagio_Active;
        }
    }

    // --- Checagem Luana ---
    if (instance_exists(obj_Luana) && point_distance(x, y, obj_Luana.x, obj_Luana.y) < 700) {
        if (interact_Luana) {
            global.som.tocarSFX(sfx_Runa);
            target = obj_Luana;
            state = Pressagio_Active;
        }
    }
}


function Pressagio_Active() {
    image_speed = 1;

    // Quando a animação termina, cria o Pressagio real
    if (image_index >= image_number - 1) {
        var inst = instance_create_layer(x, y, "Luminis", obj_Pressagio);
        inst.state = Pressagio_Spawn;
        inst.spawner = id; // <<--- Armazena quem criou o Pressagio
        inst.target = target; // <<--- Passa o alvo corretamente

        sprite_index = spr_Noone;
        state = Pressagio_End;
    }
}


function Pressagio_End() {
    // Pode adicionar efeitos ou partículas se quiser
}