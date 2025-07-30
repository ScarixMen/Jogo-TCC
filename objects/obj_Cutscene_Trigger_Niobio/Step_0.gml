if (!cutscene_started) {
    // Apollo entrou na área (ou já passou dela)
    if (!apollo_ready && place_meeting(x, y, obj_Apollo)) {
        apollo_ready = true;
    }
    
    // Luana entrou na área (ou já passou dela)
    if (!luana_ready && place_meeting(x, y, obj_Luana)) {
        luana_ready = true;
    }

    // Se os dois já chegaram pelo menos uma vez, ativa a cutscene
    if (apollo_ready && luana_ready) {
        cutscene_started = true;
		var cutscene = instance_create_layer(0, 0, "Instances", obj_Cutscene_Manager);
        obj_Cutscene_Manager.current_cutscene = scr_Cutscene_BossFight;
		global.cam_override = true
		global.focus_target = noone
    }
}
