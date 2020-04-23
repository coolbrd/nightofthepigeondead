shake_frames = max(0, shake_frames - 1);
draw_sprite_ext(sprite_index, image_index, x + random_range(-shake_frames, shake_frames), y, image_xscale, image_yscale, image_angle, c_white, image_alpha);