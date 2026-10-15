function create_dialog(_messages, _sound=true, _source=noone, _unfreeze_at_end=true)
{
    if (instance_exists(obj_dialog)) return;
        
    if (_messages == -1) return;
        
    // Freeze player
    var _player = instance_find(obj_player, 0);
    _player.frozen = true;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
    
    _inst.sound_during_dialog = _sound;
    _inst.unfreeze_at_end = _unfreeze_at_end;
    
    _inst.dialog_source = _source;
}