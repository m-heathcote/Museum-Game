if (!show_display) exit;
    
// GUI dimensions
var _gui_w = GUI_W;
var _gui_h = GUI_H;

// Center coords
//var _cx = _gui_w/2;
//var _cy = _gui_h/2;

var _tx = room_to_gui_x_coord(wall_thing_id.x);
var _ty = room_to_gui_y_coord(wall_thing_id.y + display_y_offset);

// Display top left corner coords
//var _box_x = _tx - display_w / 2;
//var _box_y = _ty - display_h;

// Draw box
/*
draw_sprite_stretched(
    spr,
    0,
    _box_x,
    _box_y,
    display_w,
    display_h
);
 * */
draw_sprite(spr_ctrl_temp, 0, _tx, _ty);
draw_sprite(spr_temp_arrows, 0, _tx, _ty);

