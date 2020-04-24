// don't do anything if the spawner isn't in the correct room
if (room != rm_game) {
	exit;
}

// if there isn't a wave currently
if (current_wave == noone) {
	// create a new wave
	current_wave = instance_create_layer(x, y, "Managers", obj_pigeon_spawner);
	// difficulty scaling
	switch (wave_difficulty) {
		case difficulty.beginner: {
			current_wave.total_pigeons = 15;
			current_wave.total_pigeons += wave * 3;
			current_wave.total_pigeons = min(50, current_wave.total_pigeons);
			
			current_wave.max_pigeons = 10;
			current_wave.max_pigeons += wave * 1;
			
			current_wave.max_poop = 5;
			current_wave.max_poop += wave * 0.5;
			
			current_wave.spawn_interval = 100;
			current_wave.spawn_interval -= wave * 4;
			current_wave.spawn_interval = max(20, current_wave.spawn_interval);
			
			current_wave.pigeon_poop_delay_min = 100;
			current_wave.pigeon_poop_delay_min -= wave * 3;
			current_wave.pigeon_poop_delay_min = max(30, current_wave.pigeon_poop_delay_min);
			
			current_wave.pigeon_poop_delay_range = 100;
			break;
		}
		case difficulty.normal: {
			current_wave.total_pigeons = 20;
			current_wave.total_pigeons += wave * 4;
			current_wave.total_pigeons = min(60, current_wave.total_pigeons);
			
			current_wave.max_pigeons = 15;
			current_wave.max_pigeons += wave * 1.5;
			
			current_wave.max_poop = 10;
			current_wave.max_poop += wave * 0.5;
			
			current_wave.spawn_interval = 80;
			current_wave.spawn_interval -= wave * 5;
			current_wave.spawn_interval = max(20, current_wave.spawn_interval);
			
			current_wave.pigeon_poop_delay_min = 100;
			current_wave.pigeon_poop_delay_min -= wave * 3;
			current_wave.pigeon_poop_delay_min = max(30, current_wave.pigeon_poop_delay_min);
			
			current_wave.pigeon_poop_delay_range = 100;
			break;
		}
		case difficulty.hard: {
			current_wave.total_pigeons = 30;
			current_wave.total_pigeons += wave * 6;
			current_wave.total_pigeons = min(60, current_wave.total_pigeons);
			
			current_wave.max_pigeons = 20;
			current_wave.max_pigeons += wave * 2;
			
			current_wave.max_poop = 15;
			current_wave.max_poop += wave * 0.75;
			
			current_wave.spawn_interval = 70;
			current_wave.spawn_interval -= wave * 5;
			current_wave.spawn_interval = max(20, current_wave.spawn_interval);
			
			current_wave.pigeon_poop_delay_min = 100;
			current_wave.pigeon_poop_delay_min -= wave * 3;
			current_wave.pigeon_poop_delay_min = max(30, current_wave.pigeon_poop_delay_min);
			
			current_wave.pigeon_poop_delay_range = 100;
			break;
		}
		case difficulty.extreme: {
			current_wave.total_pigeons = 50;
			current_wave.total_pigeons += wave * 7;
			current_wave.total_pigeons = min(80, current_wave.total_pigeons);
			
			current_wave.max_pigeons = 25;
			current_wave.max_pigeons += wave * 3;
			
			current_wave.max_poop = 20;
			current_wave.max_poop += wave * 1;
			
			current_wave.spawn_interval = 50;
			current_wave.spawn_interval -= wave * 5;
			current_wave.spawn_interval = max(10, current_wave.spawn_interval);
			
			current_wave.pigeon_poop_delay_min = 80;
			current_wave.pigeon_poop_delay_min -= wave * 3;
			current_wave.pigeon_poop_delay_min = max(30, current_wave.pigeon_poop_delay_min);
			
			current_wave.pigeon_poop_delay_range = 80;
			break;
		}
	}
}
// if a wave currently exists
else {
	// if the wave is done
	if (current_wave.wave_finished) {
		// destroy it and prepare for the next wave
		instance_destroy(current_wave);
		current_wave = noone;
		// increment the wave
		wave++;
	}
}