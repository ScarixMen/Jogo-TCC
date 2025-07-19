script_execute(Input_Menu);
script_execute(Input_Player);

if (pause) {
    switch (pause_state) {
        case "normal":
            pause_state = "entering";
            pause_frame = 0;
            break;

        case "paused":
            pause_state = "exiting";
            pause_frame = 0;
            break;
    }
}

// Entering animation
if (pause_state == "entering") {
    pause_frame += pause_speed;
	audio_pause_all();
	global.pause = true;
	
    if (pause_frame >= sprite_get_number(spr_Portrait_Pause) - 1) {
        pause_frame = sprite_get_number(spr_Portrait_Pause) - 1;
        pause_state = "paused";
        
    }
}

// Exiting animation
else if (pause_state == "exiting") {
    pause_frame += pause_speed;

    if (pause_frame >= sprite_get_number(spr_Portrait_Pause_Reset) - 1) {
        pause_frame = 0;
        pause_state = "normal";
		audio_resume_all();
        global.pause = false;
    }
}

if (pause_state == "paused") {
    var input = down - up;

    if (input != 0) {
        indice += input;
        larg = larg_ini;
        alt = alt_ini;

        global.som.tocarSFX(sfx_Menu_Pass);

        var limit = opc_max - 1;
        if (indice > limit) indice = 0;
        if (indice < 0) indice = limit;
    }

    if (enter) {
		
		global.som.tocarSFX(sfx_Menu_Click);
		
        switch (opc[indice]) {
            case "Continue":
                pause_state = "exiting";
                pause_frame = 0;
                break;

            case "Opçoes":
                // Abrir tela de opções ou mudar estado
                break;

            case "Menu":
                room_goto(rm_Menu);
				global.pause = false;
                break;
        }
    }
}

larg = lerp(larg, larg_fim, 0.2);

if (larg > larg_fim - 2) {
    alt = lerp(alt, alt_fim, 0.2);
}
