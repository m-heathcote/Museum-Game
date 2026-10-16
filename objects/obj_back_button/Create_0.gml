// Inherit the parent event
event_inherited();

base_scale = 0.6;

click_func = function()
{
    create_simple_transition(
        rm_Title,
        new TransitionFade(#2A2B3B),  // purple #292935   new purple #2A2B3B   gray #212121
        20,
        15,
        20
    );
}