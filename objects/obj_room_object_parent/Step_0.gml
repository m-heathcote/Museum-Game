player_in_range = instance_exists(obj_player) && distance_to_object(obj_player) < interact_distance;

if (interactable && player_in_range)
{
    showing_outline = true;
    
    if (keyboard_check_pressed(interact_key))
    {
        interact_func();
    }
}
else if (bonus_outline_condition)
{
    showing_outline = true;
}
else
{
    showing_outline = false;
}