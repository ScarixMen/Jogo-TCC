// No Step do objeto botão
target = noone;

// Procurar por qualquer instância filha que esteja sendo interagida
with (obj_Genius_Main) {
    if (place_meeting(x,y,obj_Apollo)) {
        other.target = id;
        other.y = other.target.y - 50;
    }
}

with (obj_Genius_Main_Temple) {
    if (place_meeting(x,y,obj_Apollo)) {
        other.target = id;
        other.y = other.target.y - 50;
    }
}

with (obj_Temple_Puzzle_Apollo_Main) {
    if (place_meeting(x,y,obj_Apollo)) {
        other.target = id;
        other.y = other.target.y + 50;
    }
}

if (!global.cam_override)
with (obj_Beach_Puzzle_Apollo_Main) {
    if (place_meeting(x,y,obj_Apollo)) {
        other.target = id;
        other.y = other.target.y + 50;
    }
}

if (!global.cam_override)
with (obj_Plataform_Lumini) {
    if (point_distance(x,y,obj_Apollo.x,obj_Apollo.y) < 300) {
        other.target = id;
        other.y = other.target.y - 125;
    }
}

if (!global.cam_override)
with (obj_Forest_Puzzle_Main) {
    if (place_meeting(x,y,obj_Apollo) and !input) {
        other.target = id;
        other.y = other.target.y + 50;
    }
}

if (!global.cam_override)
with (obj_Beach_Puzzle_Main) {
    if (place_meeting(x,y,obj_Apollo) and !input) {
        other.target = id;
        other.y = other.target.y + 50;
    }
}

if (room == rm_Forest && obj_Dialog_Trigger_Ravi.duo_ready)
with (obj_Things_Of_Ravi) {
    if (place_meeting(x,y,obj_Apollo) && state != Ravi_Things_Deactive) {
        other.target = id;
        other.y = other.target.y - 50;
        other.x = other.target.x + other.target.sprite_width / 2;
    }
}

if (!global.cam_override)
with (obj_Luana) {
    if (point_distance(x,y,obj_Apollo.x,obj_Apollo.y) < 450 && state == Luana_State_Moth_Attack) {
        other.target = id;
        other.y = other.target.y - 350;
    }
}


// POSICIONAR HUD (CORRIGIDO)
if (target != noone) {

    // CENTRALIZAÇÃO NORMAL
    x = target.x + target.sprite_width * 0.5;

    // EXCEÇÕES CORRETAS
    if (target == obj_Luana.id || object_get_name(target.object_index) == "obj_Plataform_Lumini") {
        x = target.x;
    }

    visible = true;
} 
else {
    visible = false;
}


// ANIMAÇÃO
btn_frame = (btn_frame + btn_speed) mod sprite_get_number(spr_Interact_Button_E);
