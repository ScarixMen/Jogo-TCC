// Create Event da plataforma

spd = 2;            // velocidade
v_dir = -1;          // direção inicial (1 = descendo, -1 = subindo)

timer = 0;          // contador para esperar no limite
timer_delay = room_speed * 1.5;   // 3 segundos de espera

// variáveis auxiliares
vspd = 0;
waiting = false;
wait_time = 0;
wait_delay = room_speed * 1.5;
