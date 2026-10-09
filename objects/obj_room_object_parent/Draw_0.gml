if (has_shadow)
{
    draw_shadow(shadow_x_offset, shadow_y_offset, shadow_x_scale, shadow_y_scale, shadow_num);
}

if (showing_outline && outline_enabled)
{
    draw_sprite_outline(sprite_index, 1, 0.35, image_xscale, image_yscale, image_angle);
}

draw_self();

if (show_collision_mask)
{
    draw_rectangle_colour(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_blue, c_green, c_aqua, true);
    draw_point_colour(bbox_left, bbox_top, c_red);
    draw_point_colour(bbox_left, bbox_bottom, c_red);
    draw_point_colour(bbox_right, bbox_top, c_red);
    draw_point_colour(bbox_right, bbox_bottom, c_red);
}