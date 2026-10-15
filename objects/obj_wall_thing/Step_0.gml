// Inherit the parent event
event_inherited();

if (!in_use) exit;
    
if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up))
{
    audio_play_sound(snd_click, 0, false);
    
    if (current_setting < num_settings - 1)
    {
        if (current_setting == correct_setting)
        {
            global.temps_set--; // about to change from correct
        }
        
        current_setting++;
        image_index = current_setting;
        
        if (current_setting == correct_setting)
        {
            global.temps_set++;
        }
    }
}

if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(vk_down))
{
    audio_play_sound(snd_click, 0, false);
    
    if (current_setting > 0)
    {
        if (current_setting == correct_setting)
        {
            global.temps_set--; // about to change from correct
        }
        
        current_setting--;
        image_index = current_setting;
        
        if (current_setting == correct_setting)
        {
            global.temps_set++;
        }
    }
}