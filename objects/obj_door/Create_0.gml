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

lock_snd = snd_door_lock;
snd_offset = 0.17;

function update_stat()
{
    if (lock_1 && lock_2 && lock_3)
    {
        global.door_locked = true;
    }
}

function lock_door()
{
    in_use = true;
    interactable = false;
    
    just_opened = true;
    alarm[1] = 5;
    
    player.frozen = true;
}

interact_func = lock_door;