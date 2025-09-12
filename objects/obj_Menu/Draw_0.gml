
#region Intro Animation
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
#endregion

#region Visual Setup
var _c_yellow = make_color_rgb(255, 224, 139);
var sprite = 0;
var dist = 120;
var larg_t = display_get_gui_width(); 
var alt_t = display_get_gui_height(); 
var _x = larg_t / 2;
var _y = alt_t / 2.5;

image_index = image;
image_speed = 0;
#endregion

#region Background and Persons
draw_set_alpha(1);
draw_sprite(spr_Luana_Menu, -1, x_luana, 0);
draw_sprite(spr_Apollo_Menu, -1, x_apollo, alt_t);
#endregion

#region Main Menu Options
if (!mostrar_creditos && alpha > 0 && estado_menu == "principal") {
    draw_set_alpha(alpha);
    
    var menu_y = alt_t / 3;

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

        draw_sprite_stretched(sprite, 0, _x - _w / 2, menu_y + (dist * i) - _h / 2, _w, _h);

        draw_set_font(global.fontUI);
        draw_set_halign(fa_center);
        var y_string = (menu_y + (dist * i)) - (string_height(opc[i]) * 0.6 * 0.5);
        draw_set_color(_cor);
        draw_text_ext_transformed(_x, y_string, opc[i], 0, 100, 0.6, 0.6, 0);
    }

    // Botão SAIR separado
    var exit_y = 670;
    var exit_x = 1230;
    var exit_w = larg_ini_exit;
    var exit_h = alt_ini_exit;
    var exit_sprite = spr_Exit_Off;

    if (indice == opc_max) {
        exit_w = larg_exit;
        exit_h = alt_exit;
        exit_sprite = spr_Exit_On;
    }

    draw_sprite_stretched(exit_sprite, 0, exit_x - exit_w / 2, exit_y - exit_h / 2, exit_w, exit_h);
}
#endregion

#region Fases Menu Options
if (!mostrar_creditos && alpha > 0 && estado_menu == "fases") {
    draw_set_alpha(alpha);
    
    var menu_y = alt_t / 5;

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

        draw_sprite_stretched(sprite, 0, _x - _w / 2, menu_y + (dist * i) - _h / 2, _w, _h);

        draw_set_font(global.fontUI);
        draw_set_halign(fa_center);
        var y_string = (menu_y + (dist * i)) - (string_height(opc[i]) * 0.6 * 0.5);
        draw_set_color(_cor);
        draw_text_ext_transformed(_x, y_string, opc[i], 0, 100, 0.6, 0.6, 0);
    }

    // Botão VOLTAR separado
    var back_y = 670;
    var back_x = 1230;
    var back_w = larg_ini_exit;
    var back_h = alt_ini_exit;
    var back_sprite = spr_Back_Off;

    if (indice == opc_max) {
        back_w = larg_exit;
        back_h = alt_exit;
        back_sprite = spr_Back_On;
    }

    draw_sprite_stretched(back_sprite, 0, back_x - back_w / 2, back_y - back_h / 2, back_w, back_h);
}
#endregion

#region Options Screen
if (estado_menu == "opcoes") {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    _x = gui_w / 2;

    var start_y = gui_h / 2 - 150;
    var dist_y = 160;

    var vol_values = [
        global.som.sfx_volume,
        global.som.bgm_volume,
        global.som.amb_volume
    ];

    var labels = ["Efeitos", "Musica", "Ambiente"];

    draw_set_font(global.fontUI);
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);

    for (var i = 0; i < 3; i++) {
        var y_barra = start_y + i * dist_y;
        draw_set_color((indice == i) ? _c_yellow : c_white);
        draw_text(_x, y_barra - 24, labels[i]);
        var frame = round(clamp(vol_values[i] * 10, 0, 10));
        draw_sprite(spr_Sound_Bar, frame, _x, y_barra);
    }

     // Botão VOLTAR separado
    var back_y = 670;
    var back_x = 1230;
    var back_w = larg_ini_exit;
    var back_h = alt_ini_exit;
    var back_sprite = spr_Back_Off;

    if (indice == opc_max) {
        back_w = larg_exit;
        back_h = alt_exit;
        back_sprite = spr_Back_On;
    }

    draw_sprite_stretched(back_sprite, 0, back_x - back_w / 2, back_y - back_h / 2, back_w, back_h);
}
#endregion

#region Credits Screen
if (estado_menu == "creditos") {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    var _x = gui_w / 2;
    var _y = gui_h / 2 - 100;

    draw_set_color(c_white);
    draw_set_font(Font_Menu);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(_x, _y,
        "Créditos\n\n\n\nProdutor:   Mateus Nascimento \nProgramador:   Gabriel Pegado\nRoterista:   Matheus Lenon\nSound Designer:   Gustavo Tofano\nDesigner De Cenários:   Matheus Bastos\nDesigner De Personagens:   Clara Sodré");

  // Botão VOLTAR separado
    var back_y = 670;
    var back_x = 1230;
    var back_w = larg_ini_exit;
    var back_h = alt_ini_exit;
    var back_sprite = spr_Back_Off;

    if (indice == opc_max) {
        back_w = larg_exit;
        back_h = alt_exit;
        back_sprite = spr_Back_On;
    }

    draw_sprite_stretched(back_sprite, 0, back_x - back_w / 2, back_y - back_h / 2, back_w, back_h);
}
#endregion

#region Draw Reset
draw_set_font(-1);
draw_set_halign(-1);
draw_set_valign(-1);
draw_set_alpha(1);
draw_set_color(-1);
draw_set_font(-1);
#endregion
