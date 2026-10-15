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

var _art_home_in_range = false;
with (obj_art_home_parent)
{
    if (distance_to_object(other) < interact_distance)
    {
        other._art_home_in_range = true;
    }
}

if (held_obj != noone
    && !obj_anim_active
    && !player_anim_active
    && keyboard_check_pressed(interact_key)
    && !_art_home_in_range
)
{
    // Place object
    held_obj.set_down();
}