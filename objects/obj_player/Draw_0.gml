draw_shadow(spr_shadow_player, 0, 9, 0.9);

draw_self();

if (show_placement_location)
{
    var _max_distance = 32;
    draw_circle_colour(place_obj_x, place_obj_y, 2, c_green, c_green, false);
    draw_circle_colour(x + _max_distance, place_obj_y, 1, c_green, c_green, false);
    draw_circle_colour(x - _max_distance, place_obj_y, 1, c_green, c_green, false);
    draw_circle_colour(x, place_obj_y + _max_distance, 1, c_green, c_green, false);
    draw_circle_colour(x, place_obj_y - _max_distance, 1, c_green, c_green, false);
    
    draw_rectangle_colour(
        bbox_left, bbox_top,
        bbox_right, bbox_bottom,
        c_red, c_blue, c_green, c_aqua,
        true
    );
}

if (show_art_freeze_range)
{
    var _range = obj_art_object_parent.move_dist_from_player;
    draw_circle_colour(x, y, _range, c_aqua, c_aqua, true);
}