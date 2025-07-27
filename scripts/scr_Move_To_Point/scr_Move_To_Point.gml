function scr_Move_To_Point(_inst, _targetX, _spd, _sprWalk, _sprIdle)
{
    var dir = sign(_targetX - _inst.x);
    _inst.hspd = dir * _spd;

    if (_inst.hspd != 0) _inst.image_xscale = sign(_inst.hspd);
    _inst.sprite_index = (abs(_inst.hspd) > 0) ? _sprWalk : _sprIdle;

    if (abs(_targetX - _inst.x) <= _spd)
    {
        _inst.x = _targetX;
        _inst.hspd = 0;
        _inst.sprite_index = _sprIdle;
        return true;
    }
    return false;
}
