event_inherited();

// if this door is hit
if (pressed) {
	// if there's no wave spawner
	if (!wave_spawner) {
		// create the wave spawner
		wave_spawner = instance_create_layer(0, 0, "Managers", obj_wave_spawner);
		// pass the selected difficulty to the spawner
		wave_spawner.wave_difficulty = difficulty_selector.current_difficulty;
	}
}