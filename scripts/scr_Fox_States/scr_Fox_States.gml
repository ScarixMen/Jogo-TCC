function Fox_State_Run() {

    sprite_index = spr_Fox_Run;

    // anda só para um lado, para sempre
    x += spd * dir;

    // colisão com Apollo
    if (place_meeting(x, y, obj_Apollo)) {
        with (obj_Apollo) damage_Apollo();
        sprite_index = spr_Vase_False_Disappear;
        image_index = 0;
        state = Fox_State_Disappear;
    }

    // colisão com Luana
    if (place_meeting(x, y, obj_Luana)) {
        with (obj_Luana) damage_Luana();
        sprite_index = spr_Vase_False_Disappear;
        image_index = 0;
        state = Fox_State_Disappear;
    }
	
	if (place_meeting(x, y, obj_Rock_Colision)) {
		sprite_index = spr_Vase_False_Disappear;
        image_index = 0;
        state = Fox_State_Disappear;
	}
}

function Fox_State_Disappear() {
	
	if (image_index >= image_number - 1) {
		
		instance_destroy();
		
	}
	
}
