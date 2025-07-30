if (battle_active) {

var bx = display_get_gui_width()/2 - 150;
var by = 50;
var bw = 300;
var bh = 20;

draw_set_color(c_gray);
draw_rectangle(bx, by, bx + bw, by + bh, false);

var ratio = bar_value / bar_max;
draw_set_color(c_lime);
draw_rectangle(bx, by, bx + bw * ratio, by + bh, false);

draw_set_color(c_white);
draw_text(bx, by - 20, "barra contra Níobio");

draw_set_color(c_black);
draw_text(100, 100,boss_force)
draw_text(100, 130,luana_force)
}
