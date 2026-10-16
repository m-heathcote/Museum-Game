// Create lists
for (var _i = 0; _i < total_art_count; ++_i)
{
    var _art = instance_find(obj_art_object_parent, _i)
    
    if (_art != noone)
    {
        if (_art.at_home)
        {
            array_push(dormant_art, _art);
        }
        else
        {
        	array_push(living_art, _art);
        }
    }
}