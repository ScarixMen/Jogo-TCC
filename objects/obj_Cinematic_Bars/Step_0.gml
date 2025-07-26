// Faz alpha interpolar suavemente para target_alpha
alpha = lerp(alpha, target_alpha, alpha_speed);

// Opcional: trava alpha no intervalo 0 a 1
alpha = clamp(alpha, 0, 1);
