Input_Apollo()

if (place_meeting(x, y, obj_Apollo) && interact_Apollo) {
    if (!locked) {
        var control = instance_find(obj_Boss_Fight_Puzzle, 0);
        if (control != noone) {
            var result = control.check_puzzle_step(stone_id);

            if (result) {
                sprite_index = sprite_light_up;
                image_speed = 1;
                activated = true;
                alarm[0] = room_speed * 0.2;
            } else {
                sprite_index = sprite_turn_off;
                image_speed = 1;
                alarm[0] = room_speed * 0.2;
            }
        }
    }
}
