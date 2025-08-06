if place_meeting(x,y+100,obj_Sand){
	if(event_data[?"event_type"] == "sprite event") {

		switch(event_data[?"message"]) {
		    case "stepL1":
				global.som.tocarSFX(sfx_step1)
		        break;
		    case "stepL2":
				global.som.tocarSFX(sfx_step2)
		        break;
				case "stepL3":
				global.som.tocarSFX(sfx_step3)
		        break;
		    case "stepL4":
				global.som.tocarSFX(sfx_step4)
		        break;
			case "stepL5":
				global.som.tocarSFX(sfx_step5)
		        break;
			case "jumpL":
				global.som.tocarSFX(sfx_Jump_Luana)
		        break;
			case "fallL":
				global.som.tocarSFX(sfx_Fall_Luana)
		        break;
		}
	}
}else if place_meeting(x,y+100,obj_Rock_Colision) or place_meeting(x,y+100,obj_Rock_Cut)
{
	if(event_data[?"event_type"] == "sprite event") {
		switch(event_data[?"message"]) {
	        case "stepL1":
				global.som.tocarSFX(sfx_Step_Rock_Luana_1)
	            break;
	        case "stepL2":
				global.som.tocarSFX(sfx_Step_Rock_Luana_2)
	            break;
				case "stepL3":
				global.som.tocarSFX(sfx_Step_Rock_Luana_3)
	            break;
	        case "stepL4":
				global.som.tocarSFX(sfx_Step_Rock_Luana_4)
	            break;
			case "stepL5":
				global.som.tocarSFX(sfx_Step_Rock_Luana_5)
	            break;
			case "jumpL":
				global.som.tocarSFX(sfx_Jump_Rock_Luana)
	            break;
			case "fallL":
				global.som.tocarSFX(sfx_Fall_Rock_Luana)
	            break;
		}
	}
}else if(place_meeting(x,y+100,obj_Block_Grass))
{
	if(event_data[?"event_type"] == "sprite event") {
		switch(event_data[?"message"]) {
	        case "stepL1":
				global.som.tocarSFX(sfx_Step_Grass_1)
	            break;
	        case "stepL2":
				global.som.tocarSFX(sfx_Step_Grass_2)
	            break;
				case "stepL3":
				global.som.tocarSFX(sfx_Step_Grass_3)
	            break;
	        case "stepL4":
				global.som.tocarSFX(sfx_Step_Grass_4)
	            break;
			case "stepL5":
				global.som.tocarSFX(sfx_Step_Grass_5)
	            break;
			case "jumpL":
				global.som.tocarSFX(sfx_Jump_Grass_Luana)
	            break;
			case "fallL":
				global.som.tocarSFX(sfx_Fall_Grass_Luana)
	            break;
		}
	}
}