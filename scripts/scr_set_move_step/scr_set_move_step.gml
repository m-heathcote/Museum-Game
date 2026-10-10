// called in pick_step_coords
function try_step(_x_step, _y_step)
{
    // return true if valid, false if collision
    return !check_object_place_collisions(x + _x_step, y + _y_step);
}

// called from obj_art_object
function pick_step_coords()
{
    var _valid_axes = [];
    if (step_count_x > 0)
    {
        array_push(_valid_axes, "x");
    }
    if (step_count_y > 0)
    {
        array_push(_valid_axes, "y");
    }
    if (step_count_x > 0 && step_count_y > 0)
    {
        array_push(_valid_axes, "both");
    }
    
    var _found = false;
    
    var _x_move = step_size * move_x_multiplier;
    var _y_move = step_size * move_y_multiplier;
    
    while (!_found && array_length(_valid_axes) > 0)
    {
        var _i = irandom(array_length(_valid_axes) - 1);
        var _axis = _valid_axes[_i];
        
        switch (_axis)
        {
            case "x":
                _found = try_step(_x_move, 0);
                if (_found)
                {
                    move_step_x = x + _x_move;
                    move_step_y = y;
                    step_count_x -= 1;
                }
                break;
            
            case "y":
                _found = try_step(0, _y_move);
                if (_found)
                {
                    move_step_x = x;
                    move_step_y = y + _y_move;
                    step_count_y -= 1;
                }
                break;
            
            case "both":
                _found = try_step(_x_move, _y_move);
                if (_found)
                {
                    move_step_x = x + _x_move;
                    move_step_y = y + _y_move;
                    step_count_x -= 1;
                    step_count_y -= 1;
                }
                break;
        }
        
        if (!_found)
        {
            array_delete(_valid_axes, _i, 1);
        }
    }
    
    return _found;
    
}