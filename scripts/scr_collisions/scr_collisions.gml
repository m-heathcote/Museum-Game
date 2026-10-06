// Checks for a collision at the position where the instance
// is going to move (x + _move_x, y + _move_y)
function check_collisions(_move_x, _move_y){
    // Check for Art Home
    var _art_home = instance_place(
        x + _move_x,
        y + _move_y,
        obj_art_home_parent
    );
    
    if (_art_home != noone)
    {
        return true;
    }
    
    // Check for Art Object
    var _art_object = instance_place(
        x + _move_x,
        y + _move_y,
        obj_art_object_parent
    );

    if (_art_object != noone)
    {
        if (!_art_object.at_home)
        {
            return true;
        }
    }
    
    return false;
}