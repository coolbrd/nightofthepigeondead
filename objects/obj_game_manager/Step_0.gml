// decrement pause frames
global.pause_frames = max(0, global.pause_frames - 1);

// if the screen is meant to shake
if (global.screenshake_frames > 0) {
	// randomize camera offsets
	var _camera_offset_x = floor(random_range(-2, 2));
	var _camera_offset_y = floor(random_range(-2, 2));
	// move the camera slightly
	camera_set_view_pos(view_camera[0], camera_original_x + _camera_offset_x, camera_original_y + _camera_offset_y);
	// decrement screenshake frames
	global.screenshake_frames--;
}
// if the screen is not shaking
else {
	// return the camera to its original position
	camera_set_view_pos(view_camera[0], camera_original_x, camera_original_y);
}

// if the game's music should be paused
if (pause_music) {
	// pause the music
	audio_pause_sound(music);
}
// if the music is not paused
else {
	// resume it
	audio_resume_sound(music)
}