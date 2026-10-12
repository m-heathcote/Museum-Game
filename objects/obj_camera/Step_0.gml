// ----- PUSH AHEAD -----

var _dir = get_direction(player.facing);
if (_dir == "down")
{
    x_push_ahead = 0;
    y_push_ahead = push_ahead_val;
}
else if (_dir == "up")
{
    x_push_ahead = 0;
    y_push_ahead = -push_ahead_val;
}
else if (_dir == "left")
{
    x_push_ahead = -push_ahead_val;
    y_push_ahead = 0;
}
else if (_dir == "right")
{
    x_push_ahead = push_ahead_val;
    y_push_ahead = 0;
}
else 
{
    x_push_ahead = 0;
    y_push_ahead = 0;
}

// ----- ZOOM -----

var _scale = 1;

// ----- CAMERA SIZE -----

// scaled camera width and height
var _cam_width = view_w / _scale;
var _cam_height = view_h / _scale;

// ----- CAMERA TARGET -----

var _x_target = following.x + x_push_ahead;
var _y_target = following.y + y_push_ahead + camera_y_offset;

// ----- CAMERA POSITION -----

var _center_x;
var _center_y;

// Normal Gameplay: smooth camera follow

// get actual current center position
var _current_center_x = camera_get_view_x(camera) + _cam_width / 2;
var _current_center_y = camera_get_view_y(camera) + _cam_height / 2;

// smooth movement
_center_x = lerp(_current_center_x, _x_target, camera_speed);
_center_y = lerp(_current_center_y, _y_target, camera_speed);

// convert center coords to top left corner
var _cam_x = _center_x - _cam_width / 2;
var _cam_y = _center_y - _cam_height / 2;

// don't go out of bounds
_cam_x = clamp(_cam_x, 0, room_width - view_w);
_cam_y = clamp(_cam_y, 0, room_height - view_h);

// ----- APPLY CAMERA -----

camera_set_view_size(camera, _cam_width, _cam_height);
camera_set_view_pos(camera, _cam_x, _cam_y);