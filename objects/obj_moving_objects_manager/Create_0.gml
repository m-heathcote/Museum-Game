art_can_move = true;

art_count = instance_number(obj_art_object_parent);
art_array = array_create(art_count);
for (var _i = 0; _i < art_count; ++_i)
{
    art_array[_i] = instance_find(obj_art_object_parent, _i);
}

art_out_of_place = [];