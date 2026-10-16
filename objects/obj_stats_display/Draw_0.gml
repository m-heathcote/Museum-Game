var _put_in_place = global.player_put_in_place;
var _took_out_place = global.player_took_out_of_place;
var _num_out = global.num_art_out_of_place;

//draw_self();

// Set draw settings
draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Position at the center of the sprite
var _cx = x;
var _cy = y;

// Text lines
var _door_locked_text = global.door_locked? "yes" : "no";
var _text_lines = [
    //"*Put in place: " + string(_put_in_place),
    //"*Taken out: " + string(_took_out_place),
    "Items returned home: " + string(_put_in_place - _took_out_place),
    "Items left out of place: " + string(_num_out),
    "Locked the front door: " + _door_locked_text,
    "Climate controllers set: " + string(global.temps_set) + "/3",
    "Cobwebs cleaned: " + string(global.cobwebs_cleaned) + "/6",
];
var _num_lines = array_length(_text_lines);

// Calculate panel size
var _padding = 20;
var _line_height = string_height("Ag") + 4;

var _max_text_width = string_width(_text_lines[0]);
for (var _i = 1; _i < _num_lines; _i++)
{
    _max_text_width = max(_max_text_width, string_width(_text_lines[_i]));
}

var _panel_w = _max_text_width + _padding * 2;
var _panel_h = _line_height * _num_lines + _padding * 2;

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

var _multiplier = 0.5;
for (var _i = 0; _i < _num_lines; _i++)
{
    draw_text(_cx, _top + _padding + _line_height * _multiplier, _text_lines[_i]);
    _multiplier += 1;
}

// Reset draw settings
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);