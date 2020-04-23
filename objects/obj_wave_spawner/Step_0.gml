if (room != rm_game) {
	exit;
}

if (current_wave == noone) {
	current_wave = instance_create_layer(x, y, "Managers", obj_pigeon_spawner);
	switch (wave_difficulty) {
		case difficulty.beginner: {
			current_wave.total_pigeons = 10;
			current_wave.total_pigeons += wave * 3;
			current_wave.total_pigeons = min(50, current_wave.total_pigeons);
			
			current_wave.max_pigeons = 10;
			current_wave.max_pigeons += wave * 1;
			
			current_wave.max_poop = 5;
			current_wave.max_poop += wave * 0.5;
			
			current_wave.spawn_interval = 150;
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
			
			current_wave.spawn_interval = 120;
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
			
			current_wave.spawn_interval = 100;
			current_wave.spawn_interval -= wave * 5;
			current_wave.spawn_interval = max(20, current_wave.spawn_interval);
			
			current_wave.pigeon_poop_delay_min = 100;
			current_wave.pigeon_poop_delay_min -= wave * 3;
			current_wave.pigeon_poop_delay_min = max(30, current_wave.pigeon_poop_delay_min);
			
			current_wave.pigeon_poop_delay_range = 100;
			break;
		}
		case difficulty.extreme: {
			current_wave.total_pigeons = 40;
			current_wave.total_pigeons += wave * 7;
			current_wave.total_pigeons = min(70, current_wave.total_pigeons);
			
			current_wave.max_pigeons = 25;
			current_wave.max_pigeons += wave * 3;
			
			current_wave.max_poop = 20;
			current_wave.max_poop += wave * 1;
			
			current_wave.spawn_interval = 70;
			current_wave.spawn_interval -= wave * 5;
			current_wave.spawn_interval = max(10, current_wave.spawn_interval);
			
			current_wave.pigeon_poop_delay_min = 80;
			current_wave.pigeon_poop_delay_min -= wave * 3;
			current_wave.pigeon_poop_delay_min = max(30, current_wave.pigeon_poop_delay_min);
			
			current_wave.pigeon_poop_delay_range = 100;
			break;
		}
	}
}
else {
	if (current_wave.wave_finished) {
		instance_destroy(current_wave);
		current_wave = noone;
		wave++;
	}
}