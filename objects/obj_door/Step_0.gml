// Inherit the parent event
event_inherited();

if (!in_use) exit;
    
if (keyboard_check_pressed(ord("1")))
{
    audio_play_sound(lock_snd, 0, false);
    
    lock_1 = !lock_1;
    update_stat();
}

if (keyboard_check_pressed(ord("2")))
{
    audio_play_sound(lock_snd, 0, false);
    
    lock_2 = !lock_2;
    update_stat();
}

if (keyboard_check_pressed(ord("3")))
{
    audio_play_sound(lock_snd, 0, false);
    
    lock_3 = !lock_3;
    update_stat();
}

// ----- CLOSE -----
if (!just_opened && (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_escape)))
{
    in_use = false;
    player.frozen = false;
    
    // re-enable interactions after a delay
    alarm[0] = 5;
}