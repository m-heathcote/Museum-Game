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
target_range = 25; // how many steps away
move_frequency = 70; // percentage

move_cooldown_min = 5;
move_cooldown_max = 80;
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
        object_move_a_step();
    }
}