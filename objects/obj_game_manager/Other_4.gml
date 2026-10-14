if (room == rm_1_Museum)
{
    randomise();
    
    // Ensure stats reset
    reset_stats();
    
    // Get collision layer
    tiles_col = layer_tilemap_get_id("Tiles_Col");
}

if (!instance_exists(obj_stats_manager))
{
    instance_create_depth(x, y, 0, obj_stats_manager);
}

// Start background music
//audio_play_sound(snd_music_level, 0, 1);