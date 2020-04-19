if (current_wave == noone) {
	current_wave = instance_create_layer(x, y, "Managers", obj_pigeon_spawner);
	current_wave.total_pigeons = 20 + min(10, wave) * 3;
	if (wave > 10) {
		current_wave.total_pigeons += (wave - 10) * 1;
	}
	current_wave.max_pigeons = 10 + min(10, wave) * 1;
	if (wave > 10) {
		current_wave.max_pigeons += (wave - 10) * 0.5;
	}
	current_wave.max_poop = 10 + min(10, wave) * 0.5;
	if (wave > 10) {
		current_wave.max_poop += (wave - 10) * 0.2;
	}
	current_wave.spawn_interval = max(10, 100 - wave * 5);
	current_wave.pigeon_poop_delay_min = max(50, 100 - wave * 2);
	current_wave.pigeon_poop_delay_range = max(50, 200 - wave * 5);
}
else {
	if (current_wave.wave_finished) {
		instance_destroy(current_wave);
		current_wave = noone;
		wave++;
	}
}