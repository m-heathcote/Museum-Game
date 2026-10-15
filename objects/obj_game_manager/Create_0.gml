global.paused = false;

global.DIALOGS = create_dialog_database();

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