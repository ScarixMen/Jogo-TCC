/// @description Cutscene da luta contra Niobio
/// @param other - obj_CutsceneManager que controla

function scr_Cutscene_Ravi(other) {
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
			obj_Ravi.state = Ravi_State_Cutscene;
			obj_Luana.state  = Luana_State_Cutscene;

            ctrl.cutscene_step++;
            break;
			
		 case 1: // Luana e Apollo andam para perto do boss
            var luana_ok = scr_Move_To_Point(obj_Luana, 3800, obj_Luana.spd, spr_Luana_Walking, spr_Luana_Idle);
            var apollo_ok = scr_Move_To_Point(obj_Apollo, 3600, obj_Apollo.spd, spr_Apollo_Walking, spr_Apollo_Idle);
            if (luana_ok && apollo_ok) {
                ctrl.cutscene_timer = room_speed*1; // espera 2 segundos
                ctrl.cutscene_step++;
            }
            break;
			
		case 2: // Espera diálogo fechar
			ctrl.cutscene_timer--;
            if (ctrl.cutscene_timer <= 0) {
				 if (!global.dialog) {
	                var d2 = instance_create_layer(x,y, layer, obj_Dialog);
	                d2.npc_name = "ravi";
	                global.dialog = true;
	                ctrl.cutscene_step++;
				
				}
            }
            break;
			
		case 3: // Espera diálogo fechar
            if (!global.dialog) {
                ctrl.cutscene_timer = room_speed*2;
                ctrl.cutscene_step++;
            }
		break;
		
		case 4: // Espera diálogo fechar
			
			obj_Ravi.image_xscale = -1.5
            ctrl.cutscene_timer--;
            if (ctrl.cutscene_timer <= 0) {
				 if (!global.dialog) {
	                var d2 = instance_create_layer(x,y, layer, obj_Dialog);
	                d2.npc_name = "ravi_2";
	                global.dialog = true;
	                ctrl.cutscene_step++;
				
				}
            }
		break;
		
		case 5: // Espera diálogo fechar
            if (!global.dialog) {
                ctrl.cutscene_timer = room_speed*1;
                ctrl.cutscene_step++;
            }
		break;
		
		case 6: // Espera diálogo fechar
            ctrl.cutscene_timer--;
            if (ctrl.cutscene_timer <= 0) {
				obj_Ravi.sprite_index = spr_Ravi_Idle
				obj_Altar_Artifacts.sprite_index = spr_Altar_Artifacts_Idle
				ctrl.cutscene_step++;
            }
		break;
		
		case 7: 
		
			if (!global.dialog) {
				
			   var d2 = instance_create_layer(x,y, layer, obj_Dialog);
			   d2.npc_name = "ravi_3";
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
			obj_Lumini_Apollo.start = true;
			obj_Lumini_Luana.start = true;
			global.cam_override = false;
			global.focus_target = noone;
            obj_Apollo.can_control = true;
            obj_Luana.can_control = true;
			obj_Apollo.state = Apollo_State_Idle;
			obj_Luana.state  = Luana_State_Idle;
			global.som.tocarMusicaNiobio(bgm_Insula)
			obj_Ravi.state = Ravi_State_Start;
			
            ctrl.cutscene_step = 0;  // reseta para próxima cutscene
            return true;  // cutscene acabou
    }

    return false;  // cutscene ainda não terminou
}
