// Checks for a collision at the position where the instance
// is going to move (x + _move_x, y + _move_y)
function check_object_collisions(_move_x, _move_y){
    // check for any room object
    var _inst = instance_place(
        x + _move_x,
        y + _move_y,
        obj_room_object_parent
    );

    if (_inst != noone)
    {
        if (_inst.blocks_player)
        {
            return true;
        }
    }

    return false;
}