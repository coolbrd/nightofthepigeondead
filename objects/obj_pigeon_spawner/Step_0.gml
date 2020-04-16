if (global.pause_frames > 0) exit;

// check every interval if the current number of pigeons is less than the allowed max
if (++frames >= spawn_interval && instance_number(obj_pigeon) < max_pigeons) {
	event_user(0);
	// reset the frame counter
	frames = 0;
}