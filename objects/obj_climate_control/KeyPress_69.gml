if (!show_display) exit;
    
show_debug_message("closing");
show_display = false;
player.frozen = false;

// re-enable after a delay
wall_thing_id.alarm[0] = 5;