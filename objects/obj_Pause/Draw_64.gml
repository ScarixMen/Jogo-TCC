var _sprite_pause = spr_Portrait_Pause;
var _sprite_pause_reset = spr_Portrait_Pause_Reset;
var _x_Portrait_Pause = display_get_gui_width() / 2;
var _y_Portrait_Pause = display_get_gui_height() / 2;
var _c_yellow = make_color_rgb(255, 224, 139);
var dist = 120;
var sprite = 0;

if (pause_state != "normal") {

    // Fundo escuro da pausa (já tinha)
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    draw_set_alpha(1);

    var _x = display_get_gui_width() / 2;
    var _y = display_get_gui_height() / 2;

    // Desenhar animação pausa
    switch (pause_state) {
        case "entering":
        case "paused":
            draw_sprite(spr_Portrait_Pause, floor(pause_frame), _x, _y);
            break;
        case "exiting":
            draw_sprite(spr_Portrait_Pause_Reset, floor(pause_frame), _x, _y);
            break;
    }
    
	if (pause_state == "paused") {
    draw_set_alpha(1);
    
    var menu_y = display_get_gui_height() / 2 - 100; // Posição abaixo do retrato

	    for (var i = 0; i < opc_max; i++) {
	        var _w = larg_ini;
	        var _h = alt_ini;
	        var _cor = c_white;
				sprite = spr_Board_Off;

	        if (i == indice) {
	            _w = larg;
	            _h = alt;
	            _cor = _c_yellow;
	            sprite = spr_Board_On;
	        }

	        draw_sprite_stretched(sprite, 0, _x_Portrait_Pause - _w / 2, menu_y + (dist * i) - _h / 2, _w, _h);

	        draw_set_font(global.fontUI);
	        draw_set_halign(fa_center);
	        var y_string = (menu_y + (dist * i)) - (string_height(opc[i]) * 0.4 * 0.5);
	        draw_set_color(_cor);
	        draw_text_ext_transformed(_x_Portrait_Pause, y_string, opc[i], 0, 100, 0.4, 0.4, 0);
	    }
	}
}

#region Draw Reset
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_alpha(1);
draw_set_color(-1);
draw_set_font(-1);
#endregion
