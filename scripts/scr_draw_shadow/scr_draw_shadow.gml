function draw_shadow(_x_offset=0, _y_offset=0, _xscale=1, _yscale=1, _version=0, _alpha=0.3)
{
    var _spr = _version == 0 ? spr_shadow_player : spr_shadow_pedestal;
    
    draw_sprite_ext(_spr, 0, x + _x_offset, y + _y_offset, _xscale, _yscale, 0, -1, _alpha);
}