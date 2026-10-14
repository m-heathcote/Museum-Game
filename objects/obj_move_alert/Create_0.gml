spr = spr_alert_big;

spr_alpha = 1;
fading = false;
fade_speed = 0.05;

frames_on_screen = 60 * 1;
alarm[0] = frames_on_screen;

function room_to_gui_x_coord(_x)
{
    return (_x - VIEW_X) * (GUI_W / VIEW_W);
}

function room_to_gui_y_coord(_y)
{
    return (_y - VIEW_Y) * (GUI_H / VIEW_H);
}

function start_fade()
{
    fading = true;
}

function end_fade()
{
    instance_destroy();
}