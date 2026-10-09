// Inherit the parent event
event_inherited();

// Highlight if at home and player in range of home at home
bonus_outline_condition = at_home && art_home.player_in_range;

if (ignore_player_collision)
{
    if (!player.is_overlapping_object(id))
    {
        ignore_player_collision = false;
    }
}

// *************************
var _rand = random(10);
if (!at_home && !move_cooldown_active && _rand < 5)
{
    var _started_move = try_to_move_a_step();
    show_debug_message("started move (" + string(sprite_index) + ") = " + string(_started_move));
    update_vars();
}
// *************************

if (anim_active)
{
    // Update in case player moved
    if (anim_type == "pickup")
    {
        anim_target_x = player.x + player.held_obj_x_offset;
        anim_target_y = player.y + player.held_obj_y_offset;
        
        anim_progress += 1 / pickup_anim_duration;
    }
    else if (anim_type == "setdown")
    {
        anim_target_x = player.place_obj_x;
        anim_target_y = player.place_obj_y;
        
        anim_progress += 1 / setdown_anim_duration;
    }
    else if (anim_type == "put_home")
    {
        // no need to update target x,y
        
        anim_progress += 1 / setdown_anim_duration;
    }
    else if (anim_type == "move")
    {
        // no need to update target x,y
        
        anim_progress += 1 / move_anim_duration;
    }

    var _t = clamp(anim_progress, 0, 1);

    // Ease the animation
    _t = 1 - power(1 - _t, 3);

    // Quadratic Bezier curve
    x = (1 - _t) * (1 - _t) * anim_start_x
      + 2 * (1 - _t) * _t * anim_control_x
      + _t * _t * anim_target_x;

    y = (1 - _t) * (1 - _t) * anim_start_y
      + 2 * (1 - _t) * _t * anim_control_y
      + _t * _t * anim_target_y;

    if (anim_progress >= 1)
    {
        if (anim_type == "pickup")
            set_as_held();
        else if (anim_type == "setdown")
            set_not_held();
        else if (anim_type == "put_home")
            set_at_home();
        else if (anim_type == "move")
            end_move();
        
        update_vars();
    }
}

// Move with player
if (held && !anim_active)
{
    x = player.x + player.held_obj_x_offset;
    y = player.y + player.held_obj_y_offset;
}