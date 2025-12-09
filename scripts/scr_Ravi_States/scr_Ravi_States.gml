/// =======================
// IDLE NORMAL
function Ravi_State_Idle()
{
    sprite_index = spr_Ravi_Idle_Not_Flower;
}

/// =======================
// CUTSCENE
function Ravi_State_Cutscene()
{
    sprite_index = spr_Ravi_Idle_Not_Flower;
}

/// =======================
// START → Mãos
function Ravi_State_Start()
{
    if (!instance_exists(obj_Attack_Hand_Water_Protection))
        instance_create_layer(x - 240, y, layer, obj_Attack_Hand_Water_Protection);

    if (!instance_exists(obj_Attack_Hand_Water_Wall))
        instance_create_layer(x - 1700, y, layer, obj_Attack_Hand_Water_Wall);

    sprite_index = spr_Ravi_Idle_Flower_Start;

    var hand  = instance_find(obj_Attack_Hand_Water_Protection, 0);
    var hand2 = instance_find(obj_Attack_Hand_Water_Wall, 0);

    if (hand != noone && hand.image_index >= hand.image_number - 1)
    {
        hand.sprite_index = spr_Attack_Hand_Water_Idle;
        hand.image_speed = 1;
    }

    if (hand2 != noone && hand2.image_index >= hand2.image_number - 1)
    {
        hand2.sprite_index = spr_Attack_Hand_Water_Wall_Idle;
        hand2.image_speed = 1;
    }

    if (
        image_index >= image_number - 1 &&
        hand  != noone &&
        hand2 != noone &&
        hand.sprite_index  == spr_Attack_Hand_Water_Idle &&
        hand2.sprite_index == spr_Attack_Hand_Water_Wall_Idle
    )
    {
        state = Ravi_State_Idle_Flower;
        splash_step = 1;
        splash_timer = room_speed * 1;
        special_step = 0;
        wave_spawned = false;
        wave_stage = 0;
    }
}

/// =======================
// IDLE FLOWER
function Ravi_State_Idle_Flower()
{
    sprite_index = spr_Ravi_Attack_One;

    // ---------- 1 → 12 = Ordenados ----------
    if (splash_step >= 1 && splash_step <= 12)
    {
        splash_timer--;
        if (splash_timer <= 0)
        {
            CriarSplashOrdenado();
            splash_step++;
            splash_timer = room_speed * 1;
        }
        return;
    }

    // ---------- 13 → Espera 3s ----------
    if (splash_step == 13)
    {
        splash_timer--;
        if (splash_timer <= 0)
        {
            splash_step = 14;
            random_timer = room_speed * 8;
            splash_timer = 0;
        }
        return;
    }

    // ---------- 14 → Random ----------
    if (splash_step == 14)
    {
        random_timer--;
        splash_timer--;

        if (splash_timer <= 0)
        {
            CriarSplashRandom();
            splash_timer = room_speed * 1.5;
        }

        if (random_timer <= 0)
        {
            splash_step = 15;
            splash_timer = room_speed * 5;
        }
        return;
    }

    // ---------- 15 → Pausa ----------
    if (splash_step == 15)
    {
        splash_timer--;
        if (splash_timer <= 0)
        {
            splash_step = 16;
            special_step = 0;
            splash_timer = room_speed * 1;
        }
        return;
    }

    // ---------- 16 → Sequência especial ----------
    if (splash_step == 16)
    {
        splash_timer--;
        if (splash_timer <= 0)
        {
            CriarSplashSequenciaEspecial();
            special_step++;
            splash_timer = room_speed * 1;
        }

        if (special_step >= 12)
        {
            splash_step = 0;
            state = Ravi_State_Stage_One;
            stage_one_timer = room_speed * 5;
        }
        return;
    }
}

/// =======================
// STAGE ONE
function Ravi_State_Stage_One()
{
    sprite_index = spr_Ravi_Stage_One;

    if (image_index >= image_number - 1)
    {
        image_index = 7;
        stage_one_timer--;
        if (stage_one_timer <= 0)
        {
            state = Ravi_State_Wave;
            wave_spawned = false;
            wave_stage = 0;
            wave_repeat_count = 0;
        }
    }
}

