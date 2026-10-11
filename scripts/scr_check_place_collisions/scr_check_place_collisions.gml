// called from art_object
// _x and _y are the proposed position
function check_object_place_collisions(_x, _y)
{
    var _list = ds_list_create();
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
    
        if (_inst != id && _inst.blocks_player)
        {
            ds_list_destroy(_list);
            return true;
        }
    }

    ds_list_destroy(_list);
    
    // Get the collision tilemap's tile dimensions
    var _tile_w = tilemap_get_tile_width(obj_game_manager.tiles_col);
    var _tile_h = tilemap_get_tile_height(obj_game_manager.tiles_col);
    
    // Get proposed offset
    var _x_diff = _x - x;
    var _y_diff = _y - y;
    
    var _left = bbox_left + _x_diff;
    var _right = bbox_right + _x_diff;
    var _top = bbox_top + _y_diff;
    var _bottom = bbox_bottom + _y_diff;
    
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