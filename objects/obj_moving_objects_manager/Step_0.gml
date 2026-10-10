if (!art_can_move) exit;
    
var _num_living = array_length(living_art);
var _num_dormant = array_length(dormant_art);

if (!jump_out_cooldown_active && _num_living < max_living_art)
{
    show_debug_message("can bring art to life");
    
    if (_num_dormant >= 1)
    {
        var _i = irandom(_num_dormant - 1);
        var _art = dormant_art[_i];
        
        _art.jump_from_home();
        switch_to_living(_art);   // TODO: use index we already know *****
        
        var _cooldown = irandom_range(jump_out_cooldown_min, jump_out_cooldown_max);
        alarm[0] = _cooldown;
        jump_out_cooldown_active = true;
        
        show_debug_message("LIVING ART: " + string(living_art));
    }
}