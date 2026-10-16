// if dialog has not started
if (current_message >= array_length(messages)) exit;

draw_sprite_stretched_ext(
    box_sprite,
    0,
    box_x,
    box_y,
    box_w,
    box_h,
    c_white,
    0.9
);

draw_set_font(font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// ----- NAME -----
var _message = messages[current_message];
var _name = _message.name;

var _color = c_gray;
if (variable_struct_exists(_message, "color"))
{
    _color = _message.color;
}

draw_set_color(_color);
draw_text(text_x, text_y, string_upper(_name));
draw_set_color(c_white);
draw_set_alpha(1);

var _text_y_lower = text_y + font_size + (text_y_padding);

// ----- MESSAGE -----
draw_text_ext(text_x, _text_y_lower, draw_message, line_sep, text_max_w);

// ----- PROMPT ANSWERS -----
var _has_choices = variable_struct_exists(_message, "choices");

if (_has_choices && show_choices)
{
    var _op_w = (box_w / 2) - (text_x_padding * 1.5);
    var _op_h = font_size + text_y_padding;
    var _op1_x = text_x;
    var _op2_x = _op1_x + _op_w + text_x_padding;
    var _op_y = box_y + box_h - text_y_padding - _op_h;
    
    var _op1_text_x = _op1_x + (_op_w / 2);  // centered
    var _op2_text_x = _op2_x + (_op_w / 2);  // centered
    var _op_text_y = _op_y + (_op_h / 2);
    var _op_text_max_w = _op_w - text_x_padding;
    
    var _mouse_x = device_mouse_x_to_gui(0);
    var _mouse_y = device_mouse_y_to_gui(0);
    
    var _op1_subimg = 0;
    var _op2_subimg = 0;
    
    if (point_in_rect(_mouse_x, _mouse_y, _op1_x, _op_y, _op_w, _op_h))
    {
        // option 1 hovered
        _op1_subimg = 1;
    }
    else if (point_in_rect(_mouse_x, _mouse_y, _op2_x, _op_y, _op_w, _op_h))
    {
        // option 2 hovered
        _op2_subimg = 1;
    }
    
    var _op1_text = _message.choices[0].text;
    var _op2_text = _message.choices[1].text;

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // -- OPTION 1 --
    draw_sprite_stretched_ext(
        box_sprite,
        _op1_subimg,
        _op1_x,
        _op_y,
        _op_w,
        _op_h,
        c_white,
        0.9
    );
    
    draw_text_ext(_op1_text_x, _op_text_y, _op1_text, -1, _op_text_max_w);
    
    // -- OPTION 2 --
    draw_sprite_stretched_ext(
        box_sprite,
        _op2_subimg,
        _op2_x,
        _op_y,
        _op_w,
        _op_h,
        c_white,
        0.9
    );
    
    draw_text_ext(_op2_text_x, _op_text_y, _op2_text, -1, _op_text_max_w);
    
    // Reset
    draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

var _player = instance_find(obj_player, 0);
//if (!_player.has_seen_a_dialog && waiting_to_advance)
if (waiting_to_advance)
{
    var _tx = box_x + box_w - 15;
    var _ty = box_y + box_h - 40;
    
    draw_sprite_ext(spr_ctrl_interact, 0, _tx, _ty, 1, 1, 0, c_white, 0.9);
}