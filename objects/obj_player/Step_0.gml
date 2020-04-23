if (global.pause_frames > 0) exit;

// move
event_inherited();

if (keyboard_check(ord("R"))) {
	game_restart();
}

#region controls
// movement inputs
var _left = -keyboard_check(vk_left);
var _right = keyboard_check(vk_right);

// action inputs
var _swing = keyboard_check_pressed(ord("X"));
var _clean = keyboard_check_pressed(ord("Z"));
var _dash = keyboard_check_pressed(vk_space);
#endregion

#region timers
// decrement the dash regen timer
dash_regen_timer = max(0, dash_regen_timer - 1);

// decrement the invulnerability timer
current_invul_timer = max(0, current_invul_timer - 1);
#endregion

#region annoyance management
// calculate the annoyance multiplier
annoyance_multiplier = current_annoyance / max_annoyance;

if (!dying) {
	// if there's currently no poop on the floor
	if (floor_instance.poop_count <= 0) {
		// the value to decease the player's annoyance level by
		var _annoyance_decrement = max(base_annoyance_decay, annoyance_multiplier / 3);
		// decrease the player's annoyance
		current_annoyance = max(0, current_annoyance - _annoyance_decrement);
	}
	// if there's poop on the floor
	else {
		// add to the player's annoyance
		current_annoyance += floor_instance.poop_count * per_poop_annoyance;
	}
	
	// if the player's annoyance reaches its max
	if (current_annoyance >= max_annoyance) {
		// indicate that the player is dying
		dying = true;
		// fill the last chance meter
		last_chance_meter = last_chance_meter_max;
		// start the last chance timer
		last_chance_timer = last_chance_timer_max;
	}
}
// if the player is dying
else {
	// decrement the last chance timer
	last_chance_timer = max(0, last_chance_timer - 1);
	
	// keep the player's annoyance at max
	current_annoyance = max_annoyance;
	// make the player invulnerable during this time
	event_user(0);
	
	// if the player has emptied the last chance meter
	if (last_chance_meter <= 0) {
		// indicate that the player is no longer dying
		dying = false;
		// decrease the player's annoyance
		current_annoyance = max_annoyance / 2;
	}
	// if the player runs out of time
	else if (last_chance_timer <= 0) {
		// kill the player
		instance_destroy();
		instance_destroy(head);
	}
}

// never let annoyance fall out of range
current_annoyance = clamp(current_annoyance, 0, max_annoyance);

// scale the animation's speed with the player's annoyance
image_speed = annoyance_multiplier + 1;
#endregion

#region invulnerability
// if the player's invulnerability is over
if (current_invul_timer <= 0) {
	// indicate that invulnerability is over
	invulnerable = false;
	// return the player's sprite to normal
	image_alpha = 1;
}
#endregion

