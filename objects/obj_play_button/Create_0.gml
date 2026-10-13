// Inherit the parent event
event_inherited();

game_room = rm_1_Museum;

click_func = function()
{
    create_simple_transition(
        game_room,
        new TransitionFade(#292935),  // purple #292935   gray #212121
        40,
        15,
        40
    );
}