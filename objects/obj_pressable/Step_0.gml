// constantly unpress the button
pressed = false;

// decrement shake frames
shake_frames = max(0, shake_frames - 1);

// if the button can be pressed and something is pressing it
if (pressable && place_meeting(x, y, obj_swing)) {
	// indicate that the button is pressed
	pressed = true;
	// set shake frames
	shake_frames = shake_length;
	// don't let the button be pressed again until deactivated
	pressable = false;
}
// if the button has been pressed and nothing is touching it anymore
else if (!pressable && !place_meeting(x, y, obj_swing)) {
	// allow the button to be pressed again
	pressable = true;
}