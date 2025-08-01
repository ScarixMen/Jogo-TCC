timer = room_speed*10

// Barra
bar_value = 100;
bar_max = 100;
bar_min = 0;

// Forças
boss_force = 0.4;
luana_force = 9;
penalty_apollo = 15;
penalty_luana = 0.5;

// Estados
global.battle_active = false;
apollo_finished = false;
battle_result = 0; // 0 = em andamento, 1 = vitória, -1 = derrota

// Referências (já na room)
niobio = instance_find(obj_Niobio, 0);
luana  = instance_find(obj_Luana, 0);
