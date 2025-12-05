// se não está no meio de uma transição
if (next == -1) {
    cutscene_timer++;

    if (cutscene_timer >= cutscene_delay) {
        cutscene_timer = 0;

        if (current < array_length(comics) - 1) {
            // ainda tem quadrinho -> avança
            if (!global.skip and current >= 8) {
                global.skip = true; // só ativa uma vez
            }
            next = current + 1;
            progress = 0;
            dir = 1;
        } else {
            // último quadrinho -> vai pra sala
            room_goto(rm_Tutorial);
        }
    }
}

/*if current == 8
{	
	var dialog = instance_create_layer(x, y,layer , obj_Dialog_Custscene);
    dialog.npc_name = "Cutscene_1";
    global.dialog = true;
}*/

// animação da transição
if (next != -1) {
    progress += 0.04; // velocidade do slide
    if (progress >= 1) {
        current = next;
        next = -1;
        progress = 0;
    }
}