function scr_dialog()
{

	switch npc_name
	{
	 
	 
	
		case "inicio":
		
			text[0] = "Luana? Apollo? Vocês estão na escuta?";
			text[1] = "Sim! Conseguimos te ouvir.";
			text[2] = "Salve! Sim a gente te escuta. Câmbio.";
			text[3] = "Maravilha. O sinal é fraco, mas sempre que possível vou manter contato com vocês. Vou guia-los pela ilha."
			
			name[0] ="Ayla"
			name[1] ="Luana"
			name[2] ="Apollo"
			name[3] ="Ayla"
			
			speaker[0] = Ayla
			speaker[1] = Luana
			speaker[2] = Apollo
			speaker[3] = Ayla
			
			break;
			
			case "botao_tutorial":
		
			text[0] = "Esperem. Aparentemente os povos que moravam aqui tinha alguns mecanismos.";
			text[1] = "Apollo, tenta se agachar apertando (CTRL), e levante-se soltando-o, assim fique em cima daquele botão laranja dentro daquele túnel." ;
			text[2] = "Pode deixar!";
			
			name[0] = "Ayla"
			name[1] = "Ayla"
			name[2] = "Apollo"
			
			speaker[0] = Ayla
			speaker[1] = Ayla
			speaker[2] = Apollo
			
			break;
			
			case "caixa":
		
			text[0] = "Essas caixas parecem pesadas... Será que...";
			text[1] = "Relaxa, isso você pode deixar comigo!" ;
			
			name[0] = "Ayla"
			name[1] = "Luana"
			
			speaker[0] = Ayla
			speaker[1] = Luana
			
			break;
			
			case "botao_plataforma":
			
			text[0] = "Eles parecem ser diferentes dos botões anteriores..." 
			text[1] = "Apollo, pode esperar? Preciso que a Luana investigue mais pra frente."
			
			name[0] = "Ayla"
			name[1] = "Ayla"
			
			speaker[0] = Ayla
			speaker[1] = Ayla
			
			break;
			case "final_tutorial":
			
			text[0] = "Parece que funcionou, bom trabalho Luana. " 
			text[1] = "Aliás, reparei em uma coisa; Parece que esses botões azuis eles são ativados com essas caixas. Ficaria atenta com eles."
			text[2] = "Tá, botão azul... tá, anotado. Valeu de óculos! Câmbio."
			text[3] = "Não precisa falar câmbio no final da frase Apollo..."
			
			name[0] = "Ayla"
			name[1] = "Ayla"
			name[2] = "Apollo"
			name[3] = "Ayla"
			
			speaker[0] = Ayla
			speaker[1] = Ayla
			speaker[2] = Apollo
			speaker[3] = Ayla
			
			break;
			
			case "Niobio_Statue":
			
			text[0] = "Parece ser diferente das outras estatuas... Espera, é parecido com aqueles símbolos que a gente achou antes! " 
			text[1] = "Estranho, será que era alguma figura importante pra ilha?"
			text[2] = "Talvez. Acho que eu consigo traduzir o que tá escrito. Espera um minutinho."
			
			name[0] = "Apollo"
			name[1] = "Luana"
			name[2] = "Apollo"
			
			speaker[0] = Apollo
			speaker[1] = Luana
			speaker[2] = Apollo
			
			
			break;
			
			case "Niobio_Idle_1":
			
			text[0] = "\"Se estiver perdido, lembre-se de onde nascestes, e se guie por este caminho\""
			text[1] = "Apollo... eu acho melhor você sair daí"
			text[2] = "Calma aí Lu, preciso de um tempinho para ler isso aqui."
			
			name[0] = "Apollo"
			name[1] = "Luana"
			name[2] = "Apollo"
			
			speaker[0] = Apollo
			speaker[1] = Luana
			speaker[2] = Apollo
			
			
			break;
			
			case "Niobio_Idle_2":
			
			text[0] = "Ah não brinca, essa coisa consegue se mexer também???"
			text[1] = "Eu vou tentar distrair ele. Vê se o que está escrito aí ajuda a gente parar essa coisa!"
			
			name[0] = "Apollo"
			name[1] = "Luana"
			
			speaker[0] = Apollo
			speaker[1] = Luana
			
			break;
			
			case "Niobio_End":
			
			text[0] = "Que a luz de nossa mãe nos guie na penumbra!"
			
			name[0] = "Apollo"
			
			speaker[0] = Apollo
			
			break;
			
			case "Niobio_End_2":
			
			text[0] = "Ih... foi por pouco... Você tá bem Luana?"
			text[1] = "Acho que sim. Só vamos continuar andando..."
			
			name[0] = "Apollo"
			name[1] = "Luana"
			
			speaker[0] = Apollo
			speaker[1] = Luana
			
			break;
			
			
	}
	
}