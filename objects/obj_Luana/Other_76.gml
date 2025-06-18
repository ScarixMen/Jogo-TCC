if place_meeting(x,y+100,obj_Sand){
	if(event_data[?"event_type"] == "sprite event") {

		switch(event_data[?"message"]) {
		    case "stepL1":
				audio_play_sound(snd_step1,1,false)
		        break;
		    case "stepL2":
				audio_play_sound(snd_step2,1,false)
		        break;
				case "stepL3":
				audio_play_sound(snd_step3,1,false)
		        break;
		    case "stepL4":
				audio_play_sound(snd_step4,1,false)
		        break;
				case "stepL5":
				audio_play_sound(snd_step5,1,false)
		        break;
				case "jumpL":
				audio_play_sound(snd_Jump_Luana,1,false)
		        break;
				case "fallL":
				audio_play_sound(snd_Fall_Luana,1,false)
		        break;
		}
	}
}else
{
	if(event_data[?"event_type"] == "sprite event") {
		switch(event_data[?"message"]) {
	        case "stepL1":
				audio_play_sound(snd_Step_Rock_Luana_1,1,false)
	            break;
	        case "stepL2":
				audio_play_sound(snd_Step_Rock_Luana_2,1,false)
	            break;
				case "stepL3":
				audio_play_sound(snd_Step_Rock_Luana_3,1,false)
	            break;
	        case "stepL4":
				audio_play_sound(snd_Step_Rock_Luana_4,1,false)
	            break;
				case "stepL5":
				audio_play_sound(snd_Step_Rock_Luana_5,1,false)
	            break;
				case "jumpL":
				audio_play_sound(snd_Jump_Rock_Luana,1,false)
	            break;
				case "fallL":
				audio_play_sound(snd_Fall_Rock_Luana,1,false)
	            break;
		}
	}
}