// Inherit the parent event
event_inherited();

game_room = rm_1_Museum;

click_func = function()
{
    create_simple_transition(
        game_room,
        new TransitionFade(),
        60,
        15,
        5
    );
}