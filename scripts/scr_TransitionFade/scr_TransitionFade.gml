function TransitionFade(_color=c_black): Transition() constructor
{
    alpha = 0;
    color = _color;
    
    update_out = function(_pos) 
    {
        alpha = lerp(0, 1, _pos);
    }
    
    update_in = function(_pos) 
    {
        alpha = lerp(1, 0, _pos);
    }
    
    draw = function()
    { 
        draw_set_alpha(alpha);
        draw_set_color(color);
        draw_rectangle(0, 0, GUI_W, GUI_H, false);
        draw_set_alpha(1); // reset
    }
}