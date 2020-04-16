/// @desc fades an instance and destroys it once faded
/// @arg increment

var _increment = argument[0];

// make the instance fade away
image_alpha -= _increment;
// once it has faded
if (image_alpha <= 0) {
	// destroy it
	instance_destroy();
}