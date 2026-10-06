// --------------- INPUT ---------------

// update input_x, input_y, and is_running
get_input();

/*
var _input_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _input_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Normalize diagonal movement
var _input_length = point_distance(0, 0, _input_x, _input_y);

if (_input_length > 0)
{
    _input_x /= _input_length;
    _input_y /= _input_length;
}
 * */

/*
// horizontal input (1 if D held, -1 if A held)
// vertical input (1 if S held, -1 if W held)
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// fix diagonal movement
var _len = _hor != 0 || _ver != 0; // 1 if any movement
var _dir = point_direction(0, 0, _hor, _ver);
_hor = lengthdir_x(_len, _dir);
_ver = lengthdir_y(_len, _dir);
*/

// --------------- SPEED / ACCELERATION ---------------

// sets hsp/vsp based on speed and acceleration
update_speed();

/*
is_running = keyboard_check(run_key);

var _target_speed = is_running ? run_speed : move_speed;

var _target_hsp = _input_x * _target_speed;
var _target_vsp = _input_y * _target_speed;
 * */

//curr_speed = is_running ? run_speed : move_speed;

// --------------- ACCELERATION ---------------
/*
if (_input_x != 0 || _input_y != 0)
{
    hsp = move_towards(hsp, _target_hsp, acceleration);
    vsp = move_towards(vsp, _target_vsp, acceleration);
}
else
{
    hsp = move_towards(hsp, 0, deceleration);
    vsp = move_towards(vsp, 0, deceleration);
}*/

// --------------- MOVEMENT ---------------

// checks collisions and moves player
move_player();

// ...
/*
// actually move
move_and_collide(
    _hor * curr_speed,
    _ver * curr_speed,
    obj_game_manager.tiles_col,
    undefined,
    undefined,
    undefined,
    curr_speed,
    curr_speed
);
 */

// --------------- ANIMATION ---------------

// set facing and change sprite
update_animation();

/*
// If player is moving...
if (hsp != 0 or vsp != 0)
{
    facing = point_direction(0, 0, hsp, vsp);
    
    if (is_running)
    {
        set_player_sprite(get_direction(facing), "run");
    }
    else
    {
        set_player_sprite(get_direction(facing), "walk");
    }
}
else
{
    set_player_sprite(get_direction(facing), "idle");
}*/