if (global.pause_frames > 0) exit;

// if the number of pigeons left is positive
if (total_pigeons > 0) {
	// if the spawner is ready to try and spawn a pigeon
	if (++frames >= spawn_interval) {
		// if there aren't enough pigeons
		if (instance_number(obj_pigeon) < max_pigeons) {
			// spawn one
			event_user(0);
			// decrement the total amount of pigeons to spawn
			total_pigeons--;
		}
		// reset the frame counter
		frames = 0;
	}
}
// if there are no more pigeons left to spawn
else {
	// if all pigeons are dead
	if (instance_number(obj_pigeon) == 0) {
		// indicate that the wave has been finished
		wave_finished = true;
	}
}