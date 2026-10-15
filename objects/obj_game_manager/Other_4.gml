if (room == rm_1_Museum)
{
    randomise();
    
    // Ensure stats reset
    reset_stats();
    
    // Get collision layer
    tiles_col = layer_tilemap_get_id("Tiles_Col");
    
    if (!global.enable_intro_tutorial)
    {
        // Set to not show intro note
        var _todo = instance_find(obj_paper_todo, 0);
        _todo.in_first_viewing = false;
        _todo.player_has_interacted = false;
        
        // Start clock
        var _clock = instance_find(obj_clock, 0);
        _clock.show_clock = true;
        _clock.enable_clock();
        
        // Disable trigger zone
        var _trigger_zone = instance_find(obj_dialog_trigger_zone, 0);
        _trigger_zone.disable_dialog_zone();
    }
    else 
    {
        // Trigger start dialog on a delay
        alarm[1] = delay_before_first_dialog;
        
        // freeze player
        var _player = instance_find(obj_player, 0);
        _player.frozen = true;
    }
}

if (!instance_exists(obj_stats_manager))
{
    instance_create_depth(x, y, 0, obj_stats_manager);
}

// Start background music
//audio_play_sound(snd_music_level, 0, 1);