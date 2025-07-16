function Plataform_Idle() {
    sprite_index = spr_Plataform_Portrait;

    if (instance_exists(colisao)) {
        instance_destroy(colisao);
        colisao = noone;
    }

    pronta = true;
}


function Plataform_Appear() {
    sprite_index = spr_Plataform_Appear;
	 if (!instance_exists(colisao)) {
            colisao = instance_create_layer(x, y, layer, obj_Plataform_Collision);
     }
	 
    if (image_index >= sprite_get_number(sprite_index) - 1) {
        pronta = true;
        image_index = sprite_get_number(sprite_index) - 1;
    } else {
        pronta = false;
    }
}

function Plataform_Disappear() {
    sprite_index = spr_Plataform_Disappear;
    pronta = false;

    if (image_index >= sprite_get_number(sprite_index) - 1) {
        if (instance_exists(colisao)) {
            instance_destroy(colisao);
            colisao = noone;
        }
        //image_index = 0;
        state = Plataform_Idle;
        pronta = true;
    }
}
