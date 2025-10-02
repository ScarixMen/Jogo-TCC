function scr_Move_To_Point_Luminis(_inst, _targetX, _targetY, _spd)
{
    var dx = _targetX - _inst.x;
    var dy = _targetY - _inst.y;

    // Se já chegou no ponto
    if (abs(dx) <= _spd && abs(dy) <= _spd)
    {
        _inst.x = _targetX;
        _inst.y = _targetY;
        return true;
    }

    // Move suavemente usando direção e spd
    var dir = point_direction(_inst.x, _inst.y, _targetX, _targetY);
    _inst.x += lengthdir_x(_spd, dir);
    _inst.y += lengthdir_y(_spd, dir);

    return false;
}
