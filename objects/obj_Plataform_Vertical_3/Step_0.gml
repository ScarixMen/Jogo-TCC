if (Check_Pause()) exit;

// ============================
// CHANGE OF DIRECTION
// ============================
vspd = spd * v_dir;

// Detecta limite antes de mover
if (place_meeting(x, y + vspd, obj_Limit_Plataform))
{
    v_dir *= -1; // inverte direção
    vspd = spd * v_dir; // recalcula velocidade após inverter
}

// ============================
// COLISION – empurrar Apollo/Luana
// ============================
var A_colision = place_meeting(x, y + 1, obj_Apollo) 
              or place_meeting(x, y - 1, obj_Apollo);

var L_colision = place_meeting(x, y + 1, obj_Luana) 
              or place_meeting(x, y - 1, obj_Luana);

if (A_colision)
{
    with (obj_Apollo)
        y += other.vspd;
}

if (L_colision)
{
    with (obj_Luana)
        y += other.vspd;
}

// ============================
// APPLY MOVEMENT
// ============================
y += vspd;
