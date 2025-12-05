/// Step Event da plataforma (copie inteirinho)

if (Check_Pause()) exit;

// -----------------------------
// MOVIMENTO / PARADA NO LIMIT
// -----------------------------
vspd = spd * v_dir;

if (waiting)
{
    vspd = 0;
    wait_time++;
    if (wait_time >= wait_delay)
    {
        v_dir *= -1;
        waiting = false;
        wait_time = 0;
    }
}
else
{
    if (instance_place(x, y + vspd, obj_Limit_Plataform))
    {
        waiting = true;
        vspd = 0;
    }
}

// -----------------------------
// PASSAGEM: exponha a vspd pra dentro dos with blocks
// -----------------------------
vspd_local = vspd; // variável de instância usada dentro do with (other.vspd_local)
// OBS: cada instância tem seu próprio vspd_local, não conflita entre plataformas

// -----------------------------
// HELP: tolerância para colisões (ajuste se necessário)
// -----------------------------
var tol = 3; // pixels de tolerância para evitar missed-collisions em alta velocidade
var vert_range = abs(vspd_local) + tol;

// -----------------------------
// FUNÇÃO: checa se há overlap horizontal entre player e esta plataforma
// -----------------------------
function _horiz_overlap(p_left, p_right, plat_left, plat_right)
{
    return !(p_right < plat_left || p_left > plat_right);
}

// -----------------------------
// TRATAR obj_Apollo (se existir)
// -----------------------------
if (instance_exists(obj_Apollo))
{
    with (obj_Apollo)
    {
        // usa other.* pra acessar dados da plataforma atual
        // primeiro ver se existe overlap horizontal com esta plataforma
        if (_horiz_overlap(bbox_left, bbox_right, other.bbox_left, other.bbox_right))
        {
            // está em cima (player bottom colado ao topo da plataforma) — dentro de um pequeno range vertical
            var on_top = bbox_bottom <= other.bbox_top + tol && bbox_bottom >= other.bbox_top - vert_range;

            // está por baixo (player top colado ao bottom da plataforma)
            var under_platform = bbox_top >= other.bbox_bottom - tol && bbox_top <= other.bbox_bottom + vert_range;

            // ---- ESMAGAMENTO: só checar se o player está realmente sobre/embaixo desta instância ----
            if (on_top)
            {
                // se a plataforma estiver subindo e há rock acima do player -> esmagado
                if (other.v_dir == -1 && place_meeting(x, y - 1, obj_Rock_Colision))
                {
                    damage_Apollo();
                    // NÃO retorna aqui (pode querer parar outras ações), mas como player morreu, nada mais importa
                }
                else
                {
                    // empurra o player junto com a plataforma (antes de mover a plataforma)
                    y += other.vspd_local;

                    // se houve overlap (o player "afundou" na plataforma), corrija suavemente
                    if (bbox_bottom > other.bbox_top)
                    {
                        y -= (bbox_bottom - other.bbox_top);
                    }
                }
            }
            else if (under_platform)
            {
                // se a plataforma estiver descendo e há rock abaixo do player -> esmagado
                if (other.v_dir == 1 && place_meeting(x, y + 1, obj_Rock_Colision))
                {
                    damage_Apollo();
                }
                else
                {
                    // quando player está por baixo, plataforma empurra para baixo (se aplicável)
                    y += other.vspd_local;

                    if (bbox_top < other.bbox_bottom)
                    {
                        y += (other.bbox_bottom - bbox_top);
                    }
                }
            }
            // se não estiver on_top nem under_platform: não fazer nada (player não está tocando esta instância)
        }
    }
}


// -----------------------------
// TRATAR obj_Luana (se existir)  (mesma lógica que Apollo)
// -----------------------------
if (instance_exists(obj_Luana))
{
    with (obj_Luana)
    {
        if (_horiz_overlap(bbox_left, bbox_right, other.bbox_left, other.bbox_right))
        {
            var on_top = bbox_bottom <= other.bbox_top + tol && bbox_bottom >= other.bbox_top - vert_range;
            var under_platform = bbox_top >= other.bbox_bottom - tol && bbox_top <= other.bbox_bottom + vert_range;

            if (on_top)
            {
                if (other.v_dir == -1 && place_meeting(x, y - 1, obj_Rock_Colision))
                {
                    damage_Luana();
                }
                else
                {
                    y += other.vspd_local;
                    if (bbox_bottom > other.bbox_top)
                        y -= (bbox_bottom - other.bbox_top);
                }
            }
            else if (under_platform)
            {
                if (other.v_dir == 1 && place_meeting(x, y + 1, obj_Rock_Colision))
                {
                    damage_Luana();
                }
                else
                {
                    y += other.vspd_local;
                    if (bbox_top < other.bbox_bottom)
                        y += (other.bbox_bottom - bbox_top);
                }
            }
        }
    }
}


// -----------------------------
// AGORA SIM: mover a plataforma (só depois de mover players)
// -----------------------------
y += vspd_local;

// opcional: limpa variável temporária (não necessário, mas evita confusão)
vspd_local = 0;
