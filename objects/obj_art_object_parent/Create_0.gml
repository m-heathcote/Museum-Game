// Inherit the parent event
event_inherited();

// --- DEBUG ---

show_step_targets = true; // *** debug ***

// --- ABOUT ---

player = instance_find(obj_player, 0);

interactable = true;

art_home = noone;
has_shadow_at_home = true;

// --- STATE ---

at_home = true;
held = false;

anim_active = false;
anim_type = "";
anim_progress = 0;

// --- ANIM SETTINGS ---

pickup_anim_duration = 34;
setdown_anim_duration = 27;
move_anim_duration = 25;

// --- ANIM MEMORY ---

anim_start_x = x;
anim_start_y = y;
anim_start_depth = depth;

anim_control_x = x;
anim_control_y = y;

anim_target_x = 0;
anim_target_y = 0;

// --- MOVE SETTINGS ---

step_size = 10;
target_range = 10; // how many steps away

move_cooldown_time = 60;
move_cooldown_active = false;

// --- MOVE MEMORY ---

step_count_x = -1;
step_count_y = -1;

move_x_multiplier = 0;
move_y_multiplier = 0;

move_target_x = -1;
move_target_y = -1;

move_step_x = -1;
move_step_y = -1;

function update_vars()
{
    blocks_player = !at_home && !held;
    interactable = !at_home && !held && !anim_active;
    has_shadow = !at_home && !held && !anim_active;
    if (has_shadow_at_home && at_home)
    {
        has_shadow = true;
    }
}

function check_place_collisions(_x, _y) { return check_object_place_collisions(_x, _y); }

function pick_up()
{ 
    pick_up_object();
    reset_move_coords();
    update_vars();
}

function set_down()
{
    set_down_object();
    update_vars();
}

function put_back_home()
{
    put_object_back_home();
    update_vars();
}

function grab_from_home()
{
    pick_up_object();
    at_home = false;
    reset_move_coords();
    update_vars();
}

interact_func = pick_up;

function try_to_move_a_step()
{
    if (!at_home && !held && !anim_active && !move_cooldown_active)
    {
        // Play sound
        audio_play_sound(snd_art_move, 0, false);
        
        // Start move
        anim_active = true;
        anim_type = "move";
        anim_progress = 0;
        
        anim_start_x = x;
        anim_start_y = y;
        anim_start_depth = depth;
        
        //alt_shadow_y = y; ************************* TODO: use or get rid of this
        
        anim_target_x = move_step_x;
        anim_target_y = move_step_y;
        //anim_target_x = x + 10;   // temp ***
        //anim_target_y = y + 10;   // temp ***
        
        show_debug_message("                       MOVING TO: " + string(anim_target_x) + ", " + string(anim_target_y));
        
        // Make the object arc
        var _arc_size = 15;
        anim_control_x = (anim_start_x + anim_target_x) / 2;
        anim_control_y = min(anim_start_y, anim_target_y) - _arc_size;
        
        return true;
    }
    
    return false; // could not start move
}

function end_move()
{
    anim_active = false;
    alarm[0] = move_cooldown_time;
    move_cooldown_active = true;
    
    x = anim_target_x;
    y = anim_target_y;
    
    if (player.is_overlapping_object(id))
    {
        ignore_player_collision = true;
    }
}

function reset_move_coords()
{
    move_target_x = -1;
    move_target_y = -1;
    
    move_step_x = -1;
    move_step_y = -1;
    
    step_count_x = -1;
    step_count_y = -1;
    
    move_x_multiplier = 0;
    move_y_multiplier = 0;
}

function pick_move_target()
{
    move_x_multiplier = choose(1, -1);
    move_y_multiplier = choose(1, -1);
    
    show_debug_message("  got multipliers: " + string(move_x_multiplier) + "  " + string(move_y_multiplier));
    
    step_count_x = floor(random_range(1, target_range));
    step_count_y = floor(random_range(1, target_range));
    
    move_target_x = x + (step_count_x * step_size * move_x_multiplier);
    move_target_y = y + (step_count_y * step_size * move_y_multiplier);
    
    show_debug_message("current x, y: " + string(x) + ", " + string(y));
    
    show_debug_message("picked new move target: " + string(move_target_x) + ", " + string(move_target_y));
    show_debug_message("********** x steps: " + string(step_count_x));
    show_debug_message("********** y steps: " + string(step_count_y));
}

function try_step(_x_step, _y_step)
{
    // return true if valid, false if collision
    return !check_object_place_collisions(x + _x_step, y + _y_step);
}

function pick_step_coords()
{
    var _valid_axes = [];
    if (step_count_x > 0)
    {
        array_push(_valid_axes, "x");
    }
    if (step_count_y > 0)
    {
        array_push(_valid_axes, "y");
    }
    if (step_count_x > 0 && step_count_y > 0)
    {
        array_push(_valid_axes, "both");
    }
    
    show_debug_message("valid directions: " + string(_valid_axes)); // **************
    
    var _found = false;
    
    var _x_move = step_size * move_x_multiplier;
    var _y_move = step_size * move_y_multiplier;
    
    while (!_found && array_length(_valid_axes) > 0)
    {
        var _i = irandom(array_length(_valid_axes) - 1);
        var _axis = _valid_axes[_i];
        
        switch (_axis)
        {
            case "x":
                _found = try_step(_x_move, 0);
                if (_found)
                {
                    show_debug_message("moving on - x axis -");
                    move_step_x = x + _x_move;
                    move_step_y = y;
                    step_count_x -= 1;
                }
                break;
            
            case "y":
                _found = try_step(0, _y_move);
                if (_found)
                {
                    show_debug_message("moving on - y axis -");
                    move_step_x = x;
                    move_step_y = y + _y_move;
                    step_count_y -= 1;
                }
                break;
            
            case "both":
                _found = try_step(_x_move, _y_move);
                if (_found)
                {
                    show_debug_message("moving on - both axes -");
                    move_step_x = x + _x_move;
                    move_step_y = y + _y_move;
                    step_count_x -= 1;
                    step_count_y -= 1;
                }
                break;
        }
        
        if (!_found)
        {
            show_debug_message("        removing " + string(_valid_axes[_i]) + "from valid array"); //  **************
            array_delete(_valid_axes, _i, 1);
        }
    }
    
    return _found;
    
}