// --------------------------------------------------------------------------------
//                                     PUT HOME
// --------------------------------------------------------------------------------

function put_object_back_home()
{
    if (player.held_obj == id)
    {
        // Player setdown animation
        player.play_anim("setdown");
        
        // Play sound
        audio_play_sound(snd_in_place, 0, false);
        
        // Start setdown
        anim_active = true;
        anim_type = "put_home";
        anim_progress = 0;
        
        player.obj_anim_active = true;
        
        anim_start_x = x;
        anim_start_y = y;
        
        anim_target_x = art_home.x;
        anim_target_y = art_home.y;
        
        // Make the object arc
        var _arc_size = 15;
        anim_control_x = (anim_start_x + anim_target_x) / 2;
        anim_control_y = min(anim_start_y, anim_target_y) - _arc_size;
    }
}

function set_at_home()
{
    anim_active = false;
    held = false;
    at_home = true;
    
    x = anim_target_x;
    y = anim_target_y;
    
    player.obj_anim_active = false;
    player.held_obj = noone;
}

