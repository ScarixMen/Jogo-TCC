delay_vitoria = 0;
ativo = false;
estado = "esperando";
sequencia = [];
indice_atual = 0;
tempo_espera = 30;
tempo_atual = 0;
indice_entrada = 0;
global.botoes_2 = [obj_Genius_Blue_Temple, obj_Genius_Green_Temple, obj_Genius_Red_Temple, obj_Genius_Yellow_Temple];
a = obj_Genius_Blue_Temple or obj_Genius_Green_Temple or obj_Genius_Red_Temple or obj_Genius_Yellow_Temple

if(estado == "fim") exit;
if (!ativo) {
	ativo = true;
	estado = "tocando";
	sequencia = [];
	array_push(sequencia, irandom(3));
	indice_entrada = 0;
	indice_atual = 0;
	tempo_atual = 0;
	delay_vitoria = 0;
}