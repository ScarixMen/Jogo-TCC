/// DRAW — Cutscene Comics

var w = display_get_gui_width(); // garante centralização no GUI

// quadro atual
draw_sprite(
    comics[current], 0,
    x - (progress * w * dir),
    y
);

// próximo quadro
if (next != -1) {
    draw_sprite(
        comics[next], 0,
        x + ((1 - progress) * w * dir),
        y
    );
}

draw_text(100,100,current)