// Inherit the parent event
event_inherited();

show_collision_mask_corners = false; // ** debug **

player = instance_find(obj_player, 0);

interactable = true;

art_home = noone;
at_home = true;
held = false;

anim_active = false;
anim_type = "";
anim_progress = 0;

anim_start_x = x;
anim_start_y = y;

anim_control_x = x;
anim_control_y = y;

anim_target_x = 0;
anim_target_y = 0;

pickup_anim_duration = 35;
setdown_anim_duration = 28;

function pick_up()
{
    pick_up_object();
}

function set_down()
{
    set_down_object();
}

interact_func = pick_up;

function put_back_home()
{
    if (player.held_obj == id)
    {
        // Player setdown animation
        player.play_anim("setdown");
        
        // Play sound
        audio_play_sound(snd_in_place, 0, false);
        
        // Start setdown
        anim_active = true;
        anim_type = "put_home";
        anim_progress = 0;
        
        player.obj_anim_active = true;
        
        anim_start_x = x;
        anim_start_y = y;
        
        anim_target_x = art_home.x;
        anim_target_y = art_home.y;
        
        // Make the object arc
        var _arc_size = 15;
        anim_control_x = (anim_start_x + anim_target_x) / 2;
        anim_control_y = min(anim_start_y, anim_target_y) - _arc_size;
    }
}

function set_at_home()
{
    anim_active = false;
    held = false;
    at_home = true;
    
    x = anim_target_x;
    y = anim_target_y;
    
    /*
    if (player.is_overlapping_object(id))
    {
        ignore_player_collision = true;
    }*/
    
    player.obj_anim_active = false;
    player.held_obj = noone;
}

function check_place_collisions(_x, _y)
{
    // Check for overlapping room objects
    var _inst = instance_place(
        _x,
        _y,
        obj_room_object_parent
    );

    if (_inst != noone && _inst != id)
    {
        if (_inst.blocks_player)
        {
            return true;
        }
    }
    
    // Get proposed offset
    var _x_diff = _x - x;
    var _y_diff = _y - y;
    
    var _left = bbox_left + _x_diff;
    var _right = bbox_right + _x_diff;
    var _top = bbox_top + _y_diff;
    var _bottom = bbox_bottom + _y_diff;
    
    // Check for tile collisions
    var _middle = tilemap_get_at_pixel(obj_game_manager.tiles_col, _x, _y);
	var _left_top = tilemap_get_at_pixel(obj_game_manager.tiles_col, _left, _top);
	var _right_top = tilemap_get_at_pixel(obj_game_manager.tiles_col, _right, _top);
	var _right_bottom = tilemap_get_at_pixel(obj_game_manager.tiles_col, _right, _bottom);
	var _left_bottom = tilemap_get_at_pixel(obj_game_manager.tiles_col, _left, _bottom);
    
    if (_middle || _left_top || _right_top || _left_bottom || _right_bottom)
	{
		return true;
	}
    
    return false;
}