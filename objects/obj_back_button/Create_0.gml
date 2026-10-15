// Inherit the parent event
event_inherited();

base_scale = 0.6;

click_func = function()
{
    create_simple_transition(
        rm_Title,
        new TransitionFade(#292935),  // purple #292935   gray #212121
        20,
        15,
        20
    );
}