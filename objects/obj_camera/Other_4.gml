// convert center coords to top left corner
var _cam_x = following.x - view_w / 2;
var _cam_y = following.y - view_h / 2;

camera_set_view_pos(camera, _cam_x, _cam_y);