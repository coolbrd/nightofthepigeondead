// draw the white background of the annoyance bar
draw_sprite_ext(spr_ui_bar, 0, x, y, 100, 1, 0, bar_background, 1);

// draw the annoyance bar
draw_sprite_ext(spr_ui_bar, 0, x, y, bar_value / bar_max * 100, 1, 0, bar_color, 1);

draw_self();