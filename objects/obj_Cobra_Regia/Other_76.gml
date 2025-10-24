if(event_data[?"event_type"] == "sprite event") {

		switch(event_data[?"message"]) {
		    case "cobra":
				global.som.tocarSFX(sfx_Cobra_Regia, fator_volume);
		        break;
		}
	}