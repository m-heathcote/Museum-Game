// *** Alarm 0 ***
// runs every in-game 30m

if (clock_active)
{
    and_30 = !and_30;

    if (!and_30)
    {
        if (hour < array_length(times) - 1)
        {
            // move to next hour
            hour++;
            
            if (hour == am_index)
            {
                am_pm = "am";
            }
        }
    }
    
    if (hour < array_length(times) - 1)
    {
        // reset alarm
        alarm[0] = frames_for_30m;
    }
    else 
    {
        // END GAME
        clock_active = false;
        audio_play_sound(snd_time_up, 0, false);
        alarm[1] = secs_before_end_screen * 60;
    }
}