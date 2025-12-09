//if (Check_Pause()) exit;

draw_set_font(Font_Menu)
var guiw = display_get_gui_width();
var guih = display_get_gui_height();

var xx = 0;
var yy = 620;

//draw_sprite(spr_Dialog_Box,0,0,0)

//draw_sprite(speaker[page],0,0,565)

draw_set_color(c_white)

draw_set_valign(fa_middle)
draw_set_halign(fa_center)
draw_set_font(global.fontUI);
draw_text(640,605,name[page]);

draw_set_valign(fa_middle)
draw_set_halign(fa_center)

draw_set_font(Font_Menu)
draw_text_ext(640, yy+50 , text[page], 32, guiw - 384);

draw_set_color(-1)
