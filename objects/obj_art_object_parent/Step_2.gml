if (at_home)
{
    
    depth = -art_home.bbox_bottom - 1;
}
else if (held)
{
    depth = -player.bbox_bottom;
}
else
{
    // Inherit the parent event
    event_inherited();
}