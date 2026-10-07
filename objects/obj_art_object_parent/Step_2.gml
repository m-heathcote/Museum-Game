if (at_home)
{
    
    depth = -art_home.bbox_bottom - 1; // above art home
}
else if (anim_active && get_direction(player.facing) == "up")
{
    depth = -player.bbox_bottom + 1; // behind player
}
//else if (anim_active && anim_type == "setdown" && get_direction(player.facing) == "down")
else if (anim_active)
{
    depth = -player.bbox_bottom - 1; // above player
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