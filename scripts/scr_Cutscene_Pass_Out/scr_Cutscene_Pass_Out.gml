/// @description Cutscene da luta contra Niobio
/// @param other - obj_CutsceneManager que controla

function scr_Cutscene_Pass_Out(other) {
    var ctrl = other;

    switch(ctrl.cutscene_step) {

        case 0: // Desabilitar controle
            obj_Apollo.can_control = false;
            obj_Luana.can_control = false;
			obj_Apollo.sprite_index = spr_Apollo_Idle
			obj_Apollo.hspd = 0
			obj_Luana.state = Luana_State_Idle
			// Força estados de cutscene
			global.cam_override = true;
			obj_Apollo.state = Apollo_State_Cutscene;
			obj_Luana.state  = Luana_State_Cutscene;

            ctrl.cutscene_step++;
            break;
			
		case 1: // Cria diálogo
            if (!global.dialog) {
                var d1 = instance_create_layer(x,y, layer, obj_Dialog);
                d1.npc_name = "pass_out";
                global.dialog = true;
                ctrl.cutscene_step++;
            }
            break;
			
		case 2: // Espera diálogo fechar
            if (!global.dialog) {
				ctrl.cutscene_timer = room_speed*2;
				obj_Luana.image_index = 0
                ctrl.cutscene_step++;
            }
            break;

        case 3: // Espera e cria diálogo 
		
			obj_Luana.sprite_index = spr_Luana_Death_2
            ctrl.cutscene_timer--;
            if (ctrl.cutscene_timer <= 0) {
				 if (!global.dialog) {
	                var d2 = instance_create_layer(x,y, layer, obj_Dialog);
	                d2.npc_name = "pass_out_2";
	                global.dialog = true;
	                ctrl.cutscene_step++;
				
				}
            }
            break;
			
		case 4: // Espera diálogo fechar
			obj_Luana.image_index = 13	
            if (!global.dialog) {
                ctrl.cutscene_timer = room_speed*0.5;
				
                ctrl.cutscene_step++;
            }
		break;
		
		case 5: // Espera diálogo fechar
			
			obj_Luana.sprite_index = spr_Luana_Get_Up
            ctrl.cutscene_timer--;
            if (ctrl.cutscene_timer <= 0) {
				ctrl.cutscene_step++;
			}
		break;
		
		case 6: // Espera e cria diálogo 
		
			obj_Luana.sprite_index = spr_Luana_Idle
			if (!global.dialog) {
				
			   var d2 = instance_create_layer(x,y, layer, obj_Dialog);
			   d2.npc_name = "pass_out_3";
			   global.dialog = true;
			   obj_Luana.y -= 1
			   ctrl.cutscene_step++;
				
			}
			
            break;

			case 7: // Finaliza cutscene e devolve controle
			obj_Lumini_Apollo.start = true;
			obj_Lumini_Luana.start = true;
			global.cam_override = false;
			global.focus_target = noone;
            obj_Apollo.can_control = true;
            obj_Luana.can_control = true;
			obj_Apollo.state = Apollo_State_Idle;
			obj_Luana.state  = Luana_State_Idle;
			
            ctrl.cutscene_step = 0;  // reseta para próxima cutscene
            return true;  // cutscene acabou
    }

    return false;  // cutscene ainda não terminou
}
