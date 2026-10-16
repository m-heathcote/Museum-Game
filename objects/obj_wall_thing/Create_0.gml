// Inherit the parent event
event_inherited();

interactable = true;
blocks_player = false;

in_use = false;
just_opened = false;
display_y_offset = -3;

current_setting = start_setting;
image_index = current_setting;
correct_setting = 4;
num_settings = image_number;

sounds = [
    0.50,  // G4
    0.56,  // approximately Ab4
    0.63,  // approximately Bb4
    0.75,  // D5
    1.00,  // G5 - original
    1.12,  // approximately Ab5
    1.26,  // approximately Bb5
    1.50,  // D6
    2.00   // G6
];

function use_wall_thing()
{
    in_use = true;
    interactable = false;
    
    just_opened = true;
    alarm[1] = 5;
    
    player.frozen = true;
}

interact_func = use_wall_thing;