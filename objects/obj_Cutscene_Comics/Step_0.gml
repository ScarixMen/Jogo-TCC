// Mantém o objeto no centro da GUI
x = display_get_gui_width()  * 0.5;
y = display_get_gui_height() * 0.4;

// Contador para skips automáticos
if (!variable_instance_exists(id, "dialog_step")) dialog_step = 0;

// ==========================
//     SEM TRANSIÇÃO
// ==========================
if (next == -1)
{
    cutscene_timer++;
    dialog_timer++;

    // -----------------------------
    // Quadros 14 e 15: dois skips automáticos
    // -----------------------------
    if (current == 14 || current == 15)
    {
        cutscene_delay = room_speed * 8; // quadro dura mais

        if (dialog_step == 0)
        {
            global.skip = true; // primeiro skip
            dialog_step = 1;
        }
        else if (dialog_step == 1 && cutscene_timer >= cutscene_delay / 2)
        {
            global.skip = true; // segundo skip
            dialog_step = 2;
        }
    }
    else
    {
        cutscene_delay = room_speed * 4; // delay padrão

        // Skip normal a partir do quadro 1 (não dispara no quadro 0)
        if (current >= 2 && dialog_step == 0)
        {
            global.skip = true; // dispara uma vez
            dialog_step = 1;   // garante que não repita
        }
    }

    // Avança quadro normalmente
    if (cutscene_timer >= cutscene_delay)
    {
        cutscene_timer = 0;

        if (current < array_length(comics) - 1)
        {
            next = current + 1;
            progress = 0;
            dir = 1;

            dialog_step = 0; // reset ao entrar no próximo quadro
        }
        else
        {
            room_goto(rm_Tutorial);
        }
    }
}

// ==========================
//       SLIDE / TRANSIÇÃO
// ==========================
if (next != -1)
{
    progress += 0.04;

    if (progress >= 1)
    {
        current = next;
        next = -1;
        progress = 0;
    }
}

// ==========================
//        CONTROLES
// ==========================
if (keyboard_check(ord("R")))
{
    audio_stop_all();
    room_restart();
}

if (keyboard_check(vk_escape))
{
    room_goto(rm_Menu);
}
