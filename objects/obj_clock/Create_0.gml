// ON / OFF

clock_active = true;
show_clock = true;

// TIME TRACKING

hour = 0;
and_30 = false;
am_pm = "pm";

times =             ["10", "11", "12", "1", "2", "3", "4", "5", "6"];
num_allowed_out =   [   1,    2,    3,   4,   5,   5,   4,   2,  0 ];
am_index = 2;

// TIME TIMES

secs_for_30m = 6; // 10
frames_for_30m = secs_for_30m * 60;

secs_before_end_screen = 4;

// Padding

x_text_padding = 22;
y_text_padding = 15;

x_screen_padding = 28;
y_screen_padding = 28;

// DRAWING

font = fnt_clock;

box_spr = spr_clock_box_big;