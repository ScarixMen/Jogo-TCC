if (next == -1) {
    if (keyboard_check_pressed(vk_right)) {
        if (current < array_length(comics) - 1) {
            next = current + 1;
            progress = 0;
            dir = 1;
        }
    }
    if (keyboard_check_pressed(vk_left)) {
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
