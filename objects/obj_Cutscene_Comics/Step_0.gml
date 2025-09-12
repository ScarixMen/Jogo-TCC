Input_Menu();

if (next == -1) {
    if (right) {
        if (current < array_length(comics) - 1) {
            // ainda tem quadrinho -> avança
            next = current + 1;
            progress = 0;
            dir = 1;
        }
        else {
            // já está no último -> vai pra sala
            room_goto(rm_Tutorial);
        }
    }
    if (left) {
        if (current > 0) {
            next = current - 1;
            progress = 0;
            dir = -1;
        }
    }
}

if (next != -1) {
    progress += 0.04; // velocidade
    if (progress >= 1) {
        current = next;
        next = -1;
        progress = 0;
    }
}
