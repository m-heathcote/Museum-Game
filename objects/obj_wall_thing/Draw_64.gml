if (!in_use) exit;
    
var _tx = room_to_gui_x_coord(x);
var _ty = room_to_gui_y_coord(y + display_y_offset);

draw_sprite_ext(spr_ctrl_temp, 0, _tx, _ty, 1, 1, 0, c_white, 0.8);
draw_sprite(spr_temp_arrows, 0, _tx, _ty);

if (keyboard_check(ord("W")) || keyboard_check(vk_up))
{
    draw_sprite(spr_temp_arrow_up, 0, _tx, _ty);
}

if (keyboard_check(ord("S")) || keyboard_check(vk_down))
{
    draw_sprite(spr_temp_arrow_down, 0, _tx, _ty);
}