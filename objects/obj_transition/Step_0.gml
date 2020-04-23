if (!darkened) {
	image_alpha += fade_in_interval;
	if (image_alpha >= 1) {
		darkened = true;
	}
}
else {
	if (hold_frames-- <= 0) {
		image_alpha -= fade_out_interval;
		if (image_alpha <= 0) {
			instance_destroy();
		}
	}
}