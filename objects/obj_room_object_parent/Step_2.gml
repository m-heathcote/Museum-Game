// lower depth drawn on top

if (alt_depth_y != undefined)
{
    depth = -alt_depth_y;
}
else 
{
    // bbox_bottom = vertical pos of bottom of sprite (bigger if lower)
    depth = -bbox_bottom;
}
