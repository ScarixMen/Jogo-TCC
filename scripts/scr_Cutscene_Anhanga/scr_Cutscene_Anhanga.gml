/// @description Cutscene da luta contra Niobio
/// @param other - obj_CutsceneManager que controla

function scr_Cutscene_Anhanga(other) {
    var ctrl = other;

    switch(ctrl.cutscene_step) {

        case 0: // Desabilitar controle
            obj_Apollo.can_control = false;
            obj_Luana.can_control = false;
			obj_Lumini_Luana.start = false;
			// Força estados de cutscene
			global.cam_override = true;
			obj_Apollo.state = Apollo_State_Cutscene;
			obj_Luana.state  = Luana_State_Cutscene;

            ctrl.cutscene_step++;
            break;
			
		case 1: // Luana e Apollo andam para perto do boss
            var luana_ok = scr_Move_To_Point(obj_Luana, 18100, obj_Luana.spd, spr_Luana_Walking, spr_Luana_Idle);
            var apollo_ok = scr_Move_To_Point(obj_Apollo, 18000, obj_Apollo.spd, spr_Apollo_Walking, spr_Apollo_Idle);
            if (luana_ok && apollo_ok) {
                ctrl.cutscene_timer = room_speed*0; // espera 2 segundos
                ctrl.cutscene_step++;
            }
            break;
			
		case 2: // Cria diálogo
            if (!global.dialog) {
                var d1 = instance_create_layer(x,y, layer, obj_Dialog);
                d1.npc_name = "Anhanga_1";
                global.dialog = true;
                ctrl.cutscene_step++;
				
            }
            break;
			
		case 3: // Espera diálogo fechar
            if (!global.dialog) {
				ctrl.cutscene_timer = room_speed*2;
                ctrl.cutscene_step++;
				global.focus_target = obj_Anhanga;
            }
            break;

        case 4: // Espera e cria diálogo 
            ctrl.cutscene_timer--;
            if (ctrl.cutscene_timer <= 0) {
				 if (!global.dialog) {
	                var d2 = instance_create_layer(x,y, layer, obj_Dialog);
	                d2.npc_name = "Anhanga_2";
	                global.dialog = true;
					global.focus_target = noone;
	                ctrl.cutscene_step++;
				
				}
            }
            break;
			
		case 5: // Espera diálogo fechar
            if (!global.dialog) {
                ctrl.cutscene_step++;
            }
            break;
			
        case 6: // Espera os luminis chegarem
			var lumini_moon_ok = scr_Move_To_Point_Luminis(obj_Lumini_Luana, obj_Anhanga.x - 30, obj_Anhanga.y, 30)
				if(lumini_moon_ok)
				{	
					ctrl.cutscene_step++;
				}
            break;
			
		case 7: // Cria diálogo
            if (!global.dialog) {
                var d1 = instance_create_layer(x,y, layer, obj_Dialog);
                d1.npc_name = "Anhanga_3";
                global.dialog = true;
                ctrl.cutscene_step++;
				
            }
            break;
			
		case 8: // Espera diálogo fechar
            if (!global.dialog) {
                ctrl.cutscene_step++;
            }
            break;

        case 9: // Finaliza cutscene e devolve controle
			global.cam_override = false;
			global.focus_target = noone;
			obj_Cutscene_Trigger_Anhanga.cutscene_started = false;
			obj_Cutscene_Trigger_Anhanga.apollo_ready = false;
			obj_Cutscene_Trigger_Anhanga.luana_ready = false;
            obj_Apollo.can_control = true;
			obj_Lumini_Luana.start = true;
            obj_Luana.can_control = true;
			obj_Anhanga.state = Anhanga_State_Disappear;
			obj_Apollo.state = Apollo_State_Idle;
			obj_Luana.state  = Luana_State_Idle;
			
            ctrl.cutscene_step = 0;  // reseta para próxima cutscene
            return true;  // cutscene acabou
    }

    return false;  // cutscene ainda não terminou
}