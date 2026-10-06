// horizontal input (1 if D held, -1 if A held)
// vertical input (1 if S held, -1 if W held)
var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// fix diagonal movement
var _len = _hor != 0 || _ver != 0; // 1 if any movement
var _dir = point_direction(0, 0, _hor, _ver);
_hor = lengthdir_x(_len, _dir);
_ver = lengthdir_y(_len, _dir);

// run if control held
is_running = keyboard_check(run_key);
curr_speed = is_running ? run_speed : move_speed;

// actually move
move_and_collide(
    _hor * curr_speed,
    _ver * curr_speed,
    tilemap,
    undefined,
    undefined,
    undefined,
    curr_speed,
    curr_speed
);

// if player is moving
if (_hor != 0 or _ver != 0)
{
    facing = point_direction(0, 0, _hor, _ver);
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
}