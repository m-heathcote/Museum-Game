// Inherit the parent event
event_inherited();

if (fading)
{
    if (image_alpha < fade_rate)
    {
        // destroy obj after delay
        alarm[0] = destroy_delay;
        fading = false;
    }
    
    image_alpha -= fade_rate;
}