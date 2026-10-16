// Inherit the parent event
event_inherited();

game_room = rm_1_Museum;

click_func = function()
{
    create_simple_transition(
        game_room,
        new TransitionFade(#2A2B3B),  // purple #292935   new purple #2A2B3B   gray #212121
        35,
        15,
        35
    );
}