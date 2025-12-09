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
			
			case "Anhanga_end":
		
			text[0] = "Deu certo! Bom trabalho distraindo ele.";
			text[1] = "Uff...Uff...Por nada Lu...";
			text[2] = "Bom, já ouvi falar em \"espiritos guardiões\" que nem ele sabe. Normalmente uma figura com traços de animal que protege as florestas.";
			text[3] = "Mas eles normalmente aparecem quando alguém causa problemas severos ao meio..."
			text[4] = "Se isso é verdade, é sinistro viu. Bom, vamo foca, a entrada do templo já ta bem próxima daqui."

			name[0] ="Luana"
			name[1] ="Apollo"
			name[2] ="Luana"
			name[3] ="Luana"
			name[4] ="Apollo"	
			
			speaker[0] = Luana
			speaker[1] = Apollo
			speaker[2] = Luana
			speaker[3] = Luana
			speaker[4] = Apollo
			
			break;
			
	case "Cutscene_0":
	
	        // Texto principal
	        text[0]  = "Eu acordei...Em um lugar totalmente escuro";
	        text[1]  = "Minha cabeça estava rodando, porém logo parou.";
	        text[2]  = "Quando olhei para o chão, parecia uma galáxia inteira.";
	        text[3]  = "Sem rumo, decidir andar, para ver se chegava em algum lugar.";
	        text[4]  = "Até que uma luz branca apareceu.";
	        text[5]  = "Eu tive que tapar meus olhos até eles se acostumarem com a claridade.";
	        text[6]  = "Quando minha visão foca, eu a vejo, em toda sua glória";
	        text[7]  = "Ela se comunicava comigo, de um jeito estranho.";
	        text[8]  = "Não existiam palavras....";
	        text[9]  = "Mas eu sabia exatamente o que ela queria me dizer.";
	        text[10] = "Se eu só pudesse...";
	        text[11] = "Tocá-la";
	        text[12] = "Luana? Luana?";
	        text[13] = "De repente, eu desperto de um sonho lucido por conta de meu amigo.";
	        text[14] = "EEEEEEI, você tava me ouvindo?";
	        text[15] = "Sério, o que rolou? Você do nada começou a dissociar de tudo.";
	        text[16] = "Então, é que aconteceu algo...";
	        text[17] = "Até que o telefone toca.";
	        text[18] = "Alô? Ayla?";
	        text[19] = "Sim, estamos a caminho...";
	        text[20] = "Eu acho...que sei exatamente onde que a ilha é....";
	
	        // Nome do narrador (sempre Luana)
	        name[0]  = "Luana";
	        name[1]  = "Luana";
	        name[2]  = "Luana";
	        name[3]  = "Luana";
	        name[4]  = "Luana";
	        name[5]  = "Luana";
	        name[6]  = "Luana";
	        name[7]  = "Luana";
	        name[8]  = "Luana";
	        name[9]  = "Luana";
	        name[10] = "Luana";
	        name[11] = "Luana";
	        name[12] = "Apollo";
	        name[13] = "Luana";
	        name[14] = "Apollo";
	        name[15] = "Apollo";
	        name[16] = "Luana";
	        name[17] = "Luana";
	        name[18] = "Luana";
	        name[19] = "Luana";
	        name[20] = "Luana";
	
	        // Speaker (objeto Luana) — manual
	        speaker[0]  = Luana;
	        speaker[1]  = Luana;
	        speaker[2]  = Luana;
	        speaker[3]  = Luana;
	        speaker[4]  = Luana;
	        speaker[5]  = Luana;
	        speaker[6]  = Luana;
	        speaker[7]  = Luana;
	        speaker[8]  = Luana;
	        speaker[9]  = Luana;
	        speaker[10] = Luana;
	        speaker[11] = Luana;
	        speaker[12] = Apollo;
	        speaker[13] = Luana;
	        speaker[14] = Apollo;
	        speaker[15] = Apollo;
	        speaker[16] = Luana;
	        speaker[17] = Luana;
	        speaker[18] = Luana;
	        speaker[19] = Luana;
	        speaker[20] = Luana;
	
	    break;
		
		case "temple":
		
			text[0] = "Ayla? Algum problema?"
			text[1] = "[Distorção]"
			text[2] = "Ah... Ayla, tá com muito chiado e a gente não tá entendendo muito bem, consegue dar uma relaxada e repetir, por favor?"
			text[3] = "[Distorção e desliga]"
			text[4] = "Ah não, o rádio não tá conseguindo conectar na mesma frequência. E agora?"
			text[5]	= "Vish Luana, eu queria muito saber, mas acho que é algo que nem eu e nem você pode fazer."
			text[6]	= "Agora, o que a gente pode fazer é só terminar o que a gente veio fazer aqui."
			
			name[0] ="Luana"
			name[1] ="Ayla"
			name[2] ="Apollo"
			name[3] ="Ayla"
			name[4] ="Luana"
			name[5] ="Apollo"
			name[6] ="Apollo"
			
			speaker[0] = Luana
			speaker[1] = Ayla
			speaker[2] = Apollo
			speaker[3] = Ayla
			speaker[4] = Luana
			speaker[5] = Apollo
			speaker[6] = Apollo
			
			break;
			
			case "temple_help":
		
			text[0] = "Hm, que saco, tá trancado. Se eu fosse a de óculos, ela diria algo como:"
			text[1] = "\"Vasculhem por aí e vêm se encontrem alguma coisa\". Algo do tipo"
			
			name[0] = "Apollo"
			name[1] = "Apollo"
			
			speaker[0] = Apollo
			speaker[1] = Apollo

			break;
			
			case "pass_out":
		
			text[0] = "Luana? ta tudo bem?"
			text[1] = "Minha cabeça... eu a sinto meio pesada..."
			
			name[0] ="Apollo"
			name[1] ="Luana"
			
			speaker[0] = Apollo
			speaker[1] = Luana
			
			break;
			
			case "pass_out_2":
		
			text[0] = "Ei Lu??? Luuuuu? vamo lá, acorda."
			
			name[0] ="Apollo"
			
			speaker[0] = Apollo
			
			break;
			
			case "pass_out_3":
		
			text[0] = "Ai! ainda bem. Quase que meu coração. não me assusta assim não Luu..."
			text[1] = "Uhhm... Perdão, eu acabei desmaiando eu acho. Mas, eu tive muitas visões."
			text[2] = "Ah? Que história é essa?"
			text[3] = "Eu... Calma, vou tentar explicar."
			text[4] = "Como você sabe, os Indus moravam aqui, há muito tempo. a família principal era liderada por mulheres desde então."
			text[5]	= "Meio que nessas visões vi o ponto de vista de uma delas, parecia a mais recente."
			text[6]	= "Ela... aparentemente buscava tomar ações que fizessem todos serem julgados igualmente aos olhos da Lua..."
			text[7]	= "Porém a ilha foi invadida no dia seguinte."
			text[8]	= "Ah... que horrível."
			text[9]	= "Mas, não foi só isso que eu vi. Eu descobri que aparentemente foi planejado eu ta aqui."
			text[10] = "E que minha tribo é descendente dos Indus..."
			text[11] = "Nossa, isso explica muita coisa. Mas por que a Lua te trouxe até aqui então?"
			text[12] = "Eu ainda não sei. Foi tudo de uma vez então minha cabeça tá meio confusa ainda."
			text[13] = "Po, mas também se desmaiou, não dá pra exigir muito. Se bem que, acho que se a gente vê o artefato, talvez..."
			text[14] = "...Eu descubra o porquê!"
			
			name[0] = "Apollo"
			name[1] = "Luana"
			name[2] = "Apollo"
			name[3] = "Luana"
			name[4] = "Luana"
			name[5] = "Luana"
			name[6] = "Luana"
			name[7]	= "Luana"
			name[8]	= "Apollo"
			name[9]	= "Luana"
			name[10] = "Luana"
			name[11] = "Apollo"
			name[12] = "Luana"
			name[13] = "Apollo"
			name[14] = "Luana"
			
			speaker[0] = Apollo
			speaker[1] = Luana
			speaker[2] = Apollo
			speaker[3] = Luana
			speaker[4] = Luana
			speaker[5] = Luana
			speaker[6] = Luana
			speaker[7] = Luana
			speaker[8] = Apollo
			speaker[9] = Luana
			speaker[10] = Luana
			speaker[11] = Apollo
			speaker[12] = Luana
			speaker[13] = Apollo
			speaker[14] = Luana
						  
			break;		  
			
			case "ravi":
		
			text[0] = "Espera Apollo, tem alguém ali na frente... Olá? Quem é você?"
			text[1] = "Finalmente encontrei...O objeto sagrado dos Indus, aquilo que realizara qualquer desejo... sim."
			
			name[0] = "Luana"
			name[1] = "???"
			
			speaker[0] = Luana
			speaker[1] = Mistery
						  
			break;  
			
			case "ravi_2":
		
			text[0] = "Ora, é um prazer vê-los. Foi tão divertido ver vocês explorando está pequena ilha. É admirável ver a curiosidade de vocês."
			text[1] = "Ravi? O que você faz aqui?"
			text[2] = "Pera, ele não foi aquele cara que roubou sua pesquisa?"
			text[3] = "Roubar? Haha. Eu ajudei a Luana, mostrei ao mundo o fruto do seu esforço. Todos ficaram fascinados com aquela tabula."
			text[4] = "Você praticamente me apagou das pesquisas!"
			text[5]	= "Ora Luana, não seja ingênua. Você sem mim não teria nada. Uma mulher ingênua que veio as grandes cidades a busca de oportunidades..."
			text[6]	= "O que eu fiz, foi apenas lhe dar o que queria! Em troca, eu divulguei seu esforço."
			
			name[0] = "???"
			name[1] = "Luana"
			name[2] = "Apollo"
			name[3] = "Luana"
			name[4] = "Luana"
			name[5] = "Luana"
			name[6] = "Luana"

			speaker[0] = Mistery
			speaker[1] = Luana
			speaker[2] = Apollo
			speaker[3] = Ravi
			speaker[4] = Luana
			speaker[5] = Ravi
			speaker[6] = Ravi
						  
			break;		  
			
			case "ravi_3":
		
			text[0] = "Opa, opa, opa! Olha vamo com calma, essa parada aí pode acabar fazendo essa ilha."
			text[1] = "E eu me importo com esta ilha? Com isso aqui, eu posso realizar tudo que eu quiser."
			
			name[0] = "Apollo"
			name[1] = "Ravi"
	
			speaker[0] = Apollo
			speaker[1] = Ravi
						  
			break;		  
	}
}	