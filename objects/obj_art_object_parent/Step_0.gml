// Inherit the parent event
event_inherited();

// Highlight if at home and player in range of home at home
bonus_outline_condition = at_home && has_highlight_at_home && art_home.player_in_range;

if (ignore_player_collision)
{
    if (!player.is_overlapping_object(id))
    {
        ignore_player_collision = false;
    }
}

// Move independently
if (!at_home && !held && !anim_active && !move_cooldown_active)
{
    maybe_move_art_object();
}

if (anim_active)
{
    update_art_object_animation();
}

// Move with player
if (held && !anim_active)
{
    x = player.x + player.held_obj_x_offset;
    y = player.y + player.held_obj_y_offset;
}