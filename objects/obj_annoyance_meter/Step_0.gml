if (instance_exists(player)) {
	annoyance = player.current_annoyance;
	max_annoyance = player.max_annoyance;
}

image_index = clamp(annoyance / 25, 0, 3);

if (annoyance >= max_annoyance) {
	image_index = 4;
}