/// =======================
// STAGE TWO
function Ravi_State_Stage_Two()
{
    sprite_index = spr_Ravi_Stage_Two;

    if (image_index >= image_number - 1)
    {
        image_index = 8;
        stage_one_timer--;
        if (stage_one_timer <= 0)
        {
            state = Ravi_State_Wave_Splash_Mix;
            mix_repeat_count = 0;
            mix_step = 0;
            mix_splash_step = 1;
            wave_spawned = false;
            splash_timer = room_speed * 1;
        }
    }
}
function Ravi_State_Stage_Three()
{
    sprite_index = spr_Ravi_Stage_Finish;

    if (image_index >= image_number - 1)
    {
		
        
		splash_timer = room_speed * 3
		state = Ravi_State_End
    }
}
function Ravi_State_End()
{
		splash_timer--;
        if (splash_timer <= 0)
        {
			
			global.finish = true
			room_goto(rm_Menu)
			
		}
	sprite_index = spr_Ravi_Stage_Finish_2
	obj_Altar_Artifacts.sprite_index = spr_Altar_Artifacts_Flower
	
	
}

/// =======================
// WAVE NORMAL
function Ravi_State_Wave()
{
    sprite_index = spr_Ravi_Attack_Two;

    // ---------- PRIMEIRA ONDA ---------- 
    if (wave_stage == 0 && !wave_spawned)
    {
        splash_timer--;
        if (splash_timer <= 0)
        {
            var wave_spawn_x = x - 1500;
            var wave_spawn_y = y;
            var wave_inst = instance_create_layer(wave_spawn_x, wave_spawn_y, layer, obj_Attack_Wave);
            wave_inst.wave_direction = 1;
            wave_spawned = true;
            wave_stage = 1;
        }
        return;
    }

    // ---------- ESPERA PRIMEIRA ONDA ---------- 
    if (wave_stage == 1)
    {
        var wave = instance_find(obj_Attack_Wave, 0);
        if (wave == noone)
        {
            splash_timer = room_speed * 3; // pausa antes da segunda onda
            wave_spawned = false;
            wave_stage = 1.5;
        }
        return;
    }

    // ---------- SEGUNDA ONDA ---------- 
    if (wave_stage == 1.5)
    {
        splash_timer--;
        if (splash_timer <= 0)
        {
            var wave_spawn_x = x - 200;
            var wave_spawn_y = y;
            var wave_inst = instance_create_layer(wave_spawn_x, wave_spawn_y, layer, obj_Attack_Wave_Invert);
            wave_inst.wave_direction = -1;
            wave_spawned = true;
            wave_stage = 2;
        }
        return;
    }

    // ---------- ESPERA SEGUNDA ONDA ---------- 
    if (wave_stage == 2)
    {
        var wave2 = instance_find(obj_Attack_Wave, 0);
        var wave2_inv = instance_find(obj_Attack_Wave_Invert, 0);
        if (wave2 == noone && wave2_inv == noone)
        {
            wave_spawned = false;

            if (!variable_instance_exists(id, "wave_repeat_count")) wave_repeat_count = 0;
            wave_repeat_count++;

            if (wave_repeat_count < 3)
            {
                wave_stage = 0;
                splash_timer = room_speed * 3;
            }
            else
            {
                wave_repeat_count = 0;
                wave_stage = 0;
                splash_step = 0;
                special_step = 0;
                splash_timer = 0;
                state = Ravi_State_Stage_Two;
            }
        }
    }
}

