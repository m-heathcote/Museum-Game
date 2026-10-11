// Inherit the parent event
event_inherited();

// --- DEBUG ---

show_step_targets = true; // *** debug ***

// --- ABOUT ---

player = instance_find(obj_player, 0);

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

jump_out_cooldown_min = 60 * 15;
jump_out_cooldown_max = 60 * 45;
jump_out_cooldown_active = false;

// --- MOVE SETTINGS ---

step_size = 15;
target_range = 15; // how many steps away
move_frequency = 50; // percentage

move_cooldown_min = 6;
move_cooldown_max = 85;
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
    
    var _cooldown = irandom_range(jump_out_cooldown_min, jump_out_cooldown_max);
    alarm[1] = _cooldown;
    jump_out_cooldown_active = true;
}

function grab_from_home()
{
    pick_up_object();
    at_home = false;
    reset_move_coords();
    update_vars();
}

function jump_from_home()
{
    var _success = object_jump_from_home();
    if (_success)
    {
        at_home = false;
        update_vars();
    }
    return _success;
}

interact_func = pick_up;