 // Posição alvo
var tx = target.x;
var ty = target.y ;

// Direção de movimento
var dir = point_direction(base_x, base_y, tx, ty);

// Seguir o alvo
if (point_distance(base_x, base_y, tx, ty) < 1300) {
    base_x += lengthdir_x(spd, dir);
    base_y += lengthdir_y(spd, dir);
}

// Flutuação
osc += 0.12;
var offset_y = sin(osc) * 20;

x = base_x;
y = base_y + offset_y;

// Virar pro alvo
image_xscale = (tx < x) ? 1 : -1;

if(place_meeting(x,y,obj_Apollo))
{
	with(obj_Apollo){
        if(state != Apollo_State_Death_Forest_Anhanga){
            image_index = 0;
            damage_Apollo_Forest_Anhanga()
        }
    }
}