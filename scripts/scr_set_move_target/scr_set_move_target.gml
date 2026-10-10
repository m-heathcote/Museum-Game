function pick_move_target()
{
    if (x < 320)
    {
        move_x_multiplier = 1;
    }
    else if (x > 1050)
    {
        move_x_multiplier = -1;
    }
    else
    {
        move_x_multiplier = choose(1, -1);
    }
    
    if (y < 320)
    {
        move_y_multiplier = 1;
    }
    else  
    {
        move_y_multiplier = choose(1, -1);
    }
    
    step_count_x = floor(random_range(1, target_range));
    step_count_y = floor(random_range(1, target_range));
    
    move_target_x = x + (step_count_x * step_size * move_x_multiplier);
    move_target_y = y + (step_count_y * step_size * move_y_multiplier);
}