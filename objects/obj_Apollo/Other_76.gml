if place_meeting(x,y+100,obj_Sand){
	if(event_data[?"event_type"] == "sprite event") {

		switch(event_data[?"message"]) {
		    case "stepA1":
				audio_play_sound(snd_step1,1,false)
		        break;
		    case "stepA2":
				audio_play_sound(snd_step2,1,false)
		        break;
				case "stepA3":
				audio_play_sound(snd_step3,1,false)
		        break;
		    case "stepA4":
				audio_play_sound(snd_step4,1,false)
		        break;
				case "stepA5":
				audio_play_sound(snd_step5,1,false)
		        break;
				case "jumpA":
				audio_play_sound(snd_Jump_Apollo,1,false)
		        break;
				case "fallA":
				audio_play_sound(snd_Fall_Apollo,1,false)
		        break;
		}
	}
}else
{
	if(event_data[?"event_type"] == "sprite event") {
		switch(event_data[?"message"]) {
	        case "stepA1":
				audio_play_sound(snd_Step_Rock_Apollo_1,1,false)
	            break;
	        case "stepA2":
				audio_play_sound(snd_Step_Rock_Apollo_2,1,false)
	            break;
				case "stepA3":
				audio_play_sound(snd_Step_Rock_Apollo_3,1,false)
	            break;
	        case "stepA4":
				audio_play_sound(snd_Step_Rock_Apollo_4,1,false)
	            break;
				case "stepA5":
				audio_play_sound(snd_Step_Rock_Apollo_5,1,false)
	            break;
				case "jumpA":
				audio_play_sound(snd_Jump_Rock_Apollo,1,false)
	            break;
				case "fallA":
				audio_play_sound(snd_Fall_Rock_Apollo,1,false)
	            break;
		}
	}
}