if(event_data[?"event_type"] == "sprite event") {
    switch(event_data[?"message"]) {
        case "step1":
			audio_play_sound(snd_step1,1,false)
            break;
        case "step2":
			audio_play_sound(snd_step2,1,false)
            break;
			case "step3":
			audio_play_sound(snd_step3,1,false)
            break;
        case "step4":
			audio_play_sound(snd_step4,1,false)
            break;
			case "step5":
			audio_play_sound(snd_step5,1,false)
            break;
    }
}