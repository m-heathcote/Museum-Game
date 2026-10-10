function pick_move_target()
{
    move_x_multiplier = get_x_multiplier();
    move_y_multiplier = get_y_multiplier();
    //move_x_multiplier = choose(1, -1);
    //move_y_multiplier = choose(1, -1);
    
    step_count_x = floor(random_range(1, target_range));
    step_count_y = floor(random_range(1, target_range));
    
    move_target_x = x + (step_count_x * step_size * move_x_multiplier);
    move_target_y = y + (step_count_y * step_size * move_y_multiplier);
}

// gives x multiplier for movement after considering wanting to leave the home room
function get_x_multiplier()
{
    if (home_room == get_current_room())
    {
        // Still in home room
        switch (home_room)
        {
            case "top":
                if (x < 592) { return 1; }
                else if (x > 784) { return -1; }
                break;
            
            case "left":
                return 1;
            
            case "right":
                return -1;
        }
    }
    
    // otherwise, random
    return choose(1, -1);
}

// gives y multiplier for movement after considering wanting to leave the home room
function get_y_multiplier()
{
    if (home_room == get_current_room())
    {
        // Still in home room
        switch (home_room)
        {
            case "top":
                return 1;
            
            case "left":
                if (y < 528) { return 1; }
                else if (y > 640) { return -1; }
                break;
            
            case "right":
                if (y < 528) { return 1; }
                else if (y > 640) { return -1; }
                break;
        }
    }
    
    // otherwise, random
    return choose(1, -1);
}

function get_current_room()
{
    if (y < 432)
    {
        return "top";
    }
    else if (y > 752)
    {
        return "bottom";
    }
    else if (x < 480) // already not in top room
    {
        return "left";
    }
    else if (x > 896) // already not in top room
    {
        return "right";
    }
    else
    {
        return "center";
    }
}

