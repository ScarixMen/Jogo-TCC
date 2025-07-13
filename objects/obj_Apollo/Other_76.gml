if place_meeting(x,y+100,obj_Sand){
	if(event_data[?"event_type"] == "sprite event") {

		switch(event_data[?"message"]) {
		    case "stepA1":
				global.som.tocarSFX(sfx_step1)
		        break;
		    case "stepA2":
				global.som.tocarSFX(sfx_step2)
		        break;
				case "stepA3":
				global.som.tocarSFX(sfx_step3)
		        break;
		    case "stepA4":
				global.som.tocarSFX(sfx_step4)
		        break;
				case "stepA5":
				global.som.tocarSFX(sfx_step5)
		        break;
				case "jumpA":
				global.som.tocarSFX(sfx_Jump_Apollo)
		        break;
				case "fallA":
				global.som.tocarSFX(sfx_Fall_Apollo)
		        break;
				case "arrastando_1":
				global.som.tocarSFX(sfx_Dragging_1)
		        break;
				case "arrastando_2":
				global.som.tocarSFX(sfx_Dragging_2)
		        break;
				case "arrastando_3":
				global.som.tocarSFX(sfx_Dragging_3)
		        break;
				case "arrastando_4":
				global.som.tocarSFX(sfx_Dragging_4)
		        break;
		}
	}
}else
{
	if(event_data[?"event_type"] == "sprite event") {
		switch(event_data[?"message"]) {
	        case "stepA1":
				global.som.tocarSFX(sfx_Step_Rock_Apollo_1)
	            break;
	        case "stepA2":
				global.som.tocarSFX(sfx_Step_Rock_Apollo_2)
	            break;
				case "stepA3":
				global.som.tocarSFX(sfx_Step_Rock_Apollo_3)
	            break;
	        case "stepA4":
				global.som.tocarSFX(sfx_Step_Rock_Apollo_4)
	            break;
				case "stepA5":
				global.som.tocarSFX(sfx_Step_Rock_Apollo_5)
	            break;
				case "jumpA":
				global.som.tocarSFX(sfx_Jump_Rock_Apollo)
	            break;
				case "fallA":
				global.som.tocarSFX(sfx_Fall_Rock_Apollo)
	            break;
		}
	}
}