function object_jump_from_home()
{
    set_start_move_target();
    
    var _loop_count = 0;
    var _max_tries = 4;
    
    var _found_step = pick_step_coords();
    
    if (_found_step)
    {
        object_move_a_step();
        update_vars();
        art_home.art_at_home = false;
    }
    else 
    {
        show_debug_message("couldn't find start step coords"); // **********
    }
}