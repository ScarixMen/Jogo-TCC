function Fox_Spawner_3_State_Idle() {

    sprite_index = spr_Vase_False_3;

    var range = 400; // alcance horizontal

    // Verifica se existe player
    if (!instance_exists(obj_Player)) return;

    // Pega instância real mais próxima
    var player_inst = instance_nearest(x, y, obj_Player);

    // Distância apenas no eixo X
    var d = abs(player_inst.x - x);
	var a = point_distance(x,y,player_inst.x,player_inst.y)<range
	
    if (d <= range &&  a) {
        state = Fox_Spawner_1_State_Spawn;
        sprite_index = spr_Vase_False_Disappear;
        image_index = 0;
    }
}

function Fox_Spawner_3_State_Spawn() {

    sprite_index = spr_Vase_False_Disappear;

    if (image_index >= image_number - 1) {
		global.som.tocarSFX(sfx_Fox_Screen)
        instance_create_layer(x, y, layer, obj_Fox);
        instance_destroy();
    }
}
