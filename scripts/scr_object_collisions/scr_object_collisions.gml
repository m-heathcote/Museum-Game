// Checks for an object collision at the position where the instance
// is going to move (x + _move_x, y + _move_y)
function check_object_collisions(_move_x, _move_y)
{
    var _list = ds_list_create();

    /*
    var _list_len = collision_rectangle_list(
        bbox_left + _move_x,
        bbox_top + _move_y,
        bbox_right + _move_x,
        bbox_bottom + _move_y,
        obj_room_object_parent,
        false,
        true,
        _list,
        false
    );
     * */
    var _list_len = instance_place_list(
        x + _move_x,
        y + _move_y,
        obj_room_object_parent,
        _list,
        false
    );

    for (var _i = 0; _i < _list_len; _i++)
    {
        var _inst = _list[| _i];

        if (_inst.blocks_player && !_inst.ignore_player_collision)
        {
            ds_list_destroy(_list);
            return true;
        }
    }

    ds_list_destroy(_list);

    return false;
}