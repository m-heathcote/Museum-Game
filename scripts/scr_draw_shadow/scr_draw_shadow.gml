function draw_shadow(_offset=0, _xscale=1, _yscale=1)
{
    draw_sprite_ext(spr_shadow, 0, x, y + _offset, _xscale, _yscale, 0, -1, 0.3);
}