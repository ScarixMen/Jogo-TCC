if (Check_Pause()) exit;

// =============================
// MOVIMENTO / PARADA NO LIMIT
// =============================

vspd = spd * v_dir;

// Se estiver esperando, fica PARADO
if (waiting)
{
    vspd = 0;

    wait_time++;

    if (wait_time >= wait_delay)
    {
        v_dir *= -1;   // muda direção
        waiting = false;
        wait_time = 0;
    }
}
else
{
    // Se bater no limit, PARA e inicia espera
    if (instance_place(x, y + vspd, obj_Limit_Plataform))
    {
        waiting = true;
        vspd = 0; // para imediatamente
    }
}


// =============================
// COLISÕES + ESMAGAMENTO
// =============================

// Verificar toque na plataforma
var A_touch = place_meeting(x, y + 1, obj_Apollo) 
           || place_meeting(x, y - 1, obj_Apollo);

var L_touch = place_meeting(x, y + 1, obj_Luana) 
           || place_meeting(x, y - 1, obj_Luana);


// Detectar se existe bloco sólido acima do player
var Apollo_above = instance_exists(obj_Apollo) 
    ? place_meeting(obj_Apollo.x, obj_Apollo.y - 1, obj_Rock_Colision)
    : false;

var Luana_above = instance_exists(obj_Luana) 
    ? place_meeting(obj_Luana.x, obj_Luana.y - 1, obj_Rock_Colision)
    : false;


// ================= APOLLO =================
if (A_touch)
{
    if (Apollo_above)
    {
        // MORTE POR ESMAGAMENTO
        with (obj_Apollo)
        {
            damage_Apollo();
        }
    }
    else
    {
        // Movimento normal
        with (obj_Apollo)
        {
            y += other.vspd;
        }
    }
}


// ================= LUANA =================
if (L_touch)
{
    if (Luana_above)
    {
        // MORTE POR ESMAGAMENTO
        with (obj_Luana)
        {
            damage_Luana();
        }
    }
    else
    {
        // Movimento normal
        with (obj_Luana)
        {
            y += other.vspd;
        }
    }
}


// =============================
// APLICAR MOVIMENTO
// =============================
y += vspd;
