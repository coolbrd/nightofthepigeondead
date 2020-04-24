// if the player isn't dead
if (instance_exists(player)) {
	// if the player isn't currently dying
	if (!player.dying) {
		// display annoyance
		bar_value = player.current_annoyance;
		bar_max = player.max_annoyance;
		bar_color = c_red;
		bar_background = c_white;
		// scale the current frame with the player's annoyance
		image_index = clamp(bar_value / 25, 0, 3);
	}
	// if the player is dying
	else {
		// display the last chance meter
		bar_value = player.last_chance_meter;
		bar_max = player.last_chance_meter_max;
		bar_color = c_black;
		bar_background = c_green;
		// hold the bar at the final frame
		image_index = 4;
	}
}