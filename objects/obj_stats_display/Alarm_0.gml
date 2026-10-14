// *** ALARM 0 ***
// runs on delay after room start

var _snd = global.fired ? snd_score_sad : snd_score_happy;

audio_play_sound(_snd, 0, false);