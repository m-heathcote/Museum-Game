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

if (held_obj != noone && !obj_anim_active && !player_anim_active && keyboard_check_pressed(interact_key))
{
    // Place object
    held_obj.set_down();
}