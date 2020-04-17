if (global.pause_frames > 0) exit;

// if the spawner is ready to try and spawn a pigeon
if (++frames >= spawn_interval) {
	// if there aren't enough pigeons
	if (instance_number(obj_pigeon) < max_pigeons) {
		// spawn one
		event_user(0);
	}
	// reset the frame counter
	frames = 0;
}