if(event_data[?"event_type"] == "sprite event") {
	/*if(state != Niobio_State_Push)
	{*/
		switch(event_data[?"message"]) {
				
			case "step1":
				global.som.tocarSFX(sfx_Step_Niobio_1)
				break;
			case "step2":
				global.som.tocarSFX(sfx_Step_Niobio_2)
			     break;
			case "step3":
				global.som.tocarSFX(sfx_Step_Niobio_3)
				 break;
			/*case "fall":
				global.som.tocarSFX(sfx_Niobio_Fall)
				 break;
			case "pre_jump":
				global.som.tocarSFX(sfx_Niobio_Pre_Jump)
				 break;*/
			case "uncross":
				global.som.tocarSFX(sfx_Niobio_Uncross)
				 break;
		//}
	}
}