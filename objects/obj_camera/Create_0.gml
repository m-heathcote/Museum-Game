player = instance_find(obj_player, 0);
following = player;

camera = view_camera[0];
view_w = camera_get_view_width(camera);   // 320
view_h = camera_get_view_height(camera);  // 180

camera_speed = 0.08;

camera_y_offset = -18;

push_ahead_val = 8;
x_push_ahead = 0;
y_push_ahead = 0;

function set_camera(_center_x, _center_y, _use_offset=false)
{
    // Convert center coords to top left corner
    var _cam_x = _center_x - view_w / 2;
    var _cam_y = _center_y - view_h / 2;
    
    if (_use_offset)
    {
        _cam_y += camera_y_offset;
    }
    
    // Apply
    camera_set_view_size(camera, view_w, view_h);
    camera_set_view_pos(camera, _cam_x, _cam_y + camera_y_offset);
}