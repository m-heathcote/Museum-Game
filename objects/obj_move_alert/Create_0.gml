spr = spr_alert_big;

spr_alpha = 1;
fading = false;
fade_speed = 0.05;

frames_on_screen = 60 * 0.8;
alarm[0] = frames_on_screen;

function start_fade()
{
    fading = true;
}

function end_fade()
{
    instance_destroy();
}