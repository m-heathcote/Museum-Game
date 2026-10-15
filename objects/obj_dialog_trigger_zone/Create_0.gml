player = instance_find(obj_player, 0);
player_inside = false;

function disable_dialog_zone()
{
    enabled = false;
    player_inside = false;
}

function enable_dialog_zone()
{
    enabled = true;
    player_inside = false;
}