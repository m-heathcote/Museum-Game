if (!in_use) exit;
    
var _tx = room_to_gui_x_coord(x);
var _ty = room_to_gui_y_coord(y + display_y_offset);

draw_sprite_ext(spr_ctrl_door, 0, _tx, _ty, 1, 1, 0, c_white, 0.8);
draw_sprite(spr_door_check, 0, _tx, _ty);

draw_sprite(spr_door_lock_1, lock_1, _tx, _ty);
draw_sprite(spr_door_lock_2, lock_2, _tx, _ty);
draw_sprite(spr_door_lock_3, lock_3, _tx, _ty);