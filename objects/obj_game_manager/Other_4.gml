// if there's music to play
if (room_music) {
	// start the music
	music = audio_play_sound(room_music, 1, true);
}

// the number of frames to pause the game for
global.pause_frames = 0;
// the number of frames to shake the screen for
global.screenshake_frames = 0;

// the original coordinates of the camera
camera_original_x = camera_get_view_x(view_camera[0]);
camera_original_y = camera_get_view_y(view_camera[0]);