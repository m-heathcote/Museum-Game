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
    }
    else {
        show_debug_message("can't return art object");
    }
}

interact_func = return_art_object;