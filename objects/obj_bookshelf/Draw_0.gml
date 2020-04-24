// shake the bookshelf with each hit
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle + random_range(-shake_frames, shake_frames) * 2, c_white, image_alpha);