// --------------- MOVEMENT ---------------

// update input_x, input_y, and is_running
get_input();

// sets hsp/vsp based on speed and acceleration
update_speed();

// checks collisions and moves player
move_player();

// set facing and change sprite
update_animation();

// --------------- OBJ SETDOWN ---------------

// update place_obj_x and place_obj_y
update_place_position();

if (held_obj != noone && keyboard_check_pressed(interact_key))
{
    held_obj.set_down();
}