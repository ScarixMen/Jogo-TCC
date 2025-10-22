function Anhanga_GetFaceAndAttackTarget(_range) {
    // _range = distância máxima pra criar hitbox
    var target1 = instance_exists(obj_Apollo) ? obj_Apollo : noone;
    var target2 = instance_exists(obj_Luana) ? obj_Luana : noone;

    if (target1 == noone && target2 == noone)
        return noone;

    // --- Distâncias ---
    var dist1 = (target1 != noone) ? point_distance(x, y, target1.x, target1.y) : 999999;
    var dist2 = (target2 != noone) ? point_distance(x, y, target2.x, target2.y) : 999999;

    // --- Escolhe o mais próximo ---
    var target = (dist1 < dist2) ? target1 : target2;

    // --- Vira para o alvo ---
    if (target != noone)
        image_xscale = (target.x > x) ? 1 : -1;

    return target;
}

function Anhanga_State_Idle(){
	
}

function Anhanga_State_Choose_Thicket() {
    // --- Animação de desaparecimento ---
    sprite_index = spr_Anhanga_Disappear;

    if (image_index >= image_number - 1) {
        // Remove hitbox antiga e oculta o sprite
        instance_destroy(obj_Anhanga_Grab_Hitbox);
        sprite_index = spr_Noone;

        // --- Escolher um arbusto aleatório diferente do último ---
        var chosen_thicket = noone;

        if (instance_exists(obj_Thicket)) {
            var tries = 0;

            repeat (10) { // tenta até 10 vezes achar um diferente
                var candidate = choose(instance_find(obj_Thicket, irandom(instance_number(obj_Thicket) - 1)));
                if (candidate.id != last_thicket_id) {
                    chosen_thicket = candidate;
                    break;
                }
                tries++;
            }

            // se não achou nenhum diferente, usa o último mesmo
            if (chosen_thicket == noone) {
                chosen_thicket = instance_find(obj_Thicket, 0);
            }
        }

        // --- Teleporta pro arbusto escolhido ---
        if (instance_exists(chosen_thicket)) {
            x = chosen_thicket.x;
            y = chosen_thicket.y - 50;
            last_thicket_id = chosen_thicket.id; // guarda o último usado
        }

        // --- Troca pro estado de pulo ---
        state = Anhanga_State_Jump_Thicket;
    }
}



function Anhanga_State_Jump_Thicket(){
	
	sprite_index = spr_Anhanga_Jump
	
	if(image_index >= image_number -1)
	{
		
		state = Anhanga_State_Grab_Thicket

	}
	
}
function Anhanga_State_Grab_Thicket(){
	
	sprite_index = spr_Anhanga_Grab
	var target = Anhanga_GetFaceAndAttackTarget(150);
	if(image_index >= image_number -1)
	{
		sinal = (target.x > x) ? 1 : -1;
		var hit = instance_create_layer(x + sinal*50, y, layer, obj_Anhanga_Grab_Hitbox);
		image_speed =   0
		state = Anhanga_State_Choose_Thicket
	}
}

function Anhanga_State_Attack_Spear_Down(){
	
	x = center_x + lengthdir_x(radius, angle);
	y = center_y + lengthdir_y(radius, angle);
	
	timer_down++;
	
	if (timer_down == timer_delay_down)
	{
		sprite_index = spr_Anhanga_Attack_Down
		
	instance_create_layer(center_x - 120, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x - 200, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x - 280, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x - 360, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x - 440, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x - 520, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x - 600, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x - 680, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x - 760, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x - 840, center_y + 700, layer, obj_Spear_Grounded);
													  
	instance_create_layer(center_x + 120, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x + 200, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x + 280, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x + 360, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x + 440, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x + 520, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x + 600, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x + 680, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x + 760, center_y + 700, layer, obj_Spear_Grounded);
	instance_create_layer(center_x + 840, center_y + 700, layer, obj_Spear_Grounded);
	
	obj_Spear_Grounded.image_angle = 180
	
	}

	with(obj_Spear_Grounded)
	{
		
		var spd = 1

		if (y<=6300) 
		{
			
			spd = 0
			
			other.state = Anhanga_State_Waiting;
			
		}


		y-= spd
		
	}
	
}

function Anhanga_State_Attack_Spear_Middle(){
	
	x = center_x + lengthdir_x(radius, angle);
	y = center_y + lengthdir_y(radius, angle);
	
	sprite_index = spr_Anhanga_Attack_Spear
	
	
	if(image_index >= image_number -1)
	{
		instance_create_layer(center_x ,center_y - 300, layer, obj_Spear);
		select_plat = "middle"
		state = Anhanga_State_Waiting
	}
}

function Anhanga_State_Attack_Spear_1(){
	
	sprite_index = spr_Anhanga_Attack_Spear
	
	if(image_index >= image_number -1)
	{
		instance_create_layer(center_x + 400,center_y - 500, layer, obj_Spear);
		instance_create_layer(center_x - 400, center_y - 500, layer, obj_Spear);
		select_plat = "1"
		state = Anhanga_State_Waiting
	}

}

function Anhanga_State_Attack_Spear_2(){
	
	x = center_x + lengthdir_x(radius, angle);
	y = center_y + lengthdir_y(radius, angle);
	
	sprite_index = spr_Anhanga_Attack_Spear
	
	if(image_index >= image_number -1)
	{
		instance_create_layer(center_x - 760, center_y - 600, layer, obj_Spear);
		instance_create_layer(center_x + 760, center_y - 600, layer, obj_Spear);
		select_plat = "2"
		state = Anhanga_State_Waiting
	}

}

function Anhanga_State_Attack_Spear_3(){
	
	x = center_x + lengthdir_x(radius, angle);
	y = center_y + lengthdir_y(radius, angle);
	
	sprite_index = spr_Anhanga_Attack_Spear
	
	if(image_index >= image_number -1)
	{
		instance_create_layer(center_x - 1030, center_y - 700, layer, obj_Spear);
		instance_create_layer(center_x + 1030, center_y - 700, layer, obj_Spear);
		select_plat = "3"
		state = Anhanga_State_Waiting
	}

}
function Anhanga_State_Attack_Spear_4(){
	
	x = center_x + lengthdir_x(radius, angle);
	y = center_y + lengthdir_y(radius, angle);
	
	sprite_index = spr_Anhanga_Attack_Spear

	if(image_index >= image_number -1)
	{
		instance_create_layer(center_x - 560, center_y - 800, layer, obj_Spear);
		instance_create_layer(center_x + 560, center_y - 800, layer, obj_Spear);
		select_plat = "4"
		state = Anhanga_State_Waiting
	}

}

function Anhanga_State_Waiting(){
	
	x = center_x + lengthdir_x(radius, angle);
	y = center_y + lengthdir_y(radius, angle);
	
	timer++;
	sprite_index = spr_Anhanga_Idle
	
	if (timer >= timer_delay)
	{
		
		switch select_plat
		{
			case "middle":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_1
				image_index = 0
			
			break;
			
			case "1":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_2
				image_index = 0
			
			break;
			
			case "2":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_3
				image_index = 0
				
			break;
			
			case "3":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_4
				image_index = 0
				
			break;
			
			case "4":
			
				timer = 0
				state = Anhanga_State_Attack_Spear_Middle
				image_index = 0
				
			break;
			
		}
		
	}
}