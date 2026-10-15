if (!enabled) exit;

var _player_inside = place_meeting(x, y + 1, player);

if (_player_inside && !player_inside)
{
    // Player just entered the zone
    player_inside = true;

    if (dialog != -1)
    {
        create_dialog(
            dialog,
            true,
            id
        );
    }
}
else if (!_player_inside)
{
    // Player has left the zone
    player_inside = false;
}