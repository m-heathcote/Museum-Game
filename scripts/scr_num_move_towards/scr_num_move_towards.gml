function num_move_towards(_current, _target, _amount)
{
    if (_current < _target)
        return min(_current + _amount, _target);
    
    if (_current > _target)
        return max(_current - _amount, _target);
    
    return _current;
}