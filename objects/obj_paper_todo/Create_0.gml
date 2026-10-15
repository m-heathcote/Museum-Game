// Inherit the parent event
event_inherited();

var _desk = instance_find(obj_front_desk_part1, 0);
alt_depth_y = _desk.bbox_bottom + 2;

interactable = true;
blocks_player = false;

show_list = false;
just_opened = false;
player_has_interacted = false;
in_first_viewing = true;

// ABOUT DISPLAY

spr_box = spr_list_background_scaled;
spr_checkbox = spr_todo_checkbox_scaled;
checkbox_w = sprite_get_width(spr_checkbox);
checkbox_h = sprite_get_height(spr_checkbox);

title_font = fnt_todo_title;
text_font = fnt_todo_text;

box_w = 600;
box_h = 750;

x_padding = 20;
y_padding = 35;
x_margin = 20;
y_margin = 40;

function look_at_note_and_list()
{
    create_dialog(global.DIALOGS.note_p1, true, id, false);
    
    //in_first_viewing = false;
    player_has_interacted = true;
}

function look_at_list()
{
    // Play sound
    audio_play_sound(snd_in_place, 0, false); // TODO: replace sound *************
    
    show_list = true;
    interactable = false;
    
    just_opened = true;
    alarm[1] = 5;
    
    player.frozen = true;
}

//interact_func = in_first_viewing ? look_at_note_and_list : look_at_list;
interact_func = function () 
{
    if (in_first_viewing) { look_at_note_and_list(); }
    else { look_at_list(); }
}