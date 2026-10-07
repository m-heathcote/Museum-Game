// Called from Player obj
// Updates place_obj_x and place_obj_y
function update_place_position()
{
    if (held_obj == noone)
    {
        place_obj_x = x;
        place_obj_y = y + place_obj_y_offset;
        return;
    }
    
    var _facing_text = get_direction(facing);
    var _y_offset = 0;
    
    var _min_distance = 0;
    var _max_distance = 30;
    var _step_distance = 2;
    
    if (_facing_text == "left" || _facing_text == "right")
    {
        _y_offset = place_obj_y_offset
    }
    else if (_facing_text == "up")
    {
        _max_distance = 6;
    }
    else if (_facing_text == "down")
    {
        _max_distance = 22;
    }
    
    for (var _distance = _max_distance; _distance >= _min_distance; _distance -= _step_distance)
    {
        var _check_x = x + lengthdir_x(_distance, facing);
        var _check_y = y + lengthdir_y(_distance, facing) + _y_offset;
        
        if (!held_obj.check_place_collisions(_check_x, _check_y))
        {
            place_obj_x = _check_x;
            place_obj_y = _check_y;
            return;
        }
    }
    
    // Nothing was available
    place_obj_x = x;
    place_obj_y = y + place_obj_y_offset;
}