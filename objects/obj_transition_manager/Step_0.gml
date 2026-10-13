timer++;

switch(state)
{
    // ----- FADE OUT -----
    case TransitionState.out:
        if (transition.update_out) transition.update_out(timer / out_length);
        if (timer >= out_length)
        {
            timer = 0;
            state = TransitionState.wait;
        }
        break;
    
    // ----- WAIT -----
    case TransitionState.wait:
        if (timer >= wait_length)
        {
            timer = 0;
            state = TransitionState.in;
            room_goto(target_room);
        }
        break;
    
    // ----- FADE IN -----
    case TransitionState.in:
        if (transition.update_in) transition.update_in(timer / out_length);
        if (timer >= in_length)
        {
            instance_destroy(); // DONE
        }
        break;
}