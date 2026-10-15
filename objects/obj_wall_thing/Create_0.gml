// Inherit the parent event
event_inherited();

interactable = true;
blocks_player = false;

in_use = false;
display_y_offset = -3;

current_setting = start_setting;
image_index = current_setting;
correct_setting = 4;
num_settings = image_number;

function use_wall_thing()
{
    // Play sound
    audio_play_sound(snd_click, 0, false); // TODO: replace sound *************
    
    in_use = true;
    interactable = false;
    
    player.frozen = true;
}

interact_func = use_wall_thing;