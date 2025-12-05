if (Check_Pause()) exit;

var distApollo = point_distance(x, y, obj_Apollo.x, obj_Apollo.y);
var distLuana  = point_distance(x, y, obj_Luana.x, obj_Luana.y);
var distancia = (distApollo < distLuana) ? distApollo : distLuana;

var distancia_max = 800;
var distancia_min = 30;
fator_volume = clamp(1 - ((distancia - distancia_min) / (distancia_max - distancia_min)), 0, 1);

script_execute(state);

var _x1 = obj_Apollo.x;
var _y1 = obj_Apollo.y;
var _x2 = obj_Luana.x;
var _y2 = obj_Luana.y;

var dist1 = apollo_pego ? 999999 : point_distance(x, y, _x1, _y1);
var dist2 = luana_pego  ? 999999 : point_distance(x, y, _x2, _y2);

// Se os dois estiverem pegos → nenhuma escolha
if (dist1 >= 999999 && dist2 >= 999999) {
    target = noone;
} else if (dist1 < dist2) {
    target = obj_Apollo;
} else {
    target = obj_Luana;
}
