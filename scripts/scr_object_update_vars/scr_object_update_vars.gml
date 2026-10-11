function update_vars()
{
    is_living = !at_home && !held;
    blocks_player = !at_home && !held;
    interactable = !at_home && !held;
    
    has_shadow = !at_home && !held && !anim_active;
    if (has_shadow_at_home && at_home)
    {
        has_shadow = true;
    }
}

function reset_move_coords()
{
    move_target_x = -1;
    move_target_y = -1;
    
    move_step_x = -1;
    move_step_y = -1;
    
    step_count_x = -1;
    step_count_y = -1;
    
    move_x_multiplier = 0;
    move_y_multiplier = 0;
}