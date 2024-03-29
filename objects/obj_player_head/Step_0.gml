if (global.pause_frames > 0) exit;

// lock the head to the player
x = player.x;
y = player.y;
image_xscale = player.image_xscale;

// the list of colliding poop
var _poop_list = ds_list_create();
// if any collisions are found
if (instance_place_list(x, y, obj_poop, _poop_list, false)) {
	// iterate over every colliding poop
	for (var _i = 0; _i < ds_list_size(_poop_list); _i++) {
		// the currently iterated poop collision
		var _current_poop = _poop_list[| _i];
		
		// if the poop has not yet splat
		if (!_current_poop.splat) {
			// indicate that the poop has splat
			_current_poop.splat = true;
			// indicate that the poop should be destroyed after finishing its animation
			_current_poop.destroy_after_splat = true;
			// indicate that this poop should not give the player any relief after its death
			_current_poop.relieve_on_death = false;
			
			// if the player is successfully annoyed
			if (scr_annoy_player(annoyance_per_poop, true)) {
				// play a nasty sound
				audio_play_sound(snd_pigeon_attack, 2, false);
			}
		}
	}
}
// clean up the list
ds_list_destroy(_poop_list);