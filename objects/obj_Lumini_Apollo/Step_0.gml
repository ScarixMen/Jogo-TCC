if (Check_Pause()) exit;

if(start){
	if (instance_exists(target)) {
	    // --- Distância "atrás" dependendo do lado ---
	    if (target.image_xscale < 0) {
	        target_offset = 55;   // esquerda = mais perto
	    } else {
	        target_offset = -120;  // direita = mais longe
	    }

	    // suavizar a troca de lado
	    current_offset = lerp(current_offset, target_offset, 0.1);

	    // --- Posição alvo ---
	    var tx = target.x + current_offset;
	    var ty = target.y - 200;

	    // seguir suavemente
	    base_x = lerp(base_x, tx, 0.1);
	    base_y = lerp(base_y, ty, 0.1);

	    // --- Flutuação ---
	    osc += 0.05;
	    var offset_y = sin(osc) * 20;

	    // posição final
	    x = base_x;
	    y = base_y + offset_y;
	}
}else{
	base_x = x;
	base_y = y;
}