// *** Alarm 0 ***
// runs every in-game 30m

if (clock_active)
{
    and_30 = !and_30;
    var _num_times = array_length(times);
    
    if (and_30 && hour == 0)
    {
        // Out of first 30m where nothing happens
        // change num allowed out
        move_manager.max_living_art = num_allowed_out[hour];
        show_debug_message("now " + string(move_manager.max_living_art) + " allowed out");
    }

    // If clock has gone from :30 -> :00
    if (!and_30)
    {
        if (hour < _num_times - 1)
        {
            // move to next hour
            hour++;
            
            if (hour == am_index)
            {
                am_pm = "am";
            }
            
            // change num allowed out
            move_manager.max_living_art = num_allowed_out[hour];
            show_debug_message("now " + string(move_manager.max_living_art) + " allowed out");
        }
    }
    
    // --- RESET COUNTDOWN or END GAME ---
    
    if (hour < _num_times - 1)
    {
        // reset alarm
        alarm[0] = frames_for_30m;
    }
    else 
    {
        // END GAME
        clock_active = false;
        audio_play_sound(snd_time_up, 0, false);
        audio_sound_gain(global.music, 0, secs_before_end_screen * 1000);
        alarm[1] = secs_before_end_screen * 60;
    }
}