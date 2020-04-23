if (place_meeting(x, y, obj_swing)) {
	transition = instance_create_layer(0, 0, "UI", obj_transition);
}

if (transition && transition.image_alpha >= 1) {
	room_goto(destination);
}