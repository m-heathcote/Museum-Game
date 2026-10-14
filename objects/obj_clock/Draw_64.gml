var _gui_w = GUI_W;
var _gui_h = GUI_H;

// Set draw settings
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(1);
draw_set_color(c_white);

// Get string
var _mins_string = and_30 ? "30" : "00";
var _time_string = string(times[hour]) + ":" + _mins_string + am_pm;

// Calculate text/box dimensions
var _text_w = string_width(_time_string);
var _text_h = string_height(_time_string);
var _box_w = _text_w + x_text_padding * 2;
var _box_h = _text_h + y_text_padding * 2;

// Get coords
var _text_x = _gui_w - x_screen_padding - (_box_w / 2);
var _text_y = _gui_h - y_screen_padding - (_box_h / 2);
var _box_x = _text_x - (_box_w / 2);
var _box_y = _text_y - (_box_h / 2);

// Draw box
draw_sprite_stretched_ext(
    box_spr,
    0,
    _box_x,
    _box_y,
    _box_w,
    _box_h,
    c_white,
    0.7
);

// Draw time
draw_text(_text_x, _text_y, _time_string);

// Reset draw settings
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);