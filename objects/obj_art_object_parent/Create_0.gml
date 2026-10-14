// Inherit the parent event
event_inherited();

// --- DEBUG ---

show_step_targets = false; // *** debug ***

// --- ABOUT ---

player = instance_find(obj_player, 0);
move_manager = instance_find(obj_moving_objects_manager, 0);

interactable = true;

art_home = noone;
has_shadow_at_home = true;
has_highlight_at_home = true;
home_room = "";

// --- STATE ---

at_home = true;
held = false;
is_living = false;

anim_active = false;
anim_type = "";
anim_progress = 0;

// --- ANIM SETTINGS ---

pickup_anim_duration = 34;
setdown_anim_duration = 27;
move_anim_duration = 20;

// --- ANIM MEMORY ---

anim_start_x = x;
anim_start_y = y;
anim_start_depth = depth;

anim_control_x = x;
anim_control_y = y;

anim_target_x = 0;
anim_target_y = 0;

// --- MAGIC SETTINGS ---

jump_out_cooldown_min = 60 * 40;
jump_out_cooldown_max = 60 * 80;
jump_out_cooldown_active = false;

// --- MOVE SETTINGS ---

step_size = 20;
target_range = 15; // how many steps away
move_frequency = 80; // percentage
move_dist_from_player = 87;

move_cooldown_min = 6;
move_cooldown_max = 30;
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

// --- FUNCTIONS ---

function check_place_collisions(_x, _y) { return check_object_place_collisions(_x, _y); }

function get_alert_spr_ind()
{
    if (home_room == "top") { return 0; }
    else if (home_room == "right") { return 1; }
    else if (home_room == "left") { return 2; }
    else { return 3; }
}

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
    
    // Increase personal cooldown
    var _cooldown = irandom_range(jump_out_cooldown_min, jump_out_cooldown_max);
    alarm[1] = _cooldown;
    jump_out_cooldown_active = true;
    
    // Increase manager cooldown
    move_manager.increase_jump_out_countdown();
}

function grab_from_home()
{
    var _success = pick_up_object();
    if (_success)
    {
        at_home = false;
        reset_move_coords();
        update_vars();
        
        // Edit Stats
        global.player_took_out_of_place++;
        global.num_art_out_of_place++;
    }
}

function jump_from_home()
{
    var _success = object_jump_from_home();
    if (_success)
    {
        at_home = false;
        update_vars();
        
        // Edit Stats
        global.num_art_out_of_place++;
        
        // Create visual alert
        audio_play_sound(snd_click, 0, false);  // TODO: ADD BETTER SOUND HERE *****
        instance_create_depth(0, 0, 0,
            obj_move_alert,
            {
                // move_alert variable: value
                origin_x: x,
                origin_y: y,
                spr_ind: get_alert_spr_ind(),
            }
        );
    }
    return _success;
}

interact_func = pick_up;