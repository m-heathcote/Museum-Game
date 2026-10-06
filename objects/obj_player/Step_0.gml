if (anim_active) exit;

// --------------- INPUT ---------------

// update input_x, input_y, and is_running
get_input();

// --------------- SPEED / ACCELERATION ---------------

// sets hsp/vsp based on speed and acceleration
update_speed();

// --------------- MOVEMENT ---------------

// checks collisions and moves player
move_player();

// --------------- ANIMATION ---------------

// set facing and change sprite
update_animation();

// --------------- OBJ SETDOWN ---------------

if (held_obj != noone && keyboard_check_pressed(interact_key))
{
    held_obj.set_down();
}