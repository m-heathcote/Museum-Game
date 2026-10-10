art_can_move = true;

total_art_count = instance_number(obj_art_object_parent);

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

show_debug_message("--- START LIVING: " + string(living_art));
show_debug_message("--- START DORMANT: " + string(dormant_art));

max_living_art =  4;

jump_out_cooldown_min = 120;
jump_out_cooldown_max = 240;
jump_out_cooldown_active = false;

function move_from_list_to_list(_val, _old_list, _new_list)
{
    var _ind = array_get_index(_old_list, _val);
    
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

function switch_to_dormant(_art)
{
    return move_from_list_to_list(_art, living_art, dormant_art);
}

function switch_to_living(_art)
{
    return move_from_list_to_list(_art, dormant_art, living_art);
}




// *********
alarm[0] = 120;
jump_out_cooldown_active = true;
// *********