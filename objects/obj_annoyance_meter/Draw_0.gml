// draw the white background of the annoyance bar
draw_sprite_ext(spr_ui_bar, 0, x, y, 100, 1, 0, c_white, 1);

// draw the annoyance bar
draw_sprite_ext(spr_ui_bar, 0, x, y, annoyance / max_annoyance * 100, 1, 0, c_red, 1);

draw_self();