// if dialog has not started or is over
if (current_message < 0) exit;

var _message = messages[current_message];
var _name = _message.name;
var _str = _message.msg;
var _has_choices = variable_struct_exists(_message, "choices");
var _has_during_msg_action = variable_struct_exists(_message, "during_msg_action");

if (_has_during_msg_action && !message_func_ran)
{
    // run during message function
    messages[current_message].during_msg_action(dialog_source);
    
    message_func_ran = true;
}

if (text_paused)
{
    // brief pause after prompt answered
}
else if (current_char < string_length(_str))
{
    // Pause before new lines
    if (!text_paused && string_char_at(_str, current_char) == "\n")
    {
        text_paused = true;
        alarm[1] = newline_pause;
        current_char += char_speed;
        exit;
    }
    
    // ----- STILL TYPING -----
    
    if (current_char > 3 && (keyboard_check_pressed(input_key) || keyboard_check_pressed(alt_input_key)))
    {
        // skip to end
        current_char = string_length(_str);
    }
    else
    {
    	// still typing
        current_char += char_speed;
        
        if (sound_during_dialog && !pausing_between_sounds)
        {
            var _voice = 1;
            if (variable_struct_exists(_message, "voice"))
            {
                _voice = _message.voice;
            }
            
            audio_play_sound(snd_speak, 1, false, 0.25, 0.07, random_range(_voice - 0.2, _voice + 0.2));
            alarm[0] = 5;
            pausing_between_sounds = true;
        }
    }
    
    draw_message = string_copy(_str, 0, current_char);
}
else
{
    // ----- DONE TYPING -----
    
    if (_has_choices)
    {
        // Show answer buttons
        show_choices = true;
        
        var _mouse_x = device_mouse_x_to_gui(0);
        var _mouse_y = device_mouse_y_to_gui(0);
        
        var _op_w = (box_w / 2) - (text_x_padding * 1.5);
        var _op_h = font_size + text_y_padding;
        var _op1_x = text_x;
        var _op2_x = _op1_x + _op_w + text_x_padding;
        var _op_y = box_y + box_h - text_y_padding - _op_h;
        
        if (mouse_check_button_pressed(mb_left))
        {
            if (point_in_rect(_mouse_x, _mouse_y, _op1_x, _op_y, _op_w, _op_h))
            {
                // OPTION 1 selected
                
                // Click sound
                audio_play_sound(snd_click, 0, 0);
                
                // Call function
                var _response_index = _message.choices[0].choice_action(dialog_source);
                
                // Move on
                advance_or_end_dialog(_response_index);
                
                // Start pause
                alarm[1] = 20;
                text_paused = true;
                draw_message = "";
            }
    
            if (point_in_rect(_mouse_x, _mouse_y, _op2_x, _op_y, _op_w, _op_h))
            {
                // OPTION 2 selected
                
                // Click sound
                audio_play_sound(snd_click, 0, 0);
                
                // Call function
                var _response_index = _message.choices[1].choice_action(dialog_source);
                
                // Move on
                advance_or_end_dialog(_response_index);
                
                // Start pause
                alarm[1] = 20;
                text_paused = true;
                draw_message = "";
            }
        }
    }
    else if ((keyboard_check_pressed(input_key) || keyboard_check_pressed(alt_input_key)))
    {
        // Continue
        advance_or_end_dialog();
    }
}