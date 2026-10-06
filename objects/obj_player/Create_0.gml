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

input_x = 0;
input_y = 0;

hsp = 0;
vsp = 0;

facing = point_direction(0,0, 0, 1);

held_obj_x_offset = 0;
held_obj_y_offset = -19;

place_obj_x_offset = 25;
place_obj_y_offset = 9;

interact_key = ord("E");
held_obj = noone;
anim_active = false;