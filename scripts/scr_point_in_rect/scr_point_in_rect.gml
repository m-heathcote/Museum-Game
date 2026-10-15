// true if (_px, _py) is within the rectangle at (_x, _y) with the given width and height
function point_in_rect(_px, _py, _x, _y, _w, _h)
{
    return (
        _px >= _x &&
        _px <= _x + _w &&
        _py >= _y &&
        _py <= _y + _h
    );
}