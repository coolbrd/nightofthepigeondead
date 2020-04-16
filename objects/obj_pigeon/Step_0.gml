if (global.pause_frames > 0) exit;

// move
event_inherited();

#region timers
if (turnaround_timer <= 0) {
	turnaround_timer = floor(random_range(turnaround_delay_min, turnaround_delay_min + turnaround_delay_range));
}

if (dive_timer <= 0) {
	dive_timer = floor(random_range(dive_delay_min, dive_delay_min + dive_delay_range));
}

if (poop_timer <= 0) {
	poop_timer = floor(random_range(poop_delay_min, poop_delay_min + poop_delay_range));
}
#endregion

// main state machine
switch (state) {
	// when the pigeon is idly flying above the player
	case pigeon_state.circling: {
		// push the pigeon's horizontal speed in the desired flying direction
		xspeed = scr_increment_towards(xspeed, flying_speed * flying_direction, 0.1);
		
		// determine the desired rise speed of the pigeon based on whether or not it's at its flying height
		var _current_rise_speed = y > flying_level ? -rise_speed : 0;
		// push the vertical speed in the direction of the rise speed
		yspeed = scr_increment_towards(yspeed, _current_rise_speed, 0.1)
		
		// if the pigeon is beyond the middle point of the room
		if (sign(x - room_width / 2) == sign(xspeed)) {
			// decrement the turnaround timer and see if it's done
			if (--turnaround_timer <= 0) {
				// change the pigeon's direction
				flying_direction *= -1;
			}
		}
		// if the pigeon is heading towards the player
		else if (sign(player.x - x) == sign(xspeed)) {
			// decrement the dive timer and see if it's up
			if (--dive_timer <= 0) {
				// make the pigeon dive
				state = pigeon_state.diving;
				// allow the pigeon to annoy the player once during its dive
				can_annoy = true;
			}
		}
		
		// if the pigeon's poop timer is up
		if (--poop_timer <= 0) {
			// if there is not too much poop already on screen
			if (instance_number(obj_poop) < spawner.max_poop) {
				// create poop
				instance_create_layer(x, y, "Instances", obj_poop);
			}
		}
		break;
	}
	// when the pigeon is diving downwards towards the player
	case pigeon_state.diving: {
		// push the vertical speed towards the desired dive speed
		yspeed = scr_increment_towards(yspeed, dive_speed, 0.1);
		// determine the pigeon's direction to fly in based on where the player is
		flying_direction = sign(player.x - x);
		// push the horizontal speed towards a speed going towards the player that's scaled by how close they are
		xspeed = scr_increment_towards(xspeed, flying_direction * 3, 0.1);
		
		// if the pigeon hasn't already annoyed the player during its current state
		if (can_annoy) {
			// check for collision with the players head
			var _player_head = instance_place(x, y, obj_player_head);
			// if the pigeon is touching the player's head
			if (_player_head) {
				// annoy the player
				_player_head.player.current_annoyance += annoyance_per_dive;
				// prevent the pigeon from annoying the player again during the same state
				can_annoy = false;
			}
		}
		
		// if the pigeon reaches the trough of its dive, or it has already annoyed the player
		if (y >= player.y - player.sprite_height / 2 || !can_annoy) {
			// make the pigeon circle again
			state = pigeon_state.circling;
		}
		break;
	}
}

// turn the pigeon's sprite with its direction
image_xscale = -sign(xspeed);