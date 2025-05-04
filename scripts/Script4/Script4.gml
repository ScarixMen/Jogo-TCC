function draw_parallax_layers(vx, vy) {
    draw_layer_at("b_Sky",                  lerp(0, vx, 0.8), vy);
    draw_layer_at("b_Dense_Forest_Back",    lerp(0, vx, 0.7), vy);
    draw_layer_at("b_Dense_Forest_Front",   lerp(0, vx, 0.6), vy);
    draw_layer_at("b_Temple",               lerp(0, vx, 0.5), vy);
    draw_layer_at("b_Tree_Back",            lerp(0, vx, 0.4), vy);
    draw_layer_at("b_Tree_Front",           lerp(0, vx, 0.3), vy);
    draw_layer_at("b_Bush_Back",            lerp(0, vx, 0.2), vy);
    draw_layer_at("b_Bush_Front",           lerp(0, vx, 0.1), vy);
}
