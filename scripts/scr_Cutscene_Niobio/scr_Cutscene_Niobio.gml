/// @description Cutscene da luta contra Niobio
/// @param other - obj_CutsceneManager que controla

function scr_Cutscene_BossFight(other) {
    var ctrl = other;

    switch(ctrl.cutscene_step) {

        case 0: // Desabilitar controle
            obj_Apollo.can_control = false;
            obj_Luana.can_control = false;
            obj_Niobio.can_control = false;
			
			// Força estados de cutscene
			obj_Apollo.state = Apollo_State_Cutscene;
			obj_Luana.state  = Luana_State_Cutscene;

            ctrl.cutscene_step++;
            break;

        case 1: // Luana e Apollo andam para perto do boss
            var luana_ok = scr_Move_To_Point(obj_Luana, 31450, obj_Luana.spd, spr_Luana_Walking, spr_Luana_Idle);
            var apollo_ok = scr_Move_To_Point(obj_Apollo, 31680, obj_Apollo.spd, spr_Apollo_Walking, spr_Apollo_Idle);
            if (luana_ok && apollo_ok) {
                ctrl.cutscene_timer = room_speed; // espera 2 segundos
                ctrl.cutscene_step++;
            }
            break;

        case 2: // Espera e cria diálogo "Niobio_Statue"
            ctrl.cutscene_timer--;
            if (ctrl.cutscene_timer <= 0) {
                if (!global.dialog) {
                    var d = instance_create_layer(obj_Niobio.x, obj_Niobio.y, "dialog", obj_Dialog);
                    d.npc_name = "Niobio_Statue";
                    global.dialog = true;
                }
                ctrl.cutscene_step++;
            }
            break;

        case 3: // Espera diálogo "Niobio_Statue" terminar e muda estado para Idle
            if (!global.dialog) {
                obj_Niobio.state = Niobio_State_Uncross;
                ctrl.cutscene_step++;
            }
            break;

        case 4: // Cria diálogo "Niobio_Idle_1"
            if (!global.dialog) {
                var d2 = instance_create_layer(obj_Niobio.x, obj_Niobio.y, "dialog", obj_Dialog);
                d2.npc_name = "Niobio_Idle_1";
                global.dialog = true;
                ctrl.cutscene_step++;
            }
            break;

        case 5: // Espera diálogo "Niobio_Idle_1" fechar
            if (!global.dialog) {
                ctrl.cutscene_step++;
            }
            break;

        case 6: // Niobio pula + Apollo e Luana começam a correr
            obj_Niobio.state = Niobio_State_Jump;
            ctrl.cutscene_step++;
            break;

        case 7: // Apollo e Luana correm para sair debaixo do pulo
            var luana_ok2 = scr_Move_To_Point(obj_Luana, 31200, obj_Luana.spd, spr_Luana_Walking, spr_Luana_Idle);
            var apollo_ok2 = scr_Move_To_Point(obj_Apollo, 31000, obj_Apollo.spd, spr_Apollo_Walking, spr_Apollo_Idle);

            // Direção automática
            if (obj_Luana.hspd != 0) obj_Luana.image_xscale = sign(obj_Luana.hspd);
            if (obj_Apollo.hspd != 0) obj_Apollo.image_xscale = sign(obj_Apollo.hspd);

            // Espera Niobio pousar e personagens terminarem de se mover
            if (obj_Niobio.state == Niobio_State_Idle_Dialog_2 && luana_ok2 && apollo_ok2) {
				obj_Luana.image_xscale = 1
				 obj_Apollo.image_xscale = 1
                if (!global.dialog) {
                    var d3 = instance_create_layer(obj_Niobio.x, obj_Niobio.y, "dialog", obj_Dialog);
                    d3.npc_name = "Niobio_Idle_2";
                    global.dialog = true;
                }
                ctrl.cutscene_step++;
            }
            break;

        case 8: // Espera diálogo "Niobio_Idle_2" fechar
            if (!global.dialog) {
                ctrl.cutscene_step++;
            }
            break;

        case 9: // Câmera foca outra parte (exemplo: obj_Beach_Puzzle_5)
            global.cam_override = true;
            global.focus_target = obj_Apollo;
            apollo_ok = scr_Move_To_Point(obj_Apollo, 29000, obj_Apollo.spd, spr_Apollo_Walking, spr_Apollo_Idle);
            if (apollo_ok) {
                ctrl.cutscene_step++;
            }
            break;

        case 10: // Espera timer acabar e desfaz foco da câmera
                global.cam_override = false;
                global.focus_target = noone;
                ctrl.cutscene_step++;
            break;

        case 11: // Finaliza cutscene e devolve controle
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
