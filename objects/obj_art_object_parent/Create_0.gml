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

function check_place_collisions(_x, _y) { return check_object_place_collisions(_x, _y); }

function pick_up() { pick_up_object(); }

function set_down() { set_down_object(); }

function put_back_home() { put_object_back_home(); }

function grab_from_home()
{
    pick_up_object();
    at_home = false;
}

interact_func = pick_up;