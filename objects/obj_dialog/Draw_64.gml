if (Check_Pause()) exit;

draw_set_font(Font_Menu)
var guiw = display_get_gui_width();
var guih = display_get_gui_height();

var xx = 0;
var yy = 600;
var c = c_black;
var _c_purple = make_color_rgb(10, 0, 11);

draw_rectangle_color(xx,yy,guiw,guih,_c_purple,_c_purple,_c_purple,c,false);

draw_sprite(speaker[page],0,0,565)

draw_set_color(c_white)

draw_text_ext(xx + 192, yy + 32, text[page], 32, guiw - 256);

draw_set_color(-1)
