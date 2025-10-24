
if(event_data[?"event_type"] == "sprite event") {

	switch(event_data[?"message"]) {
	    case "Fly":
			global.som.tocarSFX(sfx_Pressagio_Fly, fator_volume)
	        break;
			case "Scream":
			global.som.tocarSFX(sfx_Pressagio_Scream, fator_volume)
	        break;
	}
}
