// No Step do objeto botão
target = noone;

// Procurar por qualquer instância filha que esteja sendo interagida
with (obj_Genius_Main) { // pega todas as instâncias dos filhos, já que eles são filhos do pai
    if (place_meeting(x,y,obj_Apollo)) {
        other.target = id; // define target como a instância encontrada
		other.y = other.target.y - 50
    }
}
if !global.cam_override
{
	with (obj_Beach_Puzzle_Apollo_Main) { // pega todas as instâncias dos filhos, já que eles são filhos do pai
	    if (place_meeting(x,y,obj_Apollo)) {
	        other.target = id; // define target como a instância encontrada
			other.y = other.target.y + 50
	    }
	}
}
if !global.cam_override
{
	with (obj_Beach_Puzzle_Main) { // pega todas as instâncias dos filhos, já que eles são filhos do pai
	    if (place_meeting(x,y,obj_Apollo) and !input) {
	        other.target = id; // define target como a instância encontrada
			other.y = other.target.y + 50
	    }
	}
}


// Se encontrou um alvo, posiciona o botão
if (target != noone) {
    x = target.x + target.sprite_width/2;

    visible = true;
} else {
    visible = false;
}


btn_frame = (btn_frame + btn_speed) mod sprite_get_number(spr_Interact_Button_E);

