// currently requires facing input as get_direction(facing) *****************************
function set_player_sprite(_facing, _action)
{
    var _already_set = false;
    
    if (_facing == "right")
    {
        if (_action == "idle") { _already_set = !set_if_not_set(spr_player_idle_right); }
        else if (_action == "walk") { _already_set = !set_if_not_set(spr_player_walk_right); }
        else if (_action == "run") { _already_set = !set_if_not_set(spr_player_walk_right); }
        else if (_action == "pickup") { _already_set = !set_if_not_set(spr_player_pickup_right); }
        else if (_action == "setdown") { _already_set = !set_if_not_set(spr_player_setdown_right); }
        else if (_action == "idle_carry") { _already_set = !set_if_not_set(spr_player_idle_carry_right); }
        else if (_action == "walk_carry") { _already_set = !set_if_not_set(spr_player_walk_carry_right); }
    }
    else if (_facing == "up")
    {
        if (_action == "idle") { _already_set = !set_if_not_set(spr_player_idle_up); }
        else if (_action == "walk") { _already_set = !set_if_not_set(spr_player_walk_up); }
        else if (_action == "run") { _already_set = !set_if_not_set(spr_player_walk_up); }
        else if (_action == "pickup") { _already_set = !set_if_not_set(spr_player_pickup_up); }
        else if (_action == "setdown") { _already_set = !set_if_not_set(spr_player_setdown_up); }
        else if (_action == "idle_carry") { _already_set = !set_if_not_set(spr_player_idle_carry_up); }
        else if (_action == "walk_carry") { _already_set = !set_if_not_set(spr_player_walk_carry_up); }
    }
    else if (_facing == "left")
    {
        if (_action == "idle") { _already_set = !set_if_not_set(spr_player_idle_left); }
        else if (_action == "walk") { _already_set = !set_if_not_set(spr_player_walk_left); }
        else if (_action == "run") { _already_set = !set_if_not_set(spr_player_walk_left); }
        else if (_action == "pickup") { _already_set = !set_if_not_set(spr_player_pickup_left); }
        else if (_action == "setdown") { _already_set = !set_if_not_set(spr_player_setdown_left); }
        else if (_action == "idle_carry") { _already_set = !set_if_not_set(spr_player_idle_carry_left); }
        else if (_action == "walk_carry") { _already_set = !set_if_not_set(spr_player_walk_carry_left); }
    }
    else if (_facing == "down")
    {
        if (_action == "idle") { _already_set = !set_if_not_set(spr_player_idle_down); }
        else if (_action == "walk") { _already_set = !set_if_not_set(spr_player_walk_down); }
        else if (_action == "run") { _already_set = !set_if_not_set(spr_player_walk_down); }
        else if (_action == "pickup") { _already_set = !set_if_not_set(spr_player_pickup_down); }
        else if (_action == "setdown") { _already_set = !set_if_not_set(spr_player_setdown_down); }
        else if (_action == "idle_carry") { _already_set = !set_if_not_set(spr_player_idle_carry_down); }
        else if (_action == "walk_carry") { _already_set = !set_if_not_set(spr_player_walk_carry_down); }
    }
    
    if (!_already_set)
    {
        image_index = 0;
    }
    
    update_animation_speed(_action);
}

function set_if_not_set(_spr)
{
    if (sprite_index != _spr)
    {
        sprite_index = _spr;
        return true;
    }
    else {
    	return false;
    }
}

function get_direction(_angle)
{
    if (_angle < 0)
    {
        return "less than 0";
    }
    else if (_angle <= 45 || _angle > 315)
    {
        return "right";
    }
    else if (_angle > 45 && _angle <= 135)
    {
        return "up";
    }
    else if (_angle > 135 && _angle <= 225)
    {
        return "left";
    }
    else if (_angle > 225 && _angle <= 315)
    {
        return "down";
    }
}

function update_animation_speed(_action)
{
    if (_action == "walk" || _action == "run" || _action == "walk_carry")
    {
        var _speed = point_distance(0, 0, obj_player.hsp, obj_player.vsp);
        var _max_speed = obj_player.is_running
                    ? ((obj_player.held_obj == noone) ? obj_player.run_speed : obj_player.run_carry_speed)
                    : obj_player.move_speed;
        
        var _max_image_speed = obj_player.is_running
                    ? ((obj_player.held_obj == noone) ? obj_player.run_anim_speed : obj_player.run_carry_anim_speed)
                    : obj_player.walk_anim_speed;
        
        var _target_image_speed = (_speed / _max_speed) * (_max_image_speed);
        
        // not lerped because move speed is already smoothed with acceleration
        obj_player.image_speed = _target_image_speed;
    }
    else
    {
    	obj_player.image_speed = 1;
    }
}
