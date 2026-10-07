interactable = false;

interact_key = ord("E");
interact_distance = 15;
player_in_range = false;    // if close enough to player to interact with

outline_enabled = true;     // if an outline should be shown when in range
showing_outline = false;    // if currently displaying a white outline

ignore_player_collision = false;

show_collision_mask_corners = false;  // for debugging

function test_interact()
{
    show_debug_message("interact!");
    
    audio_play_sound(snd_pick_up, 0, false);
}

interact_func = test_interact;