function Plataform_Lumini_Portrait()
{
    image_speed = 1;
    
    sprite_index = spr_Plataform_Lumini_Portrait;

    if point_distance(x, y, obj_Apollo.x, obj_Apollo.y) < 450
    {
        if (global.interact_apollo)
        {	
            global.som.tocarSFX(sfx_Plataform_Button);

            // evita ativar se o Apollo estiver em cima da futura colisão
            if !place_meeting(x, y, obj_Player)
            {
                state = Plataform_Lumini_Appear;
            }
        }
    }
}
function Plataform_Lumini_Appear()
{
    if (sprite_index != spr_Plataform_Lumini_Appear) {
        sprite_index = spr_Plataform_Lumini_Appear;
        image_index  = 0;
        image_speed  = 1;
    }

    // cria colisão só se ainda não existir
    if (col_inst == noone || !instance_exists(col_inst)) {
        col_inst = instance_create_layer(x, y, "Instances", obj_Plataform_Lumini_Collision);
    }

    if (image_index >= image_number - 1)
    {
        image_speed = 0;
    }

    if point_distance(x, y, obj_Apollo.x, obj_Apollo.y) < 600
    {
        if (global.interact_apollo)
        {
            global.som.tocarSFX(sfx_Plataform_Button);
            state = Plataform_Lumini_Disappear;
        }
    }
}
function Plataform_Lumini_Disappear()
{
    if (sprite_index != spr_Plataform_Lumini_Disappear) {
        sprite_index = spr_Plataform_Lumini_Disappear;
        image_index  = 0;
        image_speed  = 1;
    }

    if (image_index >= image_number - 1)
    {
        // destrói só a colisão desta plataforma
        if (col_inst != noone && instance_exists(col_inst)) {
            with (col_inst) instance_destroy();
            col_inst = noone;
        }

        state = Plataform_Lumini_Portrait;
    }
}
