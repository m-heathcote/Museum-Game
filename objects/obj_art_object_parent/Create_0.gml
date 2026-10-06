// Inherit the parent event
event_inherited();

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

anim_duration = 20;

function start_pickup(_player)
{
    anim_active = true;
    anim_type = "pickup";
    anim_progress = 0;
    
    _player.anim_active = true;

    anim_start_x = x;
    anim_start_y = y;

    anim_target_x = _player.x + _player.held_obj_x_offset;
    anim_target_y = _player.y + _player.held_obj_y_offset;

    // Make the object arc
    anim_control_x = (anim_start_x + anim_target_x) / 2;
    anim_control_y = min(anim_start_y, anim_target_y) - 30;
}

function pick_up()
{
    if (player.held_obj == noone)
    {
        audio_play_sound(snd_pick_up, 0, false);
        start_pickup(player);
    }
}

function set_as_held(_player)
{
    anim_active = false;
    held = true;
    
    _player.anim_active = false;
    
    x = player.x + player.held_obj_x_offset;
    y = player.y + player.held_obj_y_offset;
    
    _player.held_obj = id;
}

function start_setdown(_player)
{
    anim_active = true;
    anim_type = "setdown";
    anim_progress = 0;
    
    _player.anim_active = true;
    
    anim_start_x = x;
    anim_start_y = y;
    
    anim_target_x = _player.x + _player.place_obj_x_offset;
    anim_target_y = _player.y + _player.place_obj_y_offset;
    
    // Make the object arc
    anim_control_x = (anim_start_x + anim_target_x) / 2;
    anim_control_y = min(anim_start_y, anim_target_y) - 15;
}

function set_down()
{
    if (player.held_obj == id)
    {
        audio_play_sound(snd_set_down, 0, false);
        start_setdown(player);
    }
}

function set_not_held(_player)
{
    anim_active = false;
    held = false;
    
    _player.anim_active = false;
    
    x = player.x + player.place_obj_x_offset;
    y = player.y + player.place_obj_y_offset;
    
    _player.held_obj = noone;
}

interact_func = pick_up;