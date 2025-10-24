
var distApollo = point_distance(x, y, obj_Apollo.x, obj_Apollo.y);
var distLuana  = point_distance(x, y, obj_Luana.x, obj_Luana.y);
var distancia = (distApollo < distLuana) ? distApollo : distLuana;

var distancia_max = 1000;
var distancia_min = 1;
fator_volume = clamp(1 - ((distancia - distancia_min) / (distancia_max - distancia_min)), 0, 1);

// Vetor do lado
var x1, y1, x2, y2;

// Definir pontos do lado atual
switch(side_index){
    case 0: // topo
        x1 = base.x; y1 = base.y;
        x2 = base.x + base.sprite_width; y2 = base.y;
        break;
    case 1: // direita
        x1 = base.x + base.sprite_width; y1 = base.y;
        x2 = base.x + base.sprite_width; y2 = base.y + base.sprite_height;
        break;
    case 2: // baixo
        x1 = base.x + base.sprite_width; y1 = base.y + base.sprite_height;
        x2 = base.x; y2 = base.y + base.sprite_height;
        break;
    case 3: // esquerda
        x1 = base.x; y1 = base.y + base.sprite_height;
        x2 = base.x; y2 = base.y;
        break;
}

// Vetor e comprimento
var dx = x2 - x1;
var dy = y2 - y1;
var length = sqrt(dx*dx + dy*dy);

// Avançar
pos_on_side += speed;

// Passou do lado? Vai para o próximo
if(pos_on_side >= length){
    pos_on_side -= length;
    side_index = (side_index + 1) mod 4;
    
    // Atualizar dx, dy para o novo lado
    switch(side_index){
        case 0: x1 = base.x; y1 = base.y; x2 = base.x + base.sprite_width; y2 = base.y; break;
        case 1: x1 = base.x + base.sprite_width; y1 = base.y; x2 = base.x + base.sprite_width; y2 = base.y + base.sprite_height; break;
        case 2: x1 = base.x + base.sprite_width; y1 = base.y + base.sprite_height; x2 = base.x; y2 = base.y + base.sprite_height; break;
        case 3: x1 = base.x; y1 = base.y + base.sprite_height; x2 = base.x; y2 = base.y; break;
    }
    dx = x2 - x1;
    dy = y2 - y1;
    length = sqrt(dx*dx + dy*dy);
}

// Atualizar posição
x = x1 + (dx/length) * pos_on_side;
y = y1 + (dy/length) * pos_on_side;

// Ajuste para ficar grudado
if(dx == 0){ // vertical
    if(dy > 0) x = x1 + sprite_width/2;
    else x = x1 - sprite_width/2;
}else{ // horizontal
    if(dx > 0) y = y1 - sprite_height/2;
    else y = y1 + sprite_height/2;
}

// 🔹 Trocar sprite **após atualizar lado e posição**
sprite_index = side_sprites[side_index];

// Atualiza hitbox

    // Segue a cobra
	hitbox.x = x;
	hitbox.y = y;
	hitbox.mask_index = side_sprites[side_index]; // cada lado da cobra

