function Plataform_Temple_Portrait()
{
    sprite_index = spr_Plataform_Temple_Disappear;
    image_index = image_number - 1;
    image_speed = 0;
    appear_finished = false;

    // destrói colisão se existir
    if (col_inst != noone && instance_exists(col_inst))
    {
        with (col_inst) instance_destroy();
        col_inst = noone;
    }
}
function Plataform_Temple_Appear()
{
    // só anima se o player não estiver sobre a plataforma
    if (!place_meeting(x, y, obj_Player))
    {
        if (sprite_index != spr_Plataform_Temple_Appear)
        {
            sprite_index = spr_Plataform_Temple_Appear;
            image_index = 0;
            image_speed = 1;
        }

        // espera terminar animação
        if (image_index >= image_number - 1)
        {
            image_index = image_number - 1;
            image_speed = 0;
            appear_finished = true;

            // cria colisão se ainda não existir
            if (col_inst == noone || !instance_exists(col_inst))
            {
                col_inst = instance_create_layer(x, y, "Instances", obj_Plataform_Temple_Collision);
            }
        }
    }
}
function Plataform_Temple_Disappear()
{
    if (sprite_index != spr_Plataform_Temple_Disappear)
    {
        sprite_index = spr_Plataform_Temple_Disappear;
        image_index = 0;
        image_speed = 1;
    }

    if (image_index >= image_number - 1)
    {
        image_index = image_number - 1;
        image_speed = 0;
        appear_finished = false;

        // destrói colisão
        if (col_inst != noone && instance_exists(col_inst))
        {
            with (col_inst) instance_destroy();
            col_inst = noone;
        }

        state = Plataform_Temple_Portrait;
    }
}
