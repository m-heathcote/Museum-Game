// called from art_object
function check_object_place_collisions(_x, _y)
{
    // Check for overlapping room objects
    var _inst = instance_place(
        _x,
        _y,
        obj_room_object_parent
    );

    if (_inst != noone && _inst != id)
    {
        if (_inst.blocks_player)
        {
            return true;
        }
    }
    
    // Get proposed offset
    var _x_diff = _x - x;
    var _y_diff = _y - y;
    
    var _left = bbox_left + _x_diff;
    var _right = bbox_right + _x_diff;
    var _top = bbox_top + _y_diff;
    var _bottom = bbox_bottom + _y_diff;
    
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