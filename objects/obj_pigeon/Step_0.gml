// move
event_inherited();

// if the pigeon's poop timer is up
if (poop_timer++ >= poop_interval) {
	// create poop
	instance_create_layer(x, y, "Instances", obj_poop);
	// reset the timer
	poop_timer = 0;
}

// main state machine
switch (state) {
	// when the pigeon is idly flying above the player
	case pigeon_state.circling: {
		// if the pigeon is beyond the middle point of the room
		if (sign(x - room_width / 2) == sign(xspeed)) {
			// decrement the turnaround timer and see if it's done
			if (turnaround_timer-- <= 0) {
				// change the pigeon's direction
				xspeed *= -1;
				// reset the timer
				turnaround_timer = random_range(turnaround_min, turnaround_max);
			}
		}
	}
}

// turn the pigeon's sprite with its direction
image_xscale = -sign(xspeed);