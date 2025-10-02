if (!cutscene_started) {
    // Apollo entrou na área (ou já passou dela)
    if (place_meeting(x, y, obj_Apollo)) {
        apollo_ready = true;
    }else
	{
		
		apollo_ready = false;
		
	}
    
    // Luana entrou na área (ou já passou dela)
    if (place_meeting(x, y, obj_Luana)) {
        luana_ready = true;
    }else
	{
		
		luana_ready = false;
		
	}

    // Se os dois já chegaram pelo menos uma vez, ativa a cutscene
    if (apollo_ready && luana_ready) {
		duo_ready = true;
		//global.cam_override = true
		global.focus_target = noone
    }else{
		
		duo_ready = false;
		
	}
}
