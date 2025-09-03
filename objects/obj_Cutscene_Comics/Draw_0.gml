var w = room_width;

// atual
draw_sprite(comics[current], 0, x - progress * w * dir, y);

// próximo/anterior
if (next != -1) {
    draw_sprite(comics[next], 0, x + (1 - progress) * w * dir, y);
}