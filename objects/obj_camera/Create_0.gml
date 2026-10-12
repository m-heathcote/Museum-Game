player = instance_find(obj_player, 0);
following = player;

camera = view_camera[0];
view_w = camera_get_view_width(camera);   // 320
view_h = camera_get_view_height(camera);  // 180

camera_speed = 0.08;

camera_y_offset = -25;

push_ahead_val = 8;
x_push_ahead = 0;
y_push_ahead = 0;