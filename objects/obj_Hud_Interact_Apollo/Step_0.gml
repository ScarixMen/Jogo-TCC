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
	with (obj_Forest_Puzzle_Main) { // pega todas as instâncias dos filhos, já que eles são filhos do pai
	    if (place_meeting(x,y,obj_Apollo) and !input) {
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

if(room = rm_Forest){
	if(obj_Dialog_Trigger_Ravi.duo_ready)
	{
	
		with (obj_Things_Of_Ravi) { // pega todas as instâncias dos filhos, já que eles são filhos do pai
		    if (place_meeting(x,y,obj_Apollo) && state != Ravi_Things_Deactive) {
		        other.target = id; // define target como a instância encontrada
				other.y = other.target.y - 50
				other.x = other.target.x + other.target.sprite_width/2
		    }
		}
	}
}

if !global.cam_override
{
	with (obj_Luana) { // pega todas as instâncias dos filhos, já que eles são filhos do pai
	    if(point_distance(x, y, obj_Apollo.x, obj_Apollo.y) < 300 and state == Luana_State_Moth_Attack) {
	        other.target = id; // define target como a instância encontrada
			other.y = other.target.y - 350
	    }
	}
}

// Se encontrou um alvo, posiciona o botão
if (target != noone) {
    x = target.x + target.sprite_width/2;
	if (target == obj_Luana.id) x = target.x
    visible = true;
} else {
    visible = false;
}


btn_frame = (btn_frame + btn_speed) mod sprite_get_number(spr_Interact_Button_E);

