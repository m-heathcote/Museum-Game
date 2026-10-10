// Inherit the parent event
event_inherited();

if (show_step_targets)
{
    if (move_step_x != -1 && move_step_y != -1)
    {
        draw_circle_colour(move_step_x, move_step_y, 2, c_aqua, c_aqua, false);
    }
    
    if (move_target_x != -1 && move_target_y != -1)
    {
        draw_circle_colour(move_target_x, move_target_y, 2, c_red, c_red, false);
    }
}