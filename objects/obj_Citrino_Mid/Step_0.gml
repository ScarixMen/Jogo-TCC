if (Check_Pause()) exit;

script_execute(state)

var distApollo = point_distance(x, y, obj_Apollo.x, obj_Apollo.y);
var distLuana  = point_distance(x, y, obj_Luana.x, obj_Luana.y);
var distancia = (distApollo < distLuana) ? distApollo : distLuana;

var distancia_max = 1500;
var distancia_min = 1;
fator_volume = clamp(1 - ((distancia - distancia_min) / (distancia_max - distancia_min)), 0, 1);