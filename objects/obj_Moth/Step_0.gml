if (Check_Pause()) exit;

script_execute(state);

var _x1 = obj_Apollo.x;
var _y1 = obj_Apollo.y;
var _x2 = obj_Luana.x;
var _y2 = obj_Luana.y;

// Distâncias do player até cada alvo
var dist1 = point_distance(x, y, _x1, _y1);
var dist2 = point_distance(x, y, _x2, _y2);

// Retornar o mais próximo
if (dist1 < dist2) {
    target = obj_Apollo;
} else {
    target = obj_Luana;
}