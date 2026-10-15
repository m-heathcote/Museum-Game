function create_dialog(_messages, _sound=true, _source=noone)
{
    if (instance_exists(obj_dialog)) return;
        
    if (_messages == -1) return;
        
    var _inst = instance_create_depth(0, 0, 0, obj_dialog);
    _inst.messages = _messages;
    _inst.current_message = 0;
    
    _inst.sound_during_dialog = _sound;
    
    _inst.dialog_source = _source;
}