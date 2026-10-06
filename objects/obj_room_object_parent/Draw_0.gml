if (has_shadow)
{
    draw_shadow(shadow_x_offset, shadow_y_offset, shadow_x_scale, shadow_y_scale);
}

if (showing_outline && outline_enabled)
{
    draw_sprite_outline(sprite_index, 1.1, 0.4, image_xscale, image_yscale, image_angle);
}

draw_self();