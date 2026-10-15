messages = [];        // each message will be a struct
current_message = -1; // dialog has not started yet
current_char = 0;     // how many characters from string have been drawn
draw_message = "";    // actual string drawn on the screen
message_func_ran = false;  // tracks if a during message function has run

show_choices = false; // if prompt, controls if choices displayed
text_paused = false;  // control pause between answering prompt and next message
newline_pause = 30;
coma_pause = 15;

unfreeze_at_end = true;

sound_during_dialog = true;
pausing_between_sounds = false;

dialog_source = noone;

char_speed = 1;
input_key = ord("E");  // speed up text / move to next message
alt_input_key = vk_enter;

gui_w = GUI_W;
gui_h = GUI_H;

// Dimensions
box_w_multiple = 0.82;    // width of box compared to gui width
box_h_multiple = 0.28;    // height of box compared to gui height
below_margin = 20;

text_x_padding = 30;
text_y_padding = 30;
line_sep = 50;

// Font
font = fnt_dialog;
font_size = font_get_size(font);

// Sprite
box_sprite = spr_clock_box_big;

camera = instance_find(obj_camera, 0);

// CALCULATED NUMS

box_w = gui_w * box_w_multiple;
box_h = gui_h * box_h_multiple;
box_x = (gui_w / 2) - (box_w / 2);
box_y = gui_h - below_margin - box_h;

text_x = box_x + text_x_padding;
text_y = box_y + text_y_padding;

text_max_w = box_w - (text_x_padding * 2);

// FUNCTIONS

function advance_or_end_dialog(_jump_to=-2)
{
    var _has_next = variable_struct_exists(messages[current_message], "next");
    var _has_after_msg_action = variable_struct_exists(messages[current_message], "after_msg_action");
    
    if (_jump_to != -2)
    {
        current_message = _jump_to;
    }
    else if (_has_after_msg_action)
    {
        // Call after message action if it exists
        var _next_index = messages[current_message].after_msg_action(dialog_source);
        current_message = _next_index;
    }
    else if (_has_next)
    {
        current_message = messages[current_message].next;
    }
    else
    {
    	current_message++;
    }
    
    // Check if end of messages
    if (current_message >= array_length(messages) || current_message == -1)
    {
        // End of messages
        
        if (unfreeze_at_end)
        {
            // Unfreeze player
            var _player = instance_find(obj_player, 0);
            _player.frozen = false;
        }
        
        // Destroy
        instance_destroy();
    }
    else
    {
        // Reset before next message
        current_char = 0;
        show_choices = false;
        message_func_ran = false;
    }
}