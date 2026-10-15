if (has_shadow && shadow_spr != noone)
{
    if (alt_shadow_y != -1)
    {
        draw_shadow_coords(shadow_spr, x, alt_shadow_y, shadow_x_offset, shadow_y_offset, shadow_x_scale, shadow_y_scale)
    }
    else
    {
        draw_shadow(shadow_spr, shadow_x_offset, shadow_y_offset, shadow_x_scale, shadow_y_scale);
    }
}

if (showing_outline && outline_enabled)
{
    draw_sprite_outline(sprite_index, 1, 0.5, image_xscale, image_yscale, image_angle);
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