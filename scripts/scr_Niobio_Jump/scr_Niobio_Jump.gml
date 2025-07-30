/// @param obj        - personagem (Niobio)
/// @param dest_x     - X final
/// @param dest_y     - Y final (topo da base)
/// @param jump_speed - velocidade vertical inicial
/// @param dir        - direção (-1 = esquerda, 1 = direita)

function scr_Niobio_Jump_To(obj, dest_x, dest_y, jump_speed, dir)
{
    // Estado temporário de pulo
    if (!variable_instance_exists(obj, "jumping_to_target")) {
        obj.jumping_to_target = true;
        obj.vspd = -jump_speed; // impulso para cima
        obj.hspd = dir * obj.spd * 1.5; // um pouco mais rápido
        obj.sprite_index = spr_Niobio_Jump;
    }

    // Chegou ou passou do destino
    if (obj.y >= dest_y) {
        obj.y = dest_y;
        obj.hspd = 0;
        obj.vspd = 0;
        obj.sprite_index = spr_Niobio_Idle;
        obj.jumping_to_target = false;
        return true;
    }

    return false;
}
