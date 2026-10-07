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

var _art_home_in_range =
    instance_exists(obj_art_home_parent)
    && distance_to_object(obj_art_home_parent) < obj_art_home_parent.interact_distance;

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