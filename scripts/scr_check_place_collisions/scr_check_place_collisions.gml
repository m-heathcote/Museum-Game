// called from art_object
// _x and _y are the proposed position
function check_object_place_collisions(_x, _y)
{
    // Get proposed offset
    var _x_diff = _x - x;
    var _y_diff = _y - y;
    
    var _left = bbox_left + _x_diff;
    var _right = bbox_right + _x_diff;
    var _top = bbox_top + _y_diff;
    var _bottom = bbox_bottom + _y_diff;
    
    var _list = ds_list_create();
    
    /*
    // Get list of room objects in the proposed position
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
     * */
    
    //show_debug_message("(checking place collisions)");
    
    var _list_len = instance_place_list(
        _x,
        _y,
        obj_room_object_parent,
        _list,
        false
    );
    
    for (var _i = 0; _i < _list_len; _i++)
    {
        var _inst = _list[| _i];
        
        show_debug_message("found inst! - " + string(_inst.sprite_index));
        
        if (_inst == id)
        {
            show_debug_message("  found id match! - " + string(_inst.sprite_index));
        }

        if (_inst != id && _inst.blocks_player)
        //if (_inst.blocks_player)
        {
            ds_list_destroy(_list);
            return true;
        }
    }

    ds_list_destroy(_list);
    
    /*
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
     * */
    
    // Get the collision tilemap's tile dimensions
    var _tile_w = tilemap_get_tile_width(obj_game_manager.tiles_col);
    var _tile_h = tilemap_get_tile_height(obj_game_manager.tiles_col);
    
    // Find the tile-aligned bounds of the object's bounding box
    var _start_x = floor(_left / _tile_w) * _tile_w;
    var _end_x   = floor(_right / _tile_w) * _tile_w;
    var _start_y = floor(_top / _tile_h) * _tile_h;
    var _end_y   = floor(_bottom / _tile_h) * _tile_h;
    
    // Check every tile position covered by the bounding box
    for (var _tx = _start_x; _tx <= _end_x; _tx += _tile_w)
    {
        for (var _ty = _start_y; _ty <= _end_y; _ty += _tile_h)
        {
            if (tilemap_get_at_pixel(
                obj_game_manager.tiles_col,
                _tx,
                _ty
            ) != 0)
            {
                return true;
            }
        }
    }
    
    
    return false;
}