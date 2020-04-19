// move
event_inherited();

// the direction that the corpse should be facing
var _facing_direction = sign(xspeed);

// face the corpse in the direction of its speed
image_xscale = _facing_direction == 0 ? random_facing_direction : _facing_direction;
// apply gravity
yspeed += 0.07;

// if the corpse has deadly force
if (deadly) {
	// check for pigeon collisions
	var _pigeon = instance_place(x, y, obj_pigeon);
	// if a pigeon is colliding with the corpse
	if (_pigeon) {
		// indicate that the pigeon was killed by this corpse
		_pigeon.killer = id;
		// give the pigeon's corpse less velocity
		_pigeon.kill_force = 0.1;
		// kill the pigeon
		instance_destroy(_pigeon);
		
		// slow the corpse
		xspeed /= 2;
		yspeed /= 2;
		
		// play a sound every time a corpse kills a pigeon
		audio_play_sound(snd_pigeon_corpse_hit, 2, false);
	}
	
	// check for poop collisions
	var _poop = instance_place(x, y, obj_poop);
	// if the corpse is colliding with poop
	if (_poop) {
		// if the poop is not on the ground
		if (!_poop.splat) {
			// destroy the poop
			instance_destroy(_poop);
		}
	}
}

if (y > room_height + sprite_height) {
	instance_destroy();
}