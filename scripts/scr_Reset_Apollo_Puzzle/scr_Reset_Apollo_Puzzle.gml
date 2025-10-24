function scr_Reset_Apollo_Puzzle() {
    with (obj_Beach_Puzzle_Apollo_1) { activated = false; locked = false; sprite_index = spr_Beach_Puzzle_Apollo_1_Idle; image_speed = 0; }
    with (obj_Beach_Puzzle_Apollo_2) { activated = false; locked = false; sprite_index = spr_Beach_Puzzle_Apollo_2_Idle; image_speed = 0; }
    with (obj_Beach_Puzzle_Apollo_3) { activated = false; locked = false; sprite_index = spr_Beach_Puzzle_Apollo_3_Idle; image_speed = 0; }
    with (obj_Beach_Puzzle_Apollo_4) { activated = false; locked = false; sprite_index = spr_Beach_Puzzle_Apollo_4_Idle; image_speed = 0; }
    with (obj_Beach_Puzzle_Apollo_5) { activated = false; locked = false; sprite_index = spr_Beach_Puzzle_Apollo_5_Idle; image_speed = 0; }
    with (obj_Beach_Puzzle_Apollo_6) { activated = false; locked = false; sprite_index = spr_Beach_Puzzle_Apollo_6_Idle; image_speed = 0; }
    with (obj_Beach_Puzzle_Apollo_7) { activated = false; locked = false; sprite_index = spr_Beach_Puzzle_Apollo_9_Idle; image_speed = 0; }
    with (obj_Beach_Puzzle_Apollo_8) { activated = false; locked = false; sprite_index = spr_Beach_Puzzle_Apollo_10_Idle; image_speed = 0; }

    var puzzle = instance_find(obj_Boss_Fight_Puzzle, 0);
    if (puzzle != noone) {
        puzzle.sequence_progress = 0;
        puzzle.solved = false;
    }
}
