function object_jump_from_home()
{
    var _found_step = set_start_move_target_and_step();
    
    if (_found_step)
    {
        object_move_a_step();
        update_vars();
        art_home.art_at_home = false;
    }
    
    return _found_step;
}

function check_for_open_y_move(_dir)
{
    var _min_distance = step_size;
    var _max_distance = step_size * 3;
    var _step_distance = 2;
    
    for (var _distance = _min_distance; _distance < _max_distance; _distance += _step_distance)
    {
        var _check_x = x;
        var _check_y = y + (_distance * _dir);
        
        if (!check_place_collisions(_check_x, _check_y))
        {
            move_target_x = _check_x;
            move_target_y = _check_y;
            move_step_x = _check_x;
            move_step_y = _check_y;
            
            return true;
        }
    }
    return false;
}

function set_start_move_target_and_step()
{
    // Check moving down
    var _success = check_for_open_y_move(1);
    
    // Check moving up
    if (!_success)
    {
        _success = check_for_open_y_move(-1);
    }
    
    return _success;
}