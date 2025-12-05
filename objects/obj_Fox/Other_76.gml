if(event_data[?"event_type"] == "sprite event") {

	switch(event_data[?"message"]) {
	    case "step":
			global.som.tocarSFX(sfx_Fox_Walking)
	        break;

	}
}