#region main state machine
switch (state) {
	#region move state
	case player_state.moving: {
		#region movement
		// the direction that the player is moving
		var _x_dir = _left + _right;
		
		// the value to scale the player's speed by
		var _speed_multiplier = annoyance_multiplier + 1;
		// calculate and apply the player's speed
		xspeed = walk_speed * _x_dir * _speed_multiplier;
		#endregion
		
		#region animation
		// if the player is moving
		if (xspeed != 0) {
			// play the running animation
			sprite_index = spr_player_running;
		}
		// if the player is stopped
		else {
			// play the idle animation
			sprite_index = spr_player_idle;
		}
		
		// make the player face the direction of movement
		image_xscale = _x_dir == 0 ? image_xscale : -_x_dir;
		#endregion
		
		#region abilities
		#region check for dash
		// if the player is trying to dash
		if (_dash && current_dash_count > 0 && !is_dashing) {
			// start the dash timer
			dash_timer = dash_duration;
			// subtract a dash
			current_dash_count--;
			
			// indicate that the player is dashing
			is_dashing = true;
			
			// play the dash sound
			audio_play_sound(snd_dash, 2, false);
		}
		#endregion
		#region check for swing
		// if the player is trying to swing, and the swing ability is not on cooldown
		else if (_swing && current_swing_cooldown <= 0 && !is_swinging) {
			// indicate that the player is swinging
			is_swinging = true;
			
			// create a swing area
			swing_instance = instance_create_layer(x, y - sprite_height / 2, "Instances", obj_swing);
			// associate the player with the hitbox
			swing_instance.player = id;
			swing_x_offset = swing_instance.x - x;
			swing_y_offset = swing_instance.y - y;
			
			// set the swing's duration timer
			swing_timer = swing_duration;
			
			// calculate the swing cooldown multiplier, which decreases with more annoyance
			var _swing_cooldown_multiplier = 1 - annoyance_multiplier / 2;
			// apply the swing ability cooldown
			current_swing_cooldown = floor(swing_cooldown * _swing_cooldown_multiplier);
			
			// animate the player swinging
			scr_start_animation(spr_player_swinging);
			
			// play the swinging noise
			audio_play_sound(snd_mop_swing, 2, false);
		}
		#endregion
		#region check for clean
		// if the player is trying to clean and is not currently swinging or dashing
		else if (_clean && !is_swinging && !is_dashing) {
			// the multiplier to scale the amount of time that it takes to clean
			var _cleaning_time_multiplier = 1 - (annoyance_multiplier / 2);
			// set the cleaning duration timer
			cleaning_timer = cleaning_duration * _cleaning_time_multiplier;
			
			// create a puddle
			puddle_instance = scr_create_puddle(x, y + sprite_height / 2, cleaning_duration);
			
			// put the player into a state of cleaning, restricting movement
			state = player_state.cleaning;
			
			// play the mopping animation
			scr_start_animation(spr_player_mopping);
			
			audio_play_sound(snd_mopping, 2, false);
		}
		#endregion
		#endregion
		break;
	}
	#endregion
	#region cleaning state
	case player_state.cleaning: {
		// prevent the player from moving
		xspeed = 0;
		// if the cleaning time is up
		if (cleaning_timer-- <= 0) {
			// release the puddle from the player's association
			puddle_instance = noone;
			// allow the player to move again
			state = player_state.moving;
		}
		break;
	}
	#endregion
}
#endregion

#region dashing
// if the player has the max amount of dashes
if (current_dash_count >= dash_max) {
	// reset the regen timer
	dash_regen_timer = dash_regen;
}
// if the player is missing a dash and the timer is up
else if (dash_regen_timer <= 0) {
	// regenerate a dash
	current_dash_count++;
	// reset the timer
	dash_regen_timer = dash_regen;
}

// if the player is dashing
if (is_dashing) {
	// make the player invulnerable for the duration of the dash
	invulnerable = true;
	// increase the player's speed
	xspeed = dash_speed * -sign(image_xscale);
			
	// if the player presses the clean button
	if (_clean) {
		// indicate that the dash should also clean
		dash_and_clean = true;
	}
	// if the dash is also cleaning
	if (dash_and_clean) {
		// play the mopping animation
		sprite_index = spr_player_mopping;
				
		// every two frames of the dash
		if (dash_timer % 2 == 0) {
			// create a puddle that's active for only one frame
			scr_create_puddle(x, y + sprite_height / 2, 1);
		}
	}
			
	// if the dash timer is finished
	if (dash_timer-- <= 0) {
		// indicate that the player is no longer dashing
		is_dashing = false;
		dash_and_clean = false;
		// stop invulnerability
		invulnerable = false;
	}
}
#endregion

#region swinging
// if the player is currently swinging
if (is_swinging) {
	// play the swinging animation
	sprite_index = spr_player_swinging;
	// don't scale this animation with annoyance
	image_speed = 1;
	// lock the swing's position to the player's
	swing_instance.x = x + swing_x_offset;
	swing_instance.y = y + swing_y_offset;
	
	// if the swing's time is up
	if (--swing_timer <= 0) {
		// destroy the swing area
		instance_destroy(swing_instance);
		// remove the reference to the swing instance
		swing_instance = noone;
		// indicate that the player is no longer swinging
		is_swinging = false;
	}
}
else {
	// decrement the swing cooldown timer
	current_swing_cooldown = max(0, current_swing_cooldown - 1);
}
#endregion