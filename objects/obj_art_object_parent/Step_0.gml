// Update Vars
blocks_player = !at_home;
interactable = !at_home && !held;
has_shadow = !at_home && !held && !anim_active;

// Inherit the parent event
event_inherited();

if (anim_active)
{
    anim_progress += 1 / anim_duration;

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
            set_as_held(player);
        else if (anim_type == "setdown")
            set_not_held(player);
    }
}

// Move with player
if (held && !anim_active)
{
    x = player.x + player.held_obj_x_offset;
    y = player.y + player.held_obj_y_offset;
}