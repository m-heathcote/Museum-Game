if (at_home || (anim_active && anim_type == "put_home"))
{
    depth = -art_home.bbox_bottom - 1; // above art home
}
else if (anim_active && anim_type != "move" && get_direction(player.facing) == "up")
{
    depth = -player.bbox_bottom + 1; // behind player
}
else if (anim_active && anim_type != "move")
{
    depth = -player.bbox_bottom - 1; // above player
}
else if (anim_active && anim_type == "move")
{
    depth = anim_start_depth;
}
else if (held)
{
    depth = -player.bbox_bottom; // same as player
}
else
{
    // Inherit the parent event
    event_inherited();
}