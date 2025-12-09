if(event_data[?"event_type"] == "sprite event") {
		if(state != Moth_State_Attack ){
			switch(event_data[?"message"]) {
			    case "fly":
					global.som.tocarSFX(sfx_Moth_Fly, fator_volume);
			        break;
		}
	}
}
