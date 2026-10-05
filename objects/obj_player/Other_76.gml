// Read the received message from the event_data map
var _message = event_data[? "message"];

// Expecting the "footstep" message set in spr_player_walk
if (_message == "footstep" && !global.paused)
{
	// Create walking dust animation
	//var _effect = instance_create_layer(x, bbox_bottom, "Instances", obj_effect_walk);

	// Flip based on which direction the player is moving
	//_effect.image_xscale = image_xscale;

	// Choose a random sound to play on footstep
	var _sound = choose(snd_step_1, snd_step_2, snd_step_3);
    var _pitch = random_range(0.8, 1.1);
	audio_play_sound(_sound, 0, 0, 1, 0, _pitch);
}