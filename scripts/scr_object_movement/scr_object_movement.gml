function maybe_move_art_object()
{
    var _rand = random(100);
    if (_rand < move_frequency)
    {
        if (move_target_x == -1 || move_target_y == -1)
        {
            pick_move_target();
        }
        
        var _found_step = pick_step_coords();
        
        while ((x == move_target_x && y == move_target_y) || !_found_step)
        {
            pick_move_target();
            _found_step = pick_step_coords();
        }
        
        try_to_move_a_step();
        update_vars();
    }
}

function object_move_a_step()
{
    // Play sound
    audio_play_sound(snd_art_move, 0, false);
    
    // Start move
    anim_active = true;
    anim_type = "move";
    anim_progress = 0;
    
    anim_start_x = x;
    anim_start_y = y;
    anim_start_depth = depth;
    
    //alt_shadow_y = y; ************************* TODO: use or get rid of this
    
    anim_target_x = move_step_x;
    anim_target_y = move_step_y;
    
    // Make the object arc
    var _arc_size = 15;
    anim_control_x = (anim_start_x + anim_target_x) / 2;
    anim_control_y = min(anim_start_y, anim_target_y) - _arc_size;
}

function end_move()
{
    anim_active = false;
    var _cooldown = irandom_range(move_cooldown_min, move_cooldown_max);
    alarm[0] = _cooldown;
    move_cooldown_active = true;
    
    x = anim_target_x;
    y = anim_target_y;
    
    if (player.is_overlapping_object(id))
    {
        ignore_player_collision = true;
    }
}