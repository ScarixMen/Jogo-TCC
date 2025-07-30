/// scr_Move_To_Point_Cutscene(obj, target_x, spd, spr_walk, spr_idle)
/// Retorna true quando chegar no destino
function scr_Move_To_Point_Cutscene(obj, target_x, spd, spr_walk, spr_idle) {
    var dx = target_x - obj.x;

    // Verifica se chegou
    if (abs(dx) <= 2) {
        obj.hspd = 0;
        obj.sprite_index = spr_idle;
        return true;
    }

    // Movimento forçado
    obj.hspd = sign(dx) * spd;
    obj.x += obj.hspd;

    // Direção forçada
    obj.image_xscale = sign(obj.hspd);

    // Sprite de movimento
    obj.sprite_index = spr_walk;

    return false;
}
