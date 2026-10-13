if !surface_exists(surf)
{
    var _cw = camera_get_view_width(view_camera[0]);
    var _ch = camera_get_view_height(view_camera[0]);
    
    // Create surface
    surf = surface_create(_cw + border_size * 2, _ch + border_size * 2);
    
    // Clear surface
    surface_set_target(surf);
    draw_set_colour(c_black);
    draw_set_alpha(0);
    draw_rectangle(0, 0, _cw + border_size, _cw + border_size, false);
    surface_reset_target();
}
else
{
    if (surface_exists(surf))
    {
        var _cw = camera_get_view_width(view_camera[0]);
        var _ch = camera_get_view_height(view_camera[0]);
        var _cx = round(camera_get_view_x(view_camera[0]));
        var _cy = round(camera_get_view_y(view_camera[0]));
        
        surface_set_target(surf);
        
        // ----- Draw "DARKNESS" -----
        
        draw_set_color(c_black);
        draw_set_alpha(0.8);
        draw_rectangle(0, 0, _cw + border_size * 2, _ch + border_size * 2, 0);
        
        // ----- Draw "LIGHT" -----
        
        gpu_set_blendmode(bm_subtract);
        
        with (obj_light_source_parent)
        {
            var _draw_x = round(x - _cx) + obj_lighting_manager.border_size;
            var _draw_y = round(y - _cy) + obj_lighting_manager.border_size;
            
            switch(object_index)
            {
                case obj_player:
                    draw_sprite_ext(obj_lighting_manager.light_spr, 0, _draw_x, _draw_y, 1, 1, 0, c_white, 1);
                    break; 
            }
        }
        
        gpu_set_blendmode(bm_normal);
        
        draw_set_alpha(1);
        surface_reset_target();
        
        // Draw surface to the screen at the camera position 
        draw_surface(surf, _cx - border_size, _cy - border_size);
    }
}