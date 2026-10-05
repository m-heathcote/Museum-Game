player = instance_find(obj_player, 0);
following = player;

camera = view_camera[0];
view_w = camera_get_view_width(camera);
view_h = camera_get_view_height(camera);

camera_speed = 0.09;