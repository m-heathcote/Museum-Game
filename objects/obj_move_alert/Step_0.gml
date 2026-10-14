if (fading)
{
    if (spr_alpha < fade_speed)
    {
        end_fade();
    }
    else 
    {
        spr_alpha -= fade_speed;
    }
}