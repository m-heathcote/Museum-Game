draw_shadow(0, 9, 0.9);

draw_self();

if (show_placement_location)
{
    draw_circle_colour(place_obj_x, place_obj_y, 2, c_red, c_red, false);
    
    draw_rectangle_colour(
        bbox_left, bbox_top,
        bbox_right, bbox_bottom,
        c_red, c_blue, c_green, c_aqua,
        true
    );
}