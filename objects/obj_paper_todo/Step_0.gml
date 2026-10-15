// Inherit the parent event
event_inherited();

if (!show_list) exit;
    
// ----- CLOSE -----
if (!just_opened &&
        (keyboard_check_pressed(ord("E"))
        || keyboard_check_pressed(vk_escape)
        || keyboard_check_pressed(vk_enter)))
{
    if (in_first_viewing)
    {
        show_list = false;
        
        // trigger next dialog after a delay
        alarm[2] = 8;
        //create_dialog(global.DIALOGS.note_p2, true, id);
    }
    else
    {
        show_list = false;
        player.frozen = false;
        
        // re-enable interactions after a delay
        alarm[0] = 5;
    }
}