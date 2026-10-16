if (instance_exists(obj_dialog)) exit;

if (show_clock)
{
    var _gui_w = GUI_W;
    var _gui_h = GUI_H;
    
    // Set draw settings
    draw_set_font(font);
    draw_set_alpha(1);
    draw_set_color(c_white);
    
    // Get string
    var _hour_string = times[hour];
    var _colon_string = ":";
    var _mins_string = and_30 ? "30" : "00";
    //var _time_string = times[hour] + ":" + _mins_string + am_pm;
    var _size_string = "00:00am";
    
    // Calculate text/box dimensions
    var _text_w = string_width(_size_string);
    var _text_h = string_height(_size_string);
    var _box_w = _text_w + x_text_padding * 2;
    var _box_h = _text_h + y_text_padding * 2;
    
    // Get coords
    var _box_x = _gui_w - x_screen_padding - _box_w;
    var _box_y = _gui_h - y_screen_padding - _box_h;
    //var _text_x = _box_x + x_text_padding;
    var _hour_text_x = _box_x + x_text_padding + string_width("00");
    var _colon_text_x = _hour_text_x;
    var _mins_text_x = _hour_text_x + string_width(":");
    var _text_y = _box_y + (_box_h / 2);
    
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
    
    if (hour >= 7)
    {
        draw_set_color(#C95050);
    }
    
    // Draw time
    draw_set_halign(fa_right);
    draw_set_valign(fa_middle);
    draw_text(_hour_text_x, _text_y, _hour_string);
    draw_set_halign(fa_left);
    draw_text(_colon_text_x, _text_y, _colon_string);
    draw_text(_mins_text_x, _text_y, _mins_string + am_pm);
    
    /*
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_text(_text_x, _text_y, _time_string);
     * */
    
    // Reset draw settings
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}