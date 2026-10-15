// Inherit the parent event
event_inherited();

//player = instance_find(obj_player, 0);
moving_obj_manager = instance_find(obj_moving_objects_manager, 0);

interactable = true;

art_object = noone;
art_at_home = true;

function return_art_object()
{
    if (player.held_obj == art_object)
    {
        art_object.put_back_home();
        art_at_home = true;
        moving_obj_manager.switch_to_dormant(art_object);
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
        moving_obj_manager.switch_to_living(art_object);
    }
    else
    {
        show_debug_message("can't GRAB art object");
    }
}

function grab_or_return()
{
    if (art_at_home) { grab_art_object(); }
    else { return_art_object(); }
}

interact_func = grab_or_return;