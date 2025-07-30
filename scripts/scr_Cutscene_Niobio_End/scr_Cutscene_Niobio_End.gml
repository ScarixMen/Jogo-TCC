/// @description Cutscene da luta contra Niobio
/// @param other - obj_CutsceneManager que controla

function scr_Cutscene_Niobio_End(other) {
    var ctrl = other;

    switch(ctrl.cutscene_step) {

        case 0: // Desabilitar controle
            obj_Apollo.can_control = false;
            obj_Luana.can_control = false;
            obj_Niobio.can_control = false;
			// Força estados de cutscene
			global.cam_override = true;
            global.focus_target = obj_Niobio;
			obj_Niobio.state = Niobio_State_Cutscene;
			obj_Apollo.state = Apollo_State_Cutscene;
			obj_Luana.state  = Luana_State_Cutscene;

            ctrl.cutscene_step++;
            break;
		case 1: // Cria diálogo "Niobio_Idle_1"
            if (!global.dialog) {
				obj_Niobio.sprite_index = spr_Niobio_Idle
                var d2 = instance_create_layer(obj_Niobio.x, obj_Niobio.y, "dialog", obj_Dialog);
                d2.npc_name = "Niobio_End";
                global.dialog = true;
                ctrl.cutscene_step++;
				
            }
            break;
			
		case 2: // Espera diálogo "Niobio_Idle_1" fechar
            if (!global.dialog) {
                ctrl.cutscene_step++;
            }
            break;
		
		case 3:
		    var niobio_ok = scr_Move_To_Point_Cutscene(obj_Niobio, 31550, 2, spr_Niobio_Run, spr_Niobio_Idle);
		    if (niobio_ok) {
		        ctrl.cutscene_timer = room_speed*0.5;
		        ctrl.cutscene_step++;
		    }
			
			break;


        case 4: // Espera e cria diálogo "Niobio_Statue"
            ctrl.cutscene_timer--;
            if (ctrl.cutscene_timer <= 0) {
				
				obj_Niobio.state = Niobio_State_Jump_A
	            ctrl.cutscene_timer = room_speed*2; // pausa 1 segundo após pular
	            ctrl.cutscene_step++;
            }
            break;

        case 5: // Espera diálogo "Niobio_Statue" terminar e muda estado para Idl
			 ctrl.cutscene_timer--;
	            if (ctrl.cutscene_timer <= 0) {
					with obj_Niobio {
						state = Niobio_State_Cutscene
		                sprite_index = spr_Niobio_Reset
	
						image_xscale = -1
	
						if(image_index >= image_number -1 )
						{
							sprite_index = spr_Niobio_Statue
							ctrl.cutscene_timer = room_speed*1
							ctrl.cutscene_step++;
							
						}
					}
				}
            break;
			
		case 6: // Espera diálogo "Niobio_Statue" terminar e muda estado para Idl
			ctrl.cutscene_timer--;
				image_index = 0
				sprite_index = spr_Niobio_Statue
			if (ctrl.cutscene_timer <= 0) {
				with obj_Niobio {

			
						if (!global.dialog) {
				                var d2 = instance_create_layer(obj_Niobio.x, obj_Niobio.y, "dialog", obj_Dialog);
				                d2.npc_name = "Niobio_End_2";
				                global.dialog = true;
								ctrl.cutscene_step++;
						}
					}
				}
            break;
			
		case 7: 
            if (!global.dialog) {
                ctrl.cutscene_step++;
            }
            break;

        case 8: // Finaliza cutscene e devolve controle
			global.cam_override = false;
			global.focus_target = noone;
            obj_Apollo.can_control = true;
            obj_Luana.can_control = true;
            obj_Niobio.can_control = true;
			obj_Apollo.state = Apollo_State_Idle;
			obj_Luana.state  = Luana_State_Idle;
			
            ctrl.cutscene_step = 0;  // reseta para próxima cutscene
            return true;  // cutscene acabou
    }

    return false;  // cutscene ainda não terminou
}
