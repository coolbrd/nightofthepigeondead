if (global.pause_frames > 0) exit;

// move
event_inherited();

// if the poop is not splat and has stopped
if (!splat && yspeed == 0) {
	// indicate that the poop has splat
	splat = true;
	
	// play the poop splat noise
	audio_play_sound(snd_poop_splat, 2, false);
}

// if the poop has splat
if (splat) {
	// stop the poop's movement
	yspeed = 0;
	
	// animate the splatter effect
	sprite_index = spr_poop_splatter;
	
	// if the splatter animation is over
	if (image_speed && floor(image_index) == 1) {
		// if the poop should be destroyed once it has splat
		if (destroy_after_splat) {
			// destroy it
			instance_destroy();
		}
		// if the poop stays after splatting
		else {
			// stop the animation from looping
			image_speed = 0;
		}
	}
}