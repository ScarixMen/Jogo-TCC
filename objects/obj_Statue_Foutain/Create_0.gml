if (Check_Pause()) exit;
start_dialog_done = false;



var distApollo = point_distance(x, y, obj_Apollo.x, obj_Apollo.y);
var distLuana  = point_distance(x, y, obj_Luana.x, obj_Luana.y);
var distancia = (distApollo < distLuana) ? distApollo : distLuana;

var distancia_max = 500;
var distancia_min = 30;
var fator_volume = clamp(1 - ((distancia - distancia_min) / (distancia_max - distancia_min)), 0, 1);

// toca o som ajustando pelo volume calculad
