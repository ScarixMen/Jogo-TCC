if (Check_Pause()) exit;
function check_puzzle_step_Temple(stone_id) {
    if (solved) return true; // se já resolveu, ignora

    var correct = sequence_correct[sequence_progress];

    if (stone_id == correct) {
        sequence_progress++;

        // completou a sequência correta
        if (sequence_progress >= array_length(sequence_correct)) {
            solved = true;
			
			global.som.tocarSFX(sfx_Puzzle_Apollo_Win)
			
			if(solved) alarm[0] = 180
			
            with (obj_Temple_Puzzle_Apollo_1) { locked = true; sprite_index = spr_Temple_Puzzle_Apollo_1_On; image_speed = 0; }
            with (obj_Temple_Puzzle_Apollo_2) { locked = true; sprite_index = spr_Temple_Puzzle_Apollo_2_On; image_speed = 0; }
            with (obj_Temple_Puzzle_Apollo_3) { locked = true; sprite_index = spr_Temple_Puzzle_Apollo_3_On; image_speed = 0; }
            with (obj_Temple_Puzzle_Apollo_4) { locked = true; sprite_index = spr_Temple_Puzzle_Apollo_4_On; image_speed = 0; }
            with (obj_Temple_Puzzle_Apollo_5) { locked = true; sprite_index = spr_Temple_Puzzle_Apollo_5_On; image_speed = 0; }
            with (obj_Temple_Puzzle_Apollo_6) { locked = true; sprite_index = spr_Temple_Puzzle_Apollo_6_On; image_speed = 0; }
            with (obj_Temple_Puzzle_Apollo_7) { locked = true; sprite_index = spr_Temple_Puzzle_Apollo_7_On; image_speed = 0; }
            with (obj_Temple_Puzzle_Apollo_8) { locked = true; sprite_index = spr_Temple_Puzzle_Apollo_8_On; image_speed = 0; }
			with (obj_Temple_Puzzle_Apollo_9) { locked = true; sprite_index = spr_Temple_Puzzle_Apollo_9_On; image_speed = 0; }
            with (obj_Temple_Puzzle_Apollo_10) { locked = true; sprite_index = spr_Temple_Puzzle_Apollo_10_On; image_speed = 0; }
            with (obj_Temple_Puzzle_Apollo_11) { locked = true; sprite_index = spr_Temple_Puzzle_Apollo_11_On; image_speed = 0; }
        }
        return true;
    } else {
        // ERRO → reseta tudo
		
        sequence_progress = 0;
		global.som.tocarSFX(sfx_Genius_Error)

        with (obj_Temple_Puzzle_Apollo_1) { if (!locked) { activated = false; sprite_index = spr_Temple_Puzzle_Apollo_1_Idle; image_speed = 0; } }
        with (obj_Temple_Puzzle_Apollo_2) { if (!locked) { activated = false; sprite_index = spr_Temple_Puzzle_Apollo_2_Idle; image_speed = 0; } }
        with (obj_Temple_Puzzle_Apollo_3) { if (!locked) { activated = false; sprite_index = spr_Temple_Puzzle_Apollo_3_Idle; image_speed = 0; } }
        with (obj_Temple_Puzzle_Apollo_4) { if (!locked) { activated = false; sprite_index = spr_Temple_Puzzle_Apollo_4_Idle; image_speed = 0; } }
        with (obj_Temple_Puzzle_Apollo_5) { if (!locked) { activated = false; sprite_index = spr_Temple_Puzzle_Apollo_5_Idle; image_speed = 0; } }
        with (obj_Temple_Puzzle_Apollo_6) { if (!locked) { activated = false; sprite_index = spr_Temple_Puzzle_Apollo_6_Idle; image_speed = 0; } }
        with (obj_Temple_Puzzle_Apollo_7) { if (!locked) { activated = false; sprite_index = spr_Temple_Puzzle_Apollo_7_Idle; image_speed = 0; } }
        with (obj_Temple_Puzzle_Apollo_8) { if (!locked) { activated = false; sprite_index = spr_Temple_Puzzle_Apollo_8_Idle; image_speed = 0; } }
		with (obj_Temple_Puzzle_Apollo_9) { if (!locked) { activated = false; sprite_index = spr_Temple_Puzzle_Apollo_9_Idle; image_speed = 0; } }
        with (obj_Temple_Puzzle_Apollo_10) { if (!locked) { activated = false; sprite_index = spr_Temple_Puzzle_Apollo_10_Idle; image_speed = 0; } }
        with (obj_Temple_Puzzle_Apollo_11) { if (!locked) { activated = false; sprite_index = spr_Temple_Puzzle_Apollo_11_Idle; image_speed = 0; } }

        return false;
    }
}