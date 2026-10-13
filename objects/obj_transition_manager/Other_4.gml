if(transition.room_start) transition.room_start();

if (instance_exists(obj_camera) && instance_exists(obj_player))
{
    obj_camera.set_camera(obj_player.x, obj_player.y);
}