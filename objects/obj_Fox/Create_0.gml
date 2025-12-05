state = Fox_State_Run;
spd = 7;

// Direção inicial (1 = direita, -1 = esquerda)
dir = 0;

// Decide o alvo mais próximo
var best_dist = 9999999;
var chosen = noone;

// Encontra instância REAL mais próxima
if (instance_exists(obj_Apollo)) {
    var d = point_distance(x,y, obj_Apollo.x, obj_Apollo.y);
    if (d < best_dist) {
        best_dist = d;
        chosen = obj_Apollo;
    }
}

if (instance_exists(obj_Luana)) {
    var d = point_distance(x,y, obj_Luana.x, obj_Luana.y);
    if (d < best_dist) {
        best_dist = d;
        chosen = obj_Luana;
    }
}

// Agora define direção APENAS UMA VEZ
if (chosen != noone)
{
    if (chosen.x > x) dir = 1;  // direita
    else dir = -1;              // esquerda
}

image_xscale = dir; // vira só 1x
