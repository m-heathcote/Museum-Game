// --- ENABLE / DISABLE ---

art_can_move = true;

// --- COUNTS ---

total_art_count = instance_number(obj_art_object_parent);
max_living_art =  4;

// --- LISTS ---

dormant_art = [];
living_art = [];
for (var _i = 0; _i < total_art_count; ++_i)
{
    var _art = instance_find(obj_art_object_parent, _i)
    
    if (_art != noone)
    {
        if (_art.at_home)
        {
            array_push(dormant_art, _art);
        }
        else
        {
        	array_push(living_art, _art);
        }
    }
    
}

// --- COOLDOWNS ---

try_jump_out_cooldown_time = 60;
try_jump_out_cooldown_active = false;

jump_out_cooldown_min = 240;
jump_out_cooldown_max = 300;
jump_out_cooldown_active = false;

// --- FUNCTIONS ---

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
    show_debug_message("          ---- SWITCHING " + string(_art.sprite_index) + " TO DORMANT");
    return move_from_list_to_list(_art, living_art, dormant_art, _ind);
}

function switch_to_living(_art, _ind=-1)
{
    show_debug_message("          ++++ SWITCHING " + string(_art.sprite_index) + " TO LIVING");
    return move_from_list_to_list(_art, dormant_art, living_art, _ind);
}




// *********
// START COOLDOWN             TODO: start with cooldown in some other way
alarm[0] = 120;
jump_out_cooldown_active = true;
// *********