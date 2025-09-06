if (Check_Pause()) exit;

draw_set_font(Font_Menu)
var guiw = display_get_gui_width();
var guih = display_get_gui_height();

var xx = 0;
var yy = 620;

draw_sprite(spr_Dialog_Box,0,0,0)

draw_sprite(speaker[page],0,0,565)

draw_set_color(c_white)

draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_text(525,570,name[page]);

draw_set_valign(-1)
draw_set_halign(-1)

draw_text_ext(xx + 192, yy , text[page], 32, guiw - 384);

draw_set_color(-1)
