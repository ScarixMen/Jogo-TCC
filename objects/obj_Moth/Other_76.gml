if(event_data[?"event_type"] == "sprite event") {

	switch(event_data[?"message"]) {
	    case "fly":
			global.som.tocarSFX(sfx_Moth_Fly, fator_volume);
	        break;

	}
}
