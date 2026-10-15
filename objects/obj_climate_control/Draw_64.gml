if (!show_display) exit;
    
// GUI dimensions
var _gui_w = GUI_W;
var _gui_h = GUI_H;

// Center coords
var _cx = _gui_w/2;
var _cy = _gui_h/2;

// Display top left corner coords
var _box_x = _cx - display_w / 2;
var _box_y = _cy - display_h / 2;

// Draw box
//draw_rectangle(_box_x, _box_y, _box_x + display_w, _box_y + display_h, false);
draw_sprite_stretched(
    spr,
    0,
    _box_x,
    _box_y,
    display_w,
    display_h
);

