opc = ["Jogar", "Fases", "Opções", "Créditos","Sair"]

opc_max = array_length(opc)

indice = 0

pos = indice

larg_fim = 256
alt_fim = 96

larg = larg_fim
alt = alt_fim 

larg_ini = larg_fim / 2 
alt_ini = alt_fim / 2 

x_luana = 1280
y_luana = 0

x_apollo = 0
y_apollo = 0

alpha = 0
fade_speed = 0.01

tempo_espera = 0;
iniciar_alpha = false;
image = 0

estado_menu = "principal"; // ou pode usar um número se preferir
mostrar_creditos = false;
