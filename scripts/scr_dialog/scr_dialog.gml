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
			
			case "Cutscene_1":
			
			text[0] = "Ei, Luana, dá uma olhada!"
			text[1] = "Tem um monte de símbolos desconhecidos. Acho que deve ser a escrita ser das pessoas que já moraram aqui"
			text[2]	= "E se a gente tirar foto? Não dá pra deixar passar um achado desses moscando. Quem sabe, assim confiem mais em você sobre essa ilha."
			text[3]	= "É, você tem razão."
			
			name[0] = "Apollo"
			name[1] = "Luana"
			name[2] = "Apollo"
			name[3] = "Luana"
			
			speaker[0] = Apollo
			speaker[1] = Luana
			speaker[2] = Apollo
			speaker[3] = Luana
			
			break;
			
			case "Cutscene_Luminis_1":
			
			text[0] = "Apollo? Luana? Conseguem me escutar?"
			text[1] = "Oi ayla. A gente tá escutando"
			text[2]	= "Sim! Tamo na escuta. Câmbio."
			text[3]	= "Ótimo. Vejo que já chegaram nas florestas de Umbra. Segundo os dados que estou captando,"
			text[4]	= "vocês não devem estar muito longe de chegar ao templo."
			text[5]	= "Entretanto, há muitas interferências nessa região, recomendo seguirem com cautela."
			text[6]	= "Será que são mais daquelas estátuas?"
			text[7]	= "Não sei dizer, parece ser outra coisa... de qualquer forma, tomem cuidado."
			
			name[0] = "Ayla"
			name[1] = "Luana"
			name[2] = "Apollo"
			name[3] = "Ayla"
			name[4] = "Ayla"
			name[5] = "Ayla"
			name[6] = "Luana"
			name[7] = "Ayla"
			
			speaker[0] = Ayla
			speaker[1] = Luana
			speaker[2] = Apollo
			speaker[3] = Ayla
			speaker[4] = Ayla
			speaker[5] = Ayla
			speaker[6] = Luana
			speaker[7] = Ayla
			
			break;
			
			case "Cutscene_Luminis_2":
			
			text[0] = "O Luana, eu to ficando louco ou parece ter algo ali?"
			
			name[0] = "Apollo"
			
			speaker[0] = Apollo
			
			break;
			
			case "Cutscene_Luminis_3":
			
			text[0] = "Ei, vocês estão bem? Acharam algo?"
			text[1] = "Ah, a gente tá bem, mas a gente encontro duas coisas que estão brilhando... Eles não parecem querer atacar a gente."
			text[2]	= "Parecem ser pacíficos."
			text[3]	= "Estranho... enfim, me avisem se houver outro problema."
			text[4]	= "Tá bom! Câmbio."
			text[5]	= "Apollo... deixa quieto."
			text[6]	= "Tá legal, vamos continuar andando então."
			text[7]	= "Certo. Vambora luminis!"
			text[8]	= "Luminis?"
			text[9]	= "É... Eles brilham e tals. Você achou ruim?"
			text[10] = "Não hehehe. Só achei engraçado. Enfim, vamos lá!"
			
			name[0] = "Ayla"
			name[1] = "Luana"
			name[2] = "Apollo"
			name[3] = "Ayla"
			name[4] = "Apollo"
			name[5] = "Ayla"
			name[6] = "Luana"
			name[7] = "Apollo"
			name[8] = "Luana"
			name[9] = "Apollo"
			name[10] = "Luana"
			
			speaker[0] = Ayla 
			speaker[1] = Luana 
			speaker[2] = Apollo  
			speaker[3] = Ayla 
			speaker[4] = Apollo 
			speaker[5] = Ayla 
			speaker[6] = Luana  
			speaker[7] = Apollo 
			speaker[8] = Luana  
			speaker[9] = Apollo  
			speaker[10] = Luana

			break;
			
			case "Things_Of_Ravi":
			
			text[0] = "O Luana, se meu conhecimento tá em dia, acho que essa parada aqui não é da ilha."
			text[1] = "Estranho, eu já vi essas coisas em algum lugar... Ayla, sabe se tem mais alguém além da gente?"
			text[2]	= "Não. Mesmo com as interferências, eu conseguiria saber disso."
			text[3]	= "Esquisito. Vai ver alguém naufragou aqui a um tempo?"
			text[4]	= "Mas sem saber o caminho exato, é quase impossível vir parar aqui..."
			
			name[0] = "Apollo"
			name[1] = "Luana"
			name[2] = "Ayla"
			name[3] = "Apollo"
			name[4] = "Luana"
			
			speaker[0] = Apollo
			speaker[1] = Luana
			speaker[2] = Ayla
			speaker[3] = Apollo
			speaker[4] = Luana
			
			break;
			
			case "Anhanga_1":
		
			text[0] = "Ah? O que é essa coisa?";
			text[1] = "Parece que ele não quer que a gente chegue mais perto...";
			text[2] = "Outro guardião? E agora?";
			text[3] = "Hm, talvez..."
			
			name[0] ="Apollo"
			name[1] ="Luana"
			name[2] ="Apollo"
			name[3] ="Luana"
			
			speaker[0] = Apollo
			speaker[1] = Luana
			speaker[2] = Apollo
			speaker[3] = Luana
			
			break;
			
			case "Anhanga_2":
		
			text[0] = "Tive uma ideia. Talvez se a gente cansar ele usando os luminis, ele deixe a gente passar!";
			text[1] = "Ah, bacana... Perai, você tá falando sério?";
			
			name[0] ="Luana"
			name[1] ="Apollo"
			
			speaker[0] = Luana
			speaker[1] = Apollo
			
			break;
			
			case "Anhanga_3":
		
			text[0] = "Me perdoe, mas eu preciso passar";
			text[1] = "E lá vamos nós...";

			name[0] ="Luana"
			name[1] ="Apollo"
			
			speaker[0] = Luana
			speaker[1] = Apollo
			
			break;

	}
}	