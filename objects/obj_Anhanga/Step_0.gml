if Check_Pause() exit;

script_execute(state);

angle += rotation_speed;
if (angle >= 360) {
    angle -= 360;
}

x = center_x + lengthdir_x(radius, angle);
y = center_y + lengthdir_y(radius, angle);