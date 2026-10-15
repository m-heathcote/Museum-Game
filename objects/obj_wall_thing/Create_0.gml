// Inherit the parent event
event_inherited();

interactable = true;
blocks_player = false;

climate_control_obj = noone;

function use_wall_thing()
{
    // Play sound
    audio_play_sound(snd_click, 0, false); // TODO: replace sound *************
    
    if (climate_control_obj == noone)
    {
        // create obj
        climate_control_obj = instance_create_depth(0, 0, 0,
            obj_climate_control,
            {
                // climate_control variable: value
                home_room: home_room,
                wall_thing_id: id
            }
        );
    }
    
    show_debug_message("opening");
    
    climate_control_obj.show_display = true;
    player.frozen = true;
    interactable = false;
}

interact_func = use_wall_thing;