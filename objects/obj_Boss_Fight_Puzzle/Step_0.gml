function check_puzzle_step(stone_id) {
    if (solved) return true; // se já resolveu, ignora

    var correct = sequence_correct[sequence_progress];

    if (stone_id == correct) {
        sequence_progress++;

        // completou a sequência correta
        if (sequence_progress >= array_length(sequence_correct)) {
            solved = true;
            show_debug_message("Puzzle Resolvido!");

            // trava todas as pedras (nenhuma mais interage)
            with (obj_Beach_Puzzle_Apollo_1) { locked = true; sprite_index = spr_Beach_Puzzle_Apollo_1_On; image_speed = 0; }
            with (obj_Beach_Puzzle_Apollo_2) { locked = true; sprite_index = spr_Beach_Puzzle_Apollo_2_On; image_speed = 0; }
            with (obj_Beach_Puzzle_Apollo_3) { locked = true; sprite_index = spr_Beach_Puzzle_Apollo_3_On; image_speed = 0; }
            with (obj_Beach_Puzzle_Apollo_4) { locked = true; sprite_index = spr_Beach_Puzzle_Apollo_4_On; image_speed = 0; }
            with (obj_Beach_Puzzle_Apollo_5) { locked = true; sprite_index = spr_Beach_Puzzle_Apollo_5_On; image_speed = 0; }
            with (obj_Beach_Puzzle_Apollo_6) { locked = true; sprite_index = spr_Beach_Puzzle_Apollo_6_On; image_speed = 0; }
            with (obj_Beach_Puzzle_Apollo_7) { locked = true; sprite_index = spr_Beach_Puzzle_Apollo_7_On; image_speed = 0; }
            with (obj_Beach_Puzzle_Apollo_8) { locked = true; sprite_index = spr_Beach_Puzzle_Apollo_8_On; image_speed = 0; }
        }
        return true;
    } else {
        // ERRO → reseta tudo
        sequence_progress = 0;

        with (obj_Beach_Puzzle_Apollo_1) { if (!locked) { activated = false; sprite_index = spr_Beach_Puzzle_Apollo_1_Idle; image_speed = 0; } }
        with (obj_Beach_Puzzle_Apollo_2) { if (!locked) { activated = false; sprite_index = spr_Beach_Puzzle_Apollo_2_Idle; image_speed = 0; } }
        with (obj_Beach_Puzzle_Apollo_3) { if (!locked) { activated = false; sprite_index = spr_Beach_Puzzle_Apollo_3_Idle; image_speed = 0; } }
        with (obj_Beach_Puzzle_Apollo_4) { if (!locked) { activated = false; sprite_index = spr_Beach_Puzzle_Apollo_4_Idle; image_speed = 0; } }
        with (obj_Beach_Puzzle_Apollo_5) { if (!locked) { activated = false; sprite_index = spr_Beach_Puzzle_Apollo_5_Idle; image_speed = 0; } }
        with (obj_Beach_Puzzle_Apollo_6) { if (!locked) { activated = false; sprite_index = spr_Beach_Puzzle_Apollo_6_Idle; image_speed = 0; } }
        with (obj_Beach_Puzzle_Apollo_7) { if (!locked) { activated = false; sprite_index = spr_Beach_Puzzle_Apollo_7_Idle; image_speed = 0; } }
        with (obj_Beach_Puzzle_Apollo_8) { if (!locked) { activated = false; sprite_index = spr_Beach_Puzzle_Apollo_8_Idle; image_speed = 0; } }

        return false;
    }
}
