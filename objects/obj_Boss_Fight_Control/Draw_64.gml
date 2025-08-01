if (global.battle_active) {
	// Normaliza valor (0 a 1)
	var ratio = clamp(bar_value / bar_max, 0, 1);

	// Escolhe o frame correto
	var _x = display_get_gui_width() / 2
	var _y = 75
	var frame = floor(ratio * 100); // 0~100
	draw_sprite(spr_Bar_Boss, frame, _x, _y);
	
}