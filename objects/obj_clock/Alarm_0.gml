// *** Alarm 0 ***
// runs every in-game 30m

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
    else
    {
    	// END GAME
    }
}

// reset alarm
alarm[0] = frames_for_30m;