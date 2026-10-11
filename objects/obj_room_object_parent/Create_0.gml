show_collision_mask = true; // ** debug **

interactable = false;

interact_key = ord("E");
interact_distance = 15;
player_in_range = false;    // if close enough to player to interact with

outline_enabled = true;     // if an outline should be shown when in range
showing_outline = false;    // if currently displaying a white outline
bonus_outline_condition = false;

blocks_player = true;
ignore_player_collision = false;

alt_shadow_y = -1;
alt_depth_y = undefined;

function test_interact()
{
    show_debug_message("interact!");
    
    audio_play_sound(snd_pick_up, 0, false);
}

interact_func = test_interact;