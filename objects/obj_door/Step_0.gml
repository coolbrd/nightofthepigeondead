event_inherited();

// if a transition hasn't been created yet, and the door has been hit
if (!transition && pressed) {
	// create a transition
	transition = instance_create_layer(0, 0, "UI", obj_transition);
	// play the proper sound
	audio_play_sound(snd_door_open, 2, false);
}

// if there's already a transition, and it's completely opaque
if (transition && transition.image_alpha >= 1) {
	// change rooms
	room_goto(destination);
}