/// @desc applies an annoyance amount to the player's current annoyance level
/// @arg amount
/// @arg trigger_invuln

// the amount of annoyance to apply
var _amount = argument[0];
// whether or not to give the player invulnerability
var _trigger_invuln = argument[1];

// find the player instance
var _player = instance_find(obj_player, 0);

// if the player doesn't exist, or is invulnerable and shouldn't accept positive annoyance
if (!_player || (_amount > 0 && _player.invulnerable)) {
	// indicate that the player was not annoyed
	return false;
}

if (!_player.dying) {
	// add to the player's annoyance
	_player.current_annoyance = clamp(_player.current_annoyance + _amount, 0, _player.max_annoyance);
	// if the player should get invulnerability
	if (_trigger_invuln) {
		// trigger the player's damage event
		with (_player) {
			event_user(0);
		}
	}
	// indicate that the player was annoyed
	return true;
}
else {
	_player.last_chance_meter = clamp(_player.last_chance_meter + _amount, 0, _player.last_chance_meter_max);
	return false;
}