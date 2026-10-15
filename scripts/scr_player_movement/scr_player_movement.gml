function get_input()
{
    if (obj_anim_active || player_anim_active || frozen)
    {
        input_x = 0;
        input_y = 0;
        return;
    }
    
    var _right = keyboard_check(ord("D")) || keyboard_check(vk_right);
    var _left  = keyboard_check(ord("A")) || keyboard_check(vk_left);
    
    var _down  = keyboard_check(ord("S")) || keyboard_check(vk_down);
    var _up    = keyboard_check(ord("W")) || keyboard_check(vk_up);
    
    is_running = keyboard_check(vk_shift);
    /*
    if (held_obj == noone)
    {
        is_running = keyboard_check(vk_shift);
    }
    else
    {
    	is_running = false;
    }
     * */
    
    input_x = _right - _left;
    input_y = _down - _up;
    
    var _length = point_distance(0, 0, input_x, input_y);
    
    if (_length > 0)
    {
        input_x /= _length;
        input_y /= _length;
    }
}


function update_speed()
{
    var _target_speed = is_running ? run_speed : move_speed;
    
    var _target_hsp = input_x * _target_speed;
    var _target_vsp = input_y * _target_speed;
    
    var _has_input = input_x != 0 || input_y != 0;

    if (_has_input)
    {
        var _acceleration = acceleration;
        
        if (is_running && point_distance(0, 0, hsp, vsp) >= move_speed)
        {
            _acceleration = run_acceleration;
        }
        
        hsp = num_move_towards(hsp, _target_hsp, _acceleration);
        vsp = num_move_towards(vsp, _target_vsp, _acceleration);
    }
    else
    {
        hsp = num_move_towards(hsp, 0, deceleration);
        vsp = num_move_towards(vsp, 0, deceleration);
    }
}


function move_player()
{
    // Move horizontally
    if (!check_object_collisions(hsp, 0))
        move_and_collide(hsp, 0, obj_game_manager.tiles_col);

    // Move vertically
    if (!check_object_collisions(0, vsp))
        move_and_collide(0, vsp, obj_game_manager.tiles_col);
    
    // Update audio pos
    if(hsp != 0 || vsp != 0)
    {
        audio_listener_position(x, y, 0);
    }
}


function update_animation()
{
    if (player_anim_active)
    {
        return;
    }
    
    //if (input_x != 0 || input_y != 0)
    if (hsp != 0 or vsp != 0)
    {
        //facing = point_direction(0, 0, input_x, input_y);
        facing = point_direction(0, 0, hsp, vsp);
        
        if (held_obj != noone)
        {
            set_player_sprite(get_direction(facing), "walk_carry");
        }
        else if (is_running)
            set_player_sprite(get_direction(facing), "run");
        else
            set_player_sprite(get_direction(facing), "walk");
    }
    else
    {
        if (held_obj != noone)
        {
            set_player_sprite(get_direction(facing), "idle_carry");
        }
        else
        {
        	set_player_sprite(get_direction(facing), "idle");
        }
    }
}


