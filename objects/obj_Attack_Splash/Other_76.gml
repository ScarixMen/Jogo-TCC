if (Check_Pause()) exit;
if(event_data[?"event_type"] == "sprite event") {

		switch(event_data[?"message"]) {
		    case "splash":
				global.som.tocarSFX(sfx_Splash)
		        break;
		}
}