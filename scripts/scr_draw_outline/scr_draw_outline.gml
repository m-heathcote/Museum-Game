function draw_sprite_outline(_sprite_ind, _thickness=1, _alpha=1, _xscale=1, _yscale=1, _rot=0, _x=x, _y=y)
{
    gpu_set_fog(1, c_white, 0, 0);
    draw_sprite_ext(_sprite_ind, -1, _x-_thickness, _y, _xscale, _yscale, _rot, c_white, _alpha);
    draw_sprite_ext(_sprite_ind, -1, _x+_thickness, _y, _xscale, _yscale, _rot, c_white, _alpha);
    draw_sprite_ext(_sprite_ind, -1, _x, _y-_thickness, _xscale, _yscale, _rot, c_white, _alpha);
    draw_sprite_ext(_sprite_ind, -1, _x, _y+_thickness, _xscale, _yscale, _rot, c_white, _alpha);
    gpu_set_fog(0, c_white, 0, 0);
}