// Inherit the parent event
event_inherited();

if (!in_use) exit;
    
// ----- UP -----
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

// ----- DOWN -----
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

// ----- CLOSE -----
if (!just_opened && (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_escape)))
{
    in_use = false;
    player.frozen = false;
    
    // re-enable interactions after a delay
    alarm[0] = 5;
}