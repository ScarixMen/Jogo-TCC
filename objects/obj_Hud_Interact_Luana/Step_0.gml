// No Step do objeto botão
target = noone;


// Procurar por qualquer instância filha que esteja sendo interagida
with (obj_Genius_Main) { // pega todas as instâncias dos filhos, já que eles são filhos do pai
    if (place_meeting(x,y,obj_Luana)) {
        other.target = id; // define target como a instância encontrada
		other.y = other.target.y - 70
		other.x = other.target.x + target.sprite_width/2
    }
}

with (obj_Luana) { // pega todas as instâncias dos filhos, já que eles são filhos do pai
    if state = Luana_State_Push_Niobio {
        other.target = id; // define target como a instância encontrada
		other.y = other.target.y - 250
		other.x = other.target.x
    }
}
// Se encontrou um alvo, posiciona o botão


btn_frame = (btn_frame + btn_speed) mod sprite_get_number(spr_Interact_Button_X);

if (target != noone) {
	
    visible = true;
} else {
    visible = false;
}
