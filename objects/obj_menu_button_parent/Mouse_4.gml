if (!clicked || !only_click_once)
{
    audio_play_sound(snd_click, 0, 0);
}
clicked = true;

click_func();