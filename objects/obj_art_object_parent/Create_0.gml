// Inherit the parent event
event_inherited();

player = instance_find(obj_player, 0);

interactable = true;

art_home = noone;
at_home = true;
has_shadow_at_home = true;
held = false;

anim_active = false;
anim_type = "";
anim_progress = 0;

anim_start_x = x;
anim_start_y = y;
anim_start_depth = depth;

anim_control_x = x;
anim_control_y = y;

anim_target_x = 0;
anim_target_y = 0;

pickup_anim_duration = 34;
setdown_anim_duration = 27;
move_anim_duration = 25;

next_move_x = -1;
next_move_y = -1;

move_cooldown_time = 60;
move_cooldown_active = false;

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
        
        //alt_shadow_y = y; ************************* TODO fix or get rid of this
        
        //anim_target_x = next_move_x;
        //anim_target_y = next_move_y;
        anim_target_x = x + 10;  // temp ***
        anim_target_y = y;       // temp ***
        
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