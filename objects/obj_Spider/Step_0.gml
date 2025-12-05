if (Check_Pause()) exit;
// Garantir que cada sequência só seta o sprite UMA VEZ
switch (seq)
{
    // --- DESCER ---
    case 0:
        if (sprite_index != spr_Spider_Down) {
            sprite_index = spr_Spider_Down;
            image_index = 0;       // reset suave
            image_speed = 1;
        }

        if (image_index >= image_number - 1)
        {
            seq = 1;
        }
    break;



    // --- SUBIR ---
    case 1:
        if (sprite_index != spr_Spider_Up) {
            sprite_index = spr_Spider_Up;
            image_index = 0;
            image_speed = 1;
        }

        if (image_index >= image_number - 1)
        {
            pause_timer = room_speed * 2;
            seq = 2;
        }
    break;



    // --- IDLE ---
    case 2:
        if (sprite_index != spr_Spider_Idle) {
            sprite_index = spr_Spider_Idle;
            image_index = 0;
            image_speed = 1;
        }

        pause_timer--;

        if (pause_timer <= 0) {
            seq = 0; // volta pra descer
        }
    break;
}

if place_meeting(x,y,obj_Apollo)
{
	with obj_Apollo{
		if state != Apollo_State_Death_Boca
		{
			image_index = 0
			damage_Apollo()
		
		}
	}
}

if place_meeting(x,y,obj_Luana)
{
	with obj_Luana{
		if state != Luana_State_Death_Boca
		{
			image_index = 0
			damage_Luana()
		
		}
	}
}