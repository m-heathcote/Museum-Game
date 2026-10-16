global.paused = false;

global.enable_intro_tutorial = true; // SHOULD BE SET TO TRUE FOR GAME RELEASE

global.DIALOGS = create_dialog_database();

global.music = -1;

tiles_col = undefined;

delay_before_first_dialog = 38;

show_move_controls = false;
controls_margin = 20;
control_alpha = 0.9;
controls_frames = 60 * 6;
controls_fading = false;
fade_rate = 0.01;

// Set audio falloff model
audio_falloff_set_model(audio_falloff_linear_distance_clamped);