/// =======================
// WAVE + SPLASH MIX
function Ravi_State_Wave_Splash_Mix()
{
    sprite_index = spr_Ravi_Attack_Three;

    // Inicialização das variáveis
    if (!variable_instance_exists(id, "mix_repeat_count")) mix_repeat_count = 0;
    if (!variable_instance_exists(id, "mix_step")) mix_step = 0;
    if (!variable_instance_exists(id, "mix_splash_step")) mix_splash_step = 1;
    if (!variable_instance_exists(id, "wave_spawned")) wave_spawned = false;
    if (!variable_instance_exists(id, "splash_timer")) splash_timer = room_speed * 1;

    // -------------------- STEP 0 → Wave --------------------
    if (mix_step == 0)
    {
        if (!wave_spawned)
        {
            var wave_spawn_x = x - 1500;
            var wave_spawn_y = y;
            var wave_inst = instance_create_layer(wave_spawn_x, wave_spawn_y, layer, obj_Attack_Wave);
            wave_inst.wave_direction = 1;
            wave_spawned = true;
        }

        var wave = instance_find(obj_Attack_Wave, 0);
        if (wave == noone)
        {
            wave_spawned = false;
            mix_step = 1;           // passa para splash
            mix_splash_step = 1;
            splash_timer = room_speed * 1;
        }
        return;
    }

    // -------------------- STEP 1 → Splash Ordenado --------------------
    if (mix_step == 1)
    {
        splash_timer--;
        if (splash_timer <= 0)
        {
            var seq = [500, 700, 900, 1100, 1300, 1500, 1500, 1300, 1100, 900, 700, 500];
            var i = mix_splash_step - 1;
            if (i >= 0 && i < array_length(seq))
            {
                var final_x = x - seq[i];
                instance_create_layer(final_x, y, layer, obj_Attack_Splash);
                last_random_x = final_x;
                array_push(global.splash_ocupado, final_x);
            }

            mix_splash_step++;
            splash_timer = room_speed * 1;

            // Se terminou todas as splashes
            if (mix_splash_step > 12)
            {
                mix_step = 0;          // volta para Wave
                mix_repeat_count++;    // incrementa só aqui → ciclo completo
				if (mix_repeat_count >= 1)
				{
				    state = Ravi_State_Stage_Three;
					splash_timer = room_speed * 1.5;
				}
            }	
        }
        return;
    }

    // -------------------- FINALIZAÇÃO --------------------
    if (mix_repeat_count >= 1)
    {
        // Reseta tudo e vai para Cutscene
        //mix_repeat_count = 0;
        //mix_step = 0;
        //mix_splash_step = 1;
       // wave_spawned = false;
        //splash_timer = 0;
        state = Ravi_State_Cutscene;
    }
}


/// =======================
// FUNÇÕES DE SPLASH
function CriarSplashOrdenado()
{
    var seq = [500, 700, 900, 1100, 1300, 1500, 1500, 1300, 1100, 900, 700, 500];
    var i = splash_step - 1;
    if (i < 0 || i >= array_length(seq)) return; // evita erro

    var final_x = x - seq[i];
    instance_create_layer(final_x, y, layer, obj_Attack_Splash);
    last_random_x = final_x;
    array_push(global.splash_ocupado, final_x);
}


function CriarSplashRandom()
{
    var min_dist = 500;
    var max_dist = 1600;
    var final_x = x - 900;

    repeat (30)
    {
        var dist = irandom_range(min_dist, max_dist);
        var test_x = x - dist;

        if (abs(test_x - last_random_x) < 180) continue;
        if (PosicaoOcupada(test_x)) continue;

        final_x = test_x;
        break;
    }

    last_random_x = final_x;
    instance_create_layer(final_x, y, layer, obj_Attack_Splash);
    array_push(global.splash_ocupado, final_x);
}

function CriarSplashSequenciaEspecial()
{
    var ida   = [1,6,5,4,3,2];
    var volta = [2,3,4,5,6,1];
    var lista = array_concat(ida, volta);
    var i     = special_step;

    if (i < array_length(lista))
    {
        var real_index = lista[i] - 1;
        var dist       = 500 + (real_index * 200);
        var final_x    = x - dist;
        instance_create_layer(final_x, y, layer, obj_Attack_Splash);
        last_random_x = final_x;
    }
}

function PosicaoOcupada(xx)
{
    for (var i = 0; i < array_length(global.splash_ocupado); i++)
    {
        if (abs(global.splash_ocupado[i] - xx) < 30)
            return true;
    }
    return false;
}
