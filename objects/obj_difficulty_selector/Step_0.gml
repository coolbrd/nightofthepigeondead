event_inherited();

// if the tv is hit
if (pressed) {
	// increment the difficulty and loop if necessary
	difficulty_index = (difficulty_index + 1) % 4;
	current_difficulty = difficulties[difficulty_index];
	
	// play the tv sound
	audio_play_sound(snd_tv_hit, 2, false);
}

// keep the tv's display at the current difficulty
image_index = difficulty_index;