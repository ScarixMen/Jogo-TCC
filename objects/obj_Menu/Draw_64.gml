// Animação inicial
if (!iniciar_alpha) {
    tempo_espera += 1;
    if (tempo_espera >= room_speed * 1) {
        image = 1;
        iniciar_alpha = true;
    }
}

if (iniciar_alpha) {
    if (x_luana < 1523) x_luana += 10;
    if (x_apollo > -230) x_apollo -= 10;

    if (alpha < 1) {
        alpha += fade_speed;
        if (alpha > 1) alpha = 1;
    }
}

// Desenha fundo
var dist = 80;
var larg_t = display_get_gui_width(); 
var alt_t = display_get_gui_height(); 
var _x = larg_t / 2;
var _y = alt_t / 2 - 100;

image_index = image;
image_speed = 0;

draw_set_alpha(1);
draw_sprite(spr_Luana_Menu, -1, x_luana, 0);
draw_sprite(spr_Apollo_Menu, -1, x_apollo, alt_t);

// Desenha o menu se não estiver nos créditos
if (!mostrar_creditos && alpha > 0) {
    draw_set_alpha(alpha);

    for (var i = 0; i < opc_max; i++) {
        var _w = larg_ini;
        var _h = alt_ini;
        var _cor = c_white;

        if (i == indice) {
            _w = larg;
            _h = alt;
            _cor = c_red;
        }

        draw_sprite_stretched(spr_Borda, 0, _x - _w / 2, _y + (dist * i) - _h / 2, _w, _h);

        draw_set_font(Font_Menu);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(_cor);
        draw_text(_x, _y + (dist * i), opc[i]);
    }
}

// Tela de créditos
if (estado_menu == "creditos") {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    var _x = gui_w / 2;
    var _y = gui_h / 2 - 100;

    // Texto dos créditos
    draw_set_color(c_white);
    draw_set_font(Font_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_x, _y,
        "Créditos\n\n\n\nProdutor:   Mateus Nascimento \nProgramador:   Gabriel Pegado\nRoterista:   Matheus Lenon\nSound Designer:   Gustavo Tofano\nDesigner De Cenários:   Matheus Bastos\nDesigner De Personagens:   Clara Sodré");

    // Botão "Voltar" com estilo de menu
    draw_set_alpha(alpha);

    var _w = larg_ini;
    var _h = alt_ini;
    var _cor = c_white;


    _w = larg;
    _h = alt;
    _cor = c_red;


	var voltar_y = _y + 360; // posição mais abaixo dos créditos

	draw_sprite_stretched(spr_Borda, 0, _x - _w / 2, voltar_y - _h / 2, _w, _h);



    draw_set_font(Font_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(_cor);
   	draw_text(_x, voltar_y, opc[0]);

    draw_set_alpha(1);
    draw_set_color(-1);
    draw_set_font(-1);
}

draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_alpha(1);
draw_set_color(-1);
draw_set_font(-1);
