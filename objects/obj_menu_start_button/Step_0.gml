event_inherited();

if (place_meeting(x, y, obj_swing)) {
	var _wave_spawner = instance_create_layer(0, 0, "Managers", obj_wave_spawner);
	_wave_spawner.wave_difficulty = difficulty_selector.current_difficulty;
}