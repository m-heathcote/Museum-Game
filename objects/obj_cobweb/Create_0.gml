// Inherit the parent event
event_inherited();

interactable = true;
blocks_player = true;

fading = false;
fade_rate = 0.04;
destroy_delay = 2;

function clean_cobweb()
{
    if (!fading)
    {
        audio_play_sound(snd_pick_up, 0, false);
        
        global.cobwebs_cleaned += 1;
        
        fading = true;
        outline_enabled = false;
    }
}

interact_func = clean_cobweb;