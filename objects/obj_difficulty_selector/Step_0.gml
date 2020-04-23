if (pressable && place_meeting(x, y, obj_swing)) {
	difficulty_index = (difficulty_index + 1) % 4;
	current_difficulty = difficulties[difficulty_index];
	shake_frames = 4;
	pressable = false;
	
	audio_play_sound(snd_tv_hit, 2, false);
}
else if (!pressable && !place_meeting(x, y, obj_swing)) {
	pressable = true;
}

image_index = difficulty_index;