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
    var _max_distance = 32;
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
    
    // Nothing was available -> place at player pos
    if (!held_obj.check_place_collisions(x, y + place_obj_y_offset))
    {
        place_obj_x = x;
        place_obj_y = y + place_obj_y_offset;
        return;
    }
    
    // If player pos invalid -> check other directions
    var _furthest_allowed_dist = 90;
    var _new_facing = (facing + 90) mod 360;
    
    // Loop through 3 other directions
    for (var _i = 0; _i < 3; _i++)
    {
        // from player to furthest pos
        for (var _distance = 0; _distance <= _furthest_allowed_dist; _distance += _step_distance)
        {
            var _check_x = x + lengthdir_x(_distance, _new_facing);
            var _check_y = y + lengthdir_y(_distance, _new_facing) + _y_offset;
            
            if (!held_obj.check_place_collisions(_check_x, _check_y))
            {
                place_obj_x = _check_x;
                place_obj_y = _check_y;
                return;
            }
        }
        _new_facing = (_new_facing + 90) mod 360;
    }
    
    // If nothing works -> use last valid pos
}