// Inherit the parent event
event_inherited();

interactable = true;
blocks_player = true;

in_use = false;
just_opened = false;
display_y_offset = -3;

lock_1 = false;
lock_2 = false;
lock_3 = false;

lock_snd = snd_click; // TODO: REPLACE **************

function update_stat()
{
    if (lock_1 && lock_2 && lock_3)
    {
        global.door_locked = true;
    }
}

function lock_door()
{
    audio_play_sound(snd_pick_up, 0, false); // TODO: REPLACE **************

    in_use = true;
    interactable = false;
    
    just_opened = true;
    alarm[1] = 5;
    
    player.frozen = true;
}

interact_func = lock_door;