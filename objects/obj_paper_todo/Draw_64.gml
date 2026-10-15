if (player_in_range && !player_has_interacted && !show_list)
{
    // show key popup if first time interacting
    
    var _tx = room_to_gui_x_coord(x);
    var _ty = room_to_gui_y_coord(y + 3);
    
    draw_sprite_ext(spr_ctrl_interact, 0, _tx, _ty, 1, 1, 0, c_white, 0.9);
}

if (!show_list) exit;
    
// Center coords
var _cx = GUI_W / 2;
var _cy = GUI_H / 2;

// Box top left
var _box_x = _cx - (box_w / 2);
var _box_y = _cy - (box_h / 2);

// Draw box
draw_sprite_stretched(spr_box, 0, _box_x, _box_y, box_w, box_h);

// Title coords (center, top)
var _title_x = _cx;
var _title_y = _box_y + y_margin + y_padding;

// Set title draw settings
draw_set_font(title_font);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw title
var _title_text = "To - Do";
var _title_h = string_height(_title_text)
draw_text(_title_x, _title_y, _title_text);

// Item coords (left, top)
var _text_y_offset = checkbox_h * 0.1;
var _checkbox_x = _box_x + x_margin + x_padding;
var _item_text_x = _checkbox_x + checkbox_w + x_padding;
var _item_y = _title_y + _title_h + y_padding*0.6;
var _max_text_w = box_w - x_margin*2 - x_padding*3 - checkbox_w;
var _line_sep = y_padding * 1.3;

// Item array
var _items = [
    "lock the front doors",
    "use the wall panels to set the climate control in each room [" + string(global.temps_set) + "/3]",
    "clean cobwebs [" + string(global.cobwebs_cleaned) + "/6]",
    "make sure EVERYTHING IS WHERE IT BELONGS BY THE END OF YOUR SHIFT AT 6AM !!!\n["
        + string(global.num_art_out_of_place) + " items out of place]"
];
var _checked = [
    global.door_locked,
    global.temps_set == 3,
    global.cobwebs_cleaned == 6,
    0
];

// Set item draw settings
draw_set_font(text_font);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Draw checkboxes and text
for (var _i = 0; _i < array_length(_items); _i++)
{
    draw_sprite(spr_checkbox, _checked[_i], _checkbox_x, _item_y);
    
    draw_text_ext(_item_text_x, _item_y + _text_y_offset, _items[_i], _line_sep, _max_text_w);
    
    // Advance by the actual height of this wrapped text
    _item_y += string_height_ext(
        _items[_i],
        _line_sep,
        _max_text_w
    ) + y_padding;
}

// Reset draw settings
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);