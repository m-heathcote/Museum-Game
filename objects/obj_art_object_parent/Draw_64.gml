if (player_in_range && !player.has_picked_up_art)
{
    // show key popup if first time interacting with art
    
    var _tx = room_to_gui_x_coord(x);
    var _ty = room_to_gui_y_coord(y + 5);
    
    draw_sprite_ext(spr_ctrl_interact, 0, _tx, _ty, 1, 1, 0, c_white, 0.9);
}