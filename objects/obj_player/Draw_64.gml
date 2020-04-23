draw_set_font(fnt_game);
if (room == rm_game) {
	draw_text_ext_transformed(5, 0, "score: " + string(total_score), 10, 100, 3, 3, 0);
}