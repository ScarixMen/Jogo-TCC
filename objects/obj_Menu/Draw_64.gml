// Atualiza tempo de espera
if (!iniciar_alpha) {
    tempo_espera += 1;
    
    if (tempo_espera >= room_speed * 3) {
        image = 1;
        iniciar_alpha = true;
    }
}

// Move sprites para os lados depois do tempo
if (iniciar_alpha) {
    x_luana += 10;
    x_apollo -= 10;
    
    // Começa o fade-in do texto/botões
    if (alpha < 1) {
        alpha += fade_speed;
        if (alpha > 1) alpha = 1;
    }
}

var dist = 80;
var larg_t = display_get_gui_width(); 
var alt_t = display_get_gui_height(); 
var _x = larg_t / 2;
var _y = alt_t / 2;

image_index = image;
image_speed = 0;

// Desenha os sprites com X animado
draw_set_alpha(1);
draw_sprite(spr_Luana_Menu, -1, x_luana, 0);
draw_sprite(spr_Apollo_Menu, -1, x_apollo,alt_t);

// Só desenha os botões/textos se alpha > 0
if (alpha > 0) {
    draw_set_alpha(alpha);

    for (var i = 0; i < opc_max; i++) {
        var _w = larg_ini;
        var _h = alt_ini;
        var _cor = c_black;

        if (i == indice) {
            _w = larg;
            _h = alt;
            _cor = c_blue;
        }

        draw_sprite_stretched(spr_Borda, 0, _x - _w / 2, _y + (dist * i) - _h / 2, _w, _h);

        draw_set_font(Font_Menu);
        draw_set_halign(fa_center);
        draw_set_valign(fa_center);
        draw_set_color(_cor);
        draw_text(_x, _y + (dist * i), opc[i]);
    }
}

// Reset
draw_set_alpha(1);
draw_set_color(-1);
draw_set_font(-1);
