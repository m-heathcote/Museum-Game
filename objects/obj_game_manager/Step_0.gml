if (controls_fading)
{
    if (control_alpha < fade_rate)
    {
        controls_fading = false;
        show_move_controls = false;
    }
    else
    {
    	control_alpha -= fade_rate;
    }
}