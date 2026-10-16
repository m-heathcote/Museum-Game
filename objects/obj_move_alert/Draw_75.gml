// Get camera view box coords
var _view_left_x = room_to_gui_x_coord(VIEW_X);
var _view_right_x = room_to_gui_x_coord(VIEW_X + VIEW_W);
var _view_upper_y = room_to_gui_y_coord(VIEW_Y);
var _view_lower_y = room_to_gui_y_coord(VIEW_Y + VIEW_H);

var _gui_origin_x = room_to_gui_x_coord(origin_x);
var _gui_origin_y = room_to_gui_y_coord(origin_y);

// Hide alert if origin in view
if (!fading
&&  _gui_origin_x > _view_left_x
&&  _gui_origin_x < _view_right_x
&&  _gui_origin_y > _view_upper_y
&&  _gui_origin_y < _view_lower_y)
{
    start_fade();
}

var _spr_w = sprite_get_width(spr);
var _spr_h = sprite_get_height(spr);

var _padding = 12;

// Keep the entire sprite inside the view edges
var _min_x = _view_left_x + _spr_w / 2 + _padding;
var _max_x = _view_right_x - _spr_w / 2 - _padding;
var _min_y = _view_upper_y + _spr_h / 2 + _padding;
var _max_y = _view_lower_y - _spr_h / 2 - _padding;

var _x = clamp(_gui_origin_x, _min_x, _max_x);
var _y = clamp(_gui_origin_y, _min_y, _max_y);

draw_sprite_ext(spr, spr_ind, _x, _y, 1.2, 1.2, 0, c_white, spr_alpha);