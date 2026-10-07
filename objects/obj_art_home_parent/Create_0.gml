// Inherit the parent event
event_inherited();

player = instance_find(obj_player, 0);

interactable = true;

art_object = noone;
art_at_home = true;

function return_art_object()
{
    if (player.held_obj == art_object)
    {
        art_object.put_back_home();
        art_at_home = true;
        interact_func = grab_art_object;
    }
    else if (player.held_obj != noone)
    {
        show_debug_message("INCORRECT art object");
        audio_play_sound(snd_incorrect, 0, false);
    }
    else
    {
        show_debug_message("can't RETURN art object");
    }
}

function grab_art_object()
{
    if (player.held_obj == noone)
    {
        art_object.grab_from_home();
        art_at_home = false;
        interact_func = return_art_object;
    }
    else
    {
        show_debug_message("can't GRAB art object");
    }
}

interact_func = grab_art_object;