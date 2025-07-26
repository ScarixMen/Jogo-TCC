if (alpha > 0.01) {
    draw_set_alpha(alpha);
    draw_set_color(c_black);

	draw_rectangle(0, 720 - bar_height, display_get_width(), display_get_height(), false);


	draw_rectangle(0, 0, display_get_width(), bar_height, false); // topo

    draw_set_alpha(1);
    draw_set_color(c_white);
}
