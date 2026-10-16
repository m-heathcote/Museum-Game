if (!instance_exists(obj_stats_manager))
{
    instance_create_depth(x, y, 0, obj_stats_manager);
}

if (room == rm_1_Museum)
{
    randomise();
    
    // Ensure stats reset
    reset_stats();
    
    if (global.times_played > 0 && global.enable_intro_tutorial)
    {
        // Don't show tutorial again on retry
        global.enable_intro_tutorial = false;
    }
    
    // Get collision layer
    tiles_col = layer_tilemap_get_id("Tiles_Col");
    
    // Start fountain loop
    var _snd_falloff_ref = 32;
    var _snd_falloff_max = 200;
    var _fountain = instance_find(obj_fountain, 0);
    audio_play_sound_at(
        snd_fountain,
        _fountain.x, _fountain.y - 25, 0,
        _snd_falloff_ref, _snd_falloff_max, 1,
        true, 0);
    
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
    
    // Start background music
    global.music = audio_play_sound(snd_music, 0, true, 0);
    audio_sound_gain(global.music, 0.6, 800);
}

if (room == rm_End)
{
    global.times_played++;
}