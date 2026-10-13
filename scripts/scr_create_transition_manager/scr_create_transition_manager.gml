function create_simple_transition(_target_room, _transition= new TransitionFade(), _out=30, _wait=15, _in=30){
    if (!instance_exists(obj_transition_manager))
    {
        instance_create_depth(0, 0, 0,
            obj_transition_manager,
            {
                // transition_manager variable: value
                target_room: _target_room,
                transition: _transition,
                out_length: _out,
                wait_length: _wait,
                in_length: _in,
            }
        );
    }
}