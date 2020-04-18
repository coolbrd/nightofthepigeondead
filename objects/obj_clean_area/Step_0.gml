if (global.pause_frames > 0) exit;

// if the puddle is in use
if (active) {
	// the list of poop to clean
	var _poop_list = ds_list_create();

	// if the cleaning area collides with any poop
	if (instance_place_list(x, y, obj_poop, _poop_list, false)) {
		// iterate over every collision
		for (var _i = 0; _i <  ds_list_size(_poop_list); _i++) {
			// destroy the poop
			instance_destroy(_poop_list[| _i]);
			// give the player a point
			player.total_score++;
		}
	}
	// clean up the list
	ds_list_destroy(_poop_list);
}
// if the puddle is no longer in use
else {
	// make it fade and disappear
	scr_fade_away(fade_rate);
}