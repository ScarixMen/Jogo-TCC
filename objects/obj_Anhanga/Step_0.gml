if Check_Pause() exit;

script_execute(state);

angle += rotation_speed;
if (angle >= 360) {
    angle -= 360;
}

