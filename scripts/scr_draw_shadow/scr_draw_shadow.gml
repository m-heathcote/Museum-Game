function draw_shadow(_spr, _x_offset=0, _y_offset=0, _xscale=1, _yscale=1, _alpha=0.3)
{
    draw_sprite_ext(_spr, 0, x + _x_offset, y + _y_offset, _xscale, _yscale, 0, -1, _alpha);
}

function draw_shadow_coords(_spr, _x, _y, _x_offset=0, _y_offset=0, _xscale=1, _yscale=1, _alpha=0.3)
{
    draw_sprite_ext(_spr, 0, _x + _x_offset, _y + _y_offset, _xscale, _yscale, 0, -1, _alpha);
}