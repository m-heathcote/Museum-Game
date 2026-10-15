// Inherit the parent event
event_inherited();

if (!show_list) exit;
    
// ----- CLOSE -----
if (!just_opened && (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_escape)))
{
    show_list = false;
    player.frozen = false;
    
    // re-enable interactions after a delay
    alarm[0] = 5;
}