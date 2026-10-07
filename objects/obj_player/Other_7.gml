var _pickup_sprites = [spr_player_pickup_down, spr_player_pickup_up, spr_player_pickup_right, spr_player_pickup_left];
var _setdown_sprites = [spr_player_setdown_down, spr_player_setdown_up, spr_player_setdown_right, spr_player_setdown_left];

if (array_contains(_pickup_sprites, sprite_index))
{
    set_player_sprite(facing, "idle_carry");
    player_anim_active = false;
}
else if (array_contains(_setdown_sprites, sprite_index))
{
    set_player_sprite(facing, "idle");
    player_anim_active = false;
}