// --------------------------------------------------------------------------------
//                                      PICKUP
// --------------------------------------------------------------------------------

function pick_up_object()
{
    if (player.held_obj == noone)
    {
        // Player pickup animation
        player.play_anim("pickup");
        
        // Assign to player
        player.held_obj = id;
        held = true;
        
        // Play sound
        audio_play_sound(snd_pick_up, 0, false);
        
        // Start Pickup
        anim_active = true;
        anim_type = "pickup";
        anim_progress = 0;
        
        player.obj_anim_active = true;
    
        anim_start_x = x;
        anim_start_y = y;
    
        anim_target_x = player.x + player.held_obj_x_offset;
        anim_target_y = player.y + player.held_obj_y_offset;
    
        // Make the object arc
        var _arc_size = 22;
        anim_control_x = (anim_start_x + anim_target_x) / 2;
        anim_control_y = min(anim_start_y, anim_target_y) - _arc_size;
        
        return true;
    }
    return false;
}

function set_as_held()
{
    anim_active = false;
    player.obj_anim_active = false;
    
    x = player.x + player.held_obj_x_offset;
    y = player.y + player.held_obj_y_offset;
}

// ---------------------------------------------------------------------------------
//                                      SETDOWN
// ---------------------------------------------------------------------------------

function set_down_object()
{
    if (player.held_obj == id)
    {
        // Player setdown animation
        player.play_anim("setdown");
        
        // Play sound
        audio_play_sound(snd_set_down, 0, false);
        
        // Start setdown
        anim_active = true;
        anim_type = "setdown";
        anim_progress = 0;
        
        player.obj_anim_active = true;
        
        anim_start_x = x;
        anim_start_y = y;
        
        anim_target_x = player.place_obj_x;
        anim_target_y = player.place_obj_y;
        
        // Make the object arc
        var _arc_size = 15;
        anim_control_x = (anim_start_x + anim_target_x) / 2;
        anim_control_y = min(anim_start_y, anim_target_y) - _arc_size;
    }
}

function set_not_held()
{
    anim_active = false;
    held = false;
    
    x = anim_target_x;
    y = anim_target_y;
    
    if (player.is_overlapping_object(id))
    {
        ignore_player_collision = true;
    }
    
    player.obj_anim_active = false;
    player.held_obj = noone;
}