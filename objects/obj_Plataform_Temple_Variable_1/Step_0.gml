if (Check_Pause()) exit;
script_execute(state)

if (button_pressed && state == Plataform_Temple_Portrait && !place_meeting(x, y, obj_Player))
{
    state = Plataform_Temple_Appear;
}
