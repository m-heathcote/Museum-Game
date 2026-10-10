// called from art_object
function check_object_place_collisions(_x, _y)
{
    // Get proposed offset
    var _x_diff = _x - x;
    var _y_diff = _y - y;
    
    var _left = bbox_left + _x_diff;
    var _right = bbox_right + _x_diff;
    var _top = bbox_top + _y_diff;
    var _bottom = bbox_bottom + _y_diff;
    
    
    // Get list of room objects in the proposed position
    var _list = ds_list_create();
    var _list_len = collision_rectangle_list(
        _left,
        _top,
        _right,
        _bottom,
        obj_room_object_parent,
        false,
        true, // calling inst excluded
        _list,
        false
    );
    
    for (var _i = 0; _i < _list_len; _i++)
    {
        var _inst = _list[| _i];

        if (_inst.blocks_player)
        {
            ds_list_destroy(_list);
            return true;
        }
    }

    ds_list_destroy(_list);
    
    // Check for tile collisions
    var _middle = tilemap_get_at_pixel(obj_game_manager.tiles_col, _x, _y);
	var _left_top = tilemap_get_at_pixel(obj_game_manager.tiles_col, _left, _top);
	var _right_top = tilemap_get_at_pixel(obj_game_manager.tiles_col, _right, _top);
	var _right_bottom = tilemap_get_at_pixel(obj_game_manager.tiles_col, _right, _bottom);
	var _left_bottom = tilemap_get_at_pixel(obj_game_manager.tiles_col, _left, _bottom);
    
    if (_middle || _left_top || _right_top || _left_bottom || _right_bottom)
	{
		return true;
	}
    
    return false;
}