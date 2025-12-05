function Moth_Follow_Movement(){
    if (!instance_exists(target)) return;
	
    // Posição alvo
    var tx = target.x;
    var ty = target.y - 230;

    // Direção de movimento
    var dir = point_direction(base_x, base_y, tx, ty);

    // Seguir o alvo
    if (point_distance(base_x, base_y, tx, ty) < 1300) {
        base_x += lengthdir_x(spd, dir);
        base_y += lengthdir_y(spd, dir);
    }

    // Flutuação
    osc += 0.12;
    var offset_y = sin(osc) * 20;

    x = base_x;
    y = base_y + offset_y;

    // Virar pro alvo
    image_xscale = (tx < x) ? 1 : -1;
}

function Moth_State_Idle(){
	
	sprite_index = spr_Moth
	
	var tx = target.x;
    var ty = target.y - 200;
	
	 // Flutuação
    osc += 0.12;
    var offset_y = sin(osc) * 20;

    x = base_x;
    y = base_y + offset_y;
	
	if(point_distance(x,y,target.x,target.y)<=700)
	{
		
		state = Moth_State_Follow
		
	}
	
}

function Moth_State_Follow() {
    sprite_index = spr_Moth;
    
    if (target == noone) {
        state = Moth_State_Idle;
        exit;
    }
    
    Moth_Follow_Movement();
    
    if (place_meeting(x, y, obj_Player)) {
        state = Moth_State_Attack;
        
        if (target == obj_Apollo) {
            select_target = 1;
            apollo_pego = true;
            target.state = Apollo_State_Moth_Attack;
        } else {
            select_target = 2;
            luana_pego = true;
            target.state = Luana_State_Moth_Attack;
        }
    }
}

function Moth_State_Attack() {

    // Se os dois foram pegos → matar ambos
    if (apollo_pego && luana_pego) {
        with (obj_Apollo) {
            state = Apollo_State_Death;
        }
        with (obj_Luana) {
            state = Luana_State_Death;
        }
        
        instance_destroy(); // Destroya o moth
        exit;
    }

    sprite_index = spr_Noone;

    // Se está atacando o Apollo
    if (select_target == 1) {
        with (obj_Apollo) {
            script_execute(Input_Luana);

            if (point_distance(x, y, obj_Luana.x, obj_Luana.y) < 300 && interact_Luana) {
                instance_destroy(other);
                sprite_index = spr_Apollo_Moth_Reset;
                image_index = 0;
                apollo_pego = false;
                state = Apollo_State_Moth_Reset;
            }
        }

    // Se está atacando a Luana
    } else {
        with (obj_Luana) {
            script_execute(Input_Apollo);

            if (point_distance(x, y, obj_Apollo.x, obj_Apollo.y) < 300 && interact_Apollo) {
                instance_destroy(other);
                sprite_index = spr_Luana_Moth_Reset;
                image_index = 0;
                luana_pego = false;
                state = Luana_State_Moth_Reset;
            }
        }
    }
}
