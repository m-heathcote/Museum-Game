// --- ENABLE / DISABLE ---

art_can_move = true;

// --- COUNTS ---

total_art_count = instance_number(obj_art_object_parent);
max_living_art =  0;

// --- LISTS ---

dormant_art = [];
living_art = [];

// --- COOLDOWNS ---

try_jump_out_cooldown_time = 30;
try_jump_out_cooldown_active = false;

jump_out_cooldown_min = 60 * 5;
jump_out_cooldown_max = 60 * 8;
jump_out_cooldown_active = false;

// --- FUNCTIONS ---

function increase_jump_out_countdown(_amt=60*3)
{
    if (jump_out_cooldown_active)
    {
        alarm[0] += _amt;
    }
    else 
    {
        alarm[0] = _amt;
        jump_out_cooldown_active = true;
    }
}

function move_from_list_to_list(_val, _old_list, _new_list, _known_ind=-1)
{
    var _ind = _known_ind;
    if (_known_ind == -1)
    {
        _ind = array_get_index(_old_list, _val);
    }
    
    if (_ind != -1)
    {
        // Remove from old list
        array_delete(_old_list, _ind, 1);
    
        // Add to new list
        array_push(_new_list, _val);
        
        return true;
    }
    
    return false;
}

function switch_to_dormant(_art, _ind=-1)
{
    show_debug_message("---- SWITCHING " + string(_art.sprite_index) + " TO DORMANT");
    return move_from_list_to_list(_art, living_art, dormant_art, _ind);
}

function switch_to_living(_art, _ind=-1)
{
    show_debug_message("++++ SWITCHING " + string(_art.sprite_index) + " TO LIVING");
    return move_from_list_to_list(_art, dormant_art, living_art, _ind);
}