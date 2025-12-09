/// =======================
// CREATE EVENT - obj_Ravi

// --- STATE ---
state = Ravi_State_Idle;

// --- SPLASH ---
splash_step = 0;
special_step = 0;
splash_timer = 0;
random_timer = 0;
last_random_x = x;

// --- WAVE ---
wave_spawned = false;
wave_stage = 0;
wave_repeat_count = 0;

// --- MIX WAVE + SPLASH ---
mix_repeat_count = 0;
mix_step = 0;
mix_splash_step = 1;

// --- STAGE TIMERS ---
stage_one_timer = 0;
stage_two_timer = 0;

// --- GLOBAL ARRAY PARA POSIÇÕES DE SPLASH ---
if (!variable_global_exists("splash_ocupado")) global.splash_ocupado = [];

// --- FLAGS DE SEGURANÇA ---
if (!variable_instance_exists(id, "wave_repeat_count")) wave_repeat_count = 0;
if (!variable_instance_exists(id, "mix_repeat_count")) mix_repeat_count = 0;
