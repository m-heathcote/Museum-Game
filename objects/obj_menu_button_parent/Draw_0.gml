var _ind = hovered ? 1 : 0;
var _scale = hovered ? base_scale * 1.1 : base_scale;

draw_sprite_ext(
    sprite_index,
    _ind,
    x,
    y,
    _scale,
    _scale,
    image_angle,
    image_blend,
    image_alpha
);