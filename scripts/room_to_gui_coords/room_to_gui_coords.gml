function room_to_gui_x_coord(_x)
{
    return (_x - VIEW_X) * (GUI_W / VIEW_W);
}

function room_to_gui_y_coord(_y)
{
    return (_y - VIEW_Y) * (GUI_H / VIEW_H);
}