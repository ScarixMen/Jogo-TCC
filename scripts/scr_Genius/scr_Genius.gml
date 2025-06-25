function Genius_All_Off() {
    with obj_Genius_Red sprite_index = spr_Genius_Red_Off;
    with obj_Genius_Blue sprite_index = spr_Genius_Blue_Off;
    with obj_Genius_Green sprite_index = spr_Genius_Green_Off;
    with obj_Genius_Yellow sprite_index = spr_Genius_Yellow_Off;
}
function Genius_Idle() {
    Genius_All_Off();
    if obj_Button_Blue_Genius.state == Button_Genius_Press {
        state = Genius_Sequence_1;
        current_index = 0;
        sequence_step = 1;
    }
}
function Genius_Sequence_1() {
    with obj_Genius_Red {
        sprite_index = spr_Genius_Red_On;
        if (image_index >= image_number - 1) {
            image_index = 0;
            sprite_index = spr_Genius_Red_Off;
            with obj_Genius {
                state = Genius_Wait_Player_1;
            }
        }
    }
}
function Genius_Wait_Player_1() {
	with obj_Player{
	    if (place_meeting(x, y, obj_Genius_Red)) {
	        if (keyboard_check_pressed(ord("E"))) {
	            with (obj_Genius_Red) {
	                sprite_index = spr_Genius_Red_On;
	                image_index = 0;
	                image_speed = 0.5;
	            }
	            with (obj_Genius) {
	                state = Genius_Sequence_2;  // avança direto
	                current_index = 0;
	            }
	        }
	    }
	}
}
function Genius_Sequence_2() {
    if (current_index == 0) {
        with obj_Genius_Red {
            sprite_index = spr_Genius_Red_On;
            if (image_index >= image_number - 1) {
                image_index = 0;
                sprite_index = spr_Genius_Red_Off;
                with obj_Genius {
                    current_index = 1;
                }
            }
        }
    }
    else if (current_index == 1) {
        with obj_Genius_Blue {
            sprite_index = spr_Genius_Blue_On;
            if (image_index >= image_number - 1) {
                image_index = 0;
                sprite_index = spr_Genius_Blue_Off;
                with obj_Genius {
                    current_index = 0;
                    state = Genius_Wait_Player_2;
                }
            }
        }
    }
}
function Genius_Wait_Player_2() {
    if (current_index == 0) {
        with obj_Player {
            if (place_meeting(x, y, obj_Genius_Red)) {
                if (keyboard_check_pressed(ord("E"))) {
                  with obj_Genius_Red {
			        sprite_index = spr_Genius_Red_On;
			        image_index = 0;
			        image_speed = 0.5;
			        animando = true;  // Liga a animação!
			    }
                    with obj_Genius {
                        current_index = 1;  // avança para o próximo botão
                    }
                }
            }
        }
    }
    else if (current_index == 1) {
        with obj_Player {
            if (place_meeting(x, y, obj_Genius_Blue)) {
                if (keyboard_check_pressed(ord("E"))) {
                    with obj_Genius_Blue {
                        sprite_index = spr_Genius_Blue_On;
                        image_index = 0;
                        image_speed = 0.5;
						animando = true;  // Liga a animação!
                    }
                    with obj_Genius {
                        current_index = 0;
                        state = Genius_Sequence_3;  // vai para próxima sequência
                    }
                }
            }
        }
    }
}

function Genius_Sequence_3() {
}
