if (global.pause_frames > 0) exit;

// move
event_inherited();

#region controls
// movement inputs
var _left = -keyboard_check(ord("A"));
var _right = keyboard_check(ord("D"));

// action inputs
var _swing = mouse_check_button_pressed(mb_left);
var _clean = mouse_check_button_pressed(mb_right);
var _dash = keyboard_check_pressed(vk_lshift);
#endregion

#region annoyance decay
// calculate the annoyance multiplier
annoyance_multiplier = current_annoyance / max_annoyance;

// if there's currently no poop on the floor
if (floor_instance.poop_count <= 0) {
	// the value to decease the player's annoyance level by
	var _annoyance_decrement = max(0.1, annoyance_multiplier / 3);
	// decrease the player's annoyance
	current_annoyance = max(0, current_annoyance - _annoyance_decrement);
}
// if there's poop on the floor
else {
	// add to the player's annoyance
	current_annoyance += floor_instance.poop_count * per_poop_annoyance;
}
#endregion

// scale the animation's speed with the player's annoyance
image_speed = annoyance_multiplier + 1;

#region main state machine
switch (state) {
	#region move state
	case player_state.moving: {
		// the direction that the player is moving
		var _x_dir = _left + _right;
		
		// the value to scale the player's speed by
		var _speed_multiplier = annoyance_multiplier + 1;
		// calculate and apply the player's speed
		xspeed = walk_speed * _x_dir * _speed_multiplier;
		
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
		
		// if the player is trying to swing, and the swing ability is not on cooldown
		if (_swing && current_swing_cooldown <= 0) {
			// create a swing
			swing_instance = instance_create_layer(x, y - sprite_height / 2, "Instances", obj_swing);
			swing_instance.player = id;
			swing_x_offset = swing_instance.x - x;
			swing_y_offset = swing_instance.y - y;
			
			// set the swing's duration timer
			swing_timer = swing_duration;
			
			// calculate the swing cooldown multiplier, which decreases with more annoyance
			var _swing_cooldown_multiplier = 1 - annoyance_multiplier / 2;
			// apply the swing ability cooldown
			current_swing_cooldown = swing_cooldown * _swing_cooldown_multiplier;
			
			// animate the player swinging
			scr_start_animation(spr_player_swinging);
		}
		// if the player is trying to clean and is not currently swinging 
		else if (_clean && swing_timer <= 0) {
			// create a cleaning area
			puddle_instance = instance_create_layer(x, y + sprite_height / 2, "Instances", obj_clean_area);
			puddle_instance.player = id;
			
			// the multiplier to scale the amount of time that it takes to clean
			var _cleaning_time_multiplier = 1 - (annoyance_multiplier / 2);
			// set the cleaning duration timer
			cleaning_timer = cleaning_duration * _cleaning_time_multiplier;
			
			// put the player into a state of cleaning, restricting movement
			state = player_state.cleaning;
			
			// play the mopping animation
			scr_start_animation(spr_player_mopping);
		}
		// if the player is trying to dash
		else if (_dash) {
			// start the dash timer
			dash_timer = dash_duration;
		}
		
		// if the dash timer is running and not up
		if (dash_timer-- > 0) {
			// increase the player's speed
			xspeed = dash_speed * _x_dir;
		}
		break;
	}
	#endregion
	#region cleaning state
	case player_state.cleaning: {
		// prevent the player from moving
		xspeed = 0;
		// if the cleaning time is up
		if (cleaning_timer-- <= 0) {
			puddle_instance.active = false;
			// allow the player to move again
			state = player_state.moving;
		}
		break;
	}
	#endregion
}
#endregion

// if the player is currently swinging
if (swing_instance) {
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
	}
}
// if the player is not swinging
else {
	// decrement the swing cooldown
	current_swing_cooldown = max(0, current_swing_cooldown - 1);
}

// if the player's annoyance reaches its max
if (current_annoyance >= max_annoyance) {
	game_restart();
}

if (keyboard_check(ord("R"))) {
	game_restart();
}