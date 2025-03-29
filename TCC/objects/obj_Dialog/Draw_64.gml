var guiw = display_get_gui_width();
var guih = display_get_gui_height();

var xx = 0;
var yy = 700;
var c = c_black;

draw_rectangle_color(xx,yy,guiw,guih,c_red,c,c,c,false);

draw_text_ext(xx + 32, yy + 32, text[page], 32, guiw + 64);