var _put_in_place = global.player_put_in_place;
var _took_out_place = global.player_took_out_of_place;
var _num_out = global.num_art_out_of_place;

//draw_self();

// Save current draw settings
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Position at the center of the sprite
var _cx = x;
var _cy = y;

// Text lines
var _line1 = "Put in place: " + string(_put_in_place);
var _line2 = "Taken out: " + string(_took_out_place);
var _line3 = "Out of place: " + string(_num_out);

// Calculate panel size
var _padding = 20;
var _line_height = string_height("Ag") + 4;
var _text_width = max(
    string_width(_line1),
    string_width(_line2),
    string_width(_line3)
);

var _panel_w = _text_width + _padding * 2;
var _panel_h = _line_height * 3 + _padding * 2;

var _left = _cx - _panel_w / 2;
var _top = _cy - _panel_h / 2;

draw_sprite_stretched(
    spr,
    0,
    _left,
    _top,
    _panel_w,
    _panel_h
);

// Draw text
draw_set_alpha(1);
draw_set_color(c_white);

draw_text(_cx, _top + _padding + _line_height * 0.5, _line1);
draw_text(_cx, _top + _padding + _line_height * 1.5, _line2);
draw_text(_cx, _top + _padding + _line_height * 2.5, _line3);

// Reset draw settings
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);