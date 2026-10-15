// --- DEBUG ---

show_placement_location = false; // ** debug **
show_art_freeze_range = false; // ** debug **
show_origin = false; // ** debug **
show_light_sprite = false; // ** debug **

// --- CONTROLS ---

interact_key = ord("E");

// --- STATE ---

facing = point_direction(0, 0, 0, 1);

obj_anim_active = false;
player_anim_active = false;

frozen = false;

// --- SPEED / MOVEMENT SETTINGS ---

move_speed = 1.85;  // 1.85
run_speed = 3.3;    // 3.3
held_obj_speed_modifier = -1;

walk_anim_speed = 1;
run_anim_speed = 1.8;   // 1.8

run_key = vk_shift;
is_running = false;

acceleration = 0.24;    // 0.24
run_acceleration = 0.1; // 0.1
deceleration = 0.5;     // 0.5

// --- MOVEMENT MEMORY ---

input_x = 0;
input_y = 0;

hsp = 0;
vsp = 0;

// --- HELD OBJ ---

held_obj = noone;
held_obj_x_offset = 0;
held_obj_y_offset = -19;

// --- SAVED COORDS ---

place_obj_y_offset = 9;
place_obj_x = x;
place_obj_y = y + place_obj_y_offset;
last_valid_place_obj_x = x;
last_valid_place_obj_y = y;

// --- SET AUDIO POSITION ---

audio_listener_orientation(0, 0, 1, 0, -1, 0)
audio_listener_position(x, y, 0);

// --- FUNCTIONS ---

function is_overlapping_object(_object)
{
    return place_meeting(x, y, _object);
}

function play_anim(_action)
{
    player_anim_active = true;
    set_player_sprite(get_direction(facing), _action);
}