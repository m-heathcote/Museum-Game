function create_dialog_database()
{
    /******* STRUCT FORMAT ********************************************************
    msg_name: [
        {
            name: "npc or -",
            msg: "text to print",
            voice:
            color:
            next: // next index or -1
            choices: [
                { 
                    text: "choice 1",
                    choice_action: function(_source)
                    {
                        if (instance_exists(_source))
                        {
                            with(_source)
                            // instance_destroy() or whatever
                            // OR
                            if (instance_exists(_source)
                            // then do _source.variable
                        }
                        
                        return 1; // return next msg index
                    },
                },
            ],
            during_msg_action: function(){},
            after_msg_action: function(){}, // return next msg index or -1
     ******************************************************************************/
    
    return {
        
        first_night: [
            {
                name: "-",
                msg: "First night on the job!",
                color: c_gray,
            },
            {
                name: "-",
                msg: "The boss said she left a to-do list on the welcome desk.\nI should check it out...",
                color: c_gray,
                after_msg_action: function(){
                    var _clock = instance_find(obj_clock, 0);
                    _clock.show_clock = true;
                    
                    // Show movement controls
                    var _manager = instance_find(obj_game_manager, 0);
                    _manager.show_move_controls = true;
                    _manager.alarm[0] = _manager.controls_frames;
                    
                    // Unfreeze player
                    var _player = instance_find(obj_player, 0);
                    _player.frozen = false;
                    
                    return -1;
                },
            },
        ],
        
        note_p1: [ 
            {
                name: "Boss",
                msg: "Hey, welcome to your first night at Little Museum!"
            },
            {
                name: "Boss",
                msg: "It should be a pretty chill shift."
            },
            {
                name: "Boss",
                msg: "I mean, it's the middle of the night, what could possibly go wrong?"
            },
            {
                name: "Boss",
                msg: "I've attached a to-do list for you since we can't have you just sitting around all night."
            },
        ],
        
        note_p2: [ 
            {
                name: "-",
                msg: "The note continues..."
            },
            {
                name: "Boss",
                msg: "For some reason that last point tends to be hard for new hires to follow."
            },
            {
                name: "Boss",
                msg: "One morning I found a statue in the fountain!"
            },
            {
                name: "Boss",
                msg: "It's not like it came to life and walked over there!"
            },
        ],
        
    }
}