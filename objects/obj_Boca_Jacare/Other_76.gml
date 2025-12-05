if(event_data[?"event_type"] == "sprite event") {

	switch(event_data[?"message"]) {
	    case "eat":
			global.som.tocarSFX(sfx_Boca_Jacare_Eat)
	        break;
	}
}

