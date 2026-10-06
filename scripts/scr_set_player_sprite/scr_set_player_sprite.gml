function set_player_sprite(_facing, _action)
{
    if (_facing == "right")
    {
        if (_action == "idle") { obj_player.sprite_index = spr_player_idle_right; }
        else if (_action == "walk") { obj_player.sprite_index = spr_player_walk_right; }
        else if (_action == "run") { obj_player.sprite_index = spr_player_walk_right; }
    }
    else if (_facing == "up")
    {
        if (_action == "idle") { obj_player.sprite_index = spr_player_idle_up; }
        else if (_action == "walk") { obj_player.sprite_index = spr_player_walk_up; }
        else if (_action == "run") { obj_player.sprite_index = spr_player_walk_up; }
    }
    else if (_facing == "left")
    {
        if (_action == "idle") { obj_player.sprite_index = spr_player_idle_left; }
        else if (_action == "walk") { obj_player.sprite_index = spr_player_walk_left; }
        else if (_action == "run") { obj_player.sprite_index = spr_player_walk_left; }
    }
    else if (_facing == "down")
    {
        if (_action == "idle") { obj_player.sprite_index = spr_player_idle_down; }
        else if (_action == "walk") { obj_player.sprite_index = spr_player_walk_down; }
        else if (_action == "run") { obj_player.sprite_index = spr_player_walk_down; }
    }
    
    update_animation_speed(_action);
}

function get_direction(_angle)
{
    if (_angle < 0)
    {
        return "less than 0";
    }
    else if (_angle <= 45 || _angle > 315)
    {
        return "right"
    }
    else if (_angle > 45 && _angle <= 135)
    {
        return "up"
    }
    else if (_angle > 135 && _angle <= 225)
    {
        return "left"
    }
    else if (_angle > 225 && _angle <= 315)
    {
        return "down"
    }
}

function update_animation_speed(_action)
{
    if (_action == "walk" || _action == "run")
    {
        var _speed = point_distance(0, 0, obj_player.hsp, obj_player.vsp);
        var _max_speed = obj_player.is_running ? obj_player.run_speed : obj_player.move_speed;
        
        var _max_image_speed = obj_player.is_running
            ? obj_player.run_anim_speed
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
