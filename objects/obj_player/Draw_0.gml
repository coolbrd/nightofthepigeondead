// the thresholded value that determines how much the player is shaking
var _shake_threshold = annoyance_multiplier >= 0.5 ? (annoyance_multiplier - 0.5) / 2 : 0;
// draw the player accordingly
draw_sprite_ext(sprite_index, image_index, x + _shake_threshold * choose(-1, 1), y + _shake_threshold * choose(-1, 1), image_xscale, image_yscale, image_angle, c_white, image_alpha);