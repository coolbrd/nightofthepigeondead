draw_set_font(fnt_game);
if (room == rm_game) {
	draw_text_ext_transformed(5, 0, "score: " + string(total_score), 10, 100, 3, 3, 0);
}

draw_text_ext_transformed(display_get_gui_width() - 400, display_get_gui_height() - 30, "dashes: " + string(current_dash_count), 10, 100, 2, 2, 0);

// draw the swing cooldown bar
draw_sprite_ext(spr_ui_bar, 0, display_get_gui_width(), display_get_gui_height(), -(100 - current_swing_cooldown / swing_cooldown * 100), 1, 0, c_lime, 1);

// draw the white background of the annoyance bar
draw_sprite_ext(spr_ui_bar, 0, 0, display_get_gui_height(), 200, 2, 0, c_white, 1);
// draw the annoyance bar
draw_sprite_ext(spr_ui_bar, 0, 0, display_get_gui_height(), current_annoyance / max_annoyance * 200, 2, 0, c_red, 1);