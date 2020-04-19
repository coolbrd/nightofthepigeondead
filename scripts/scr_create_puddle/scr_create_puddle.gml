/// @desc creates a puddle at the given coordinates and assigns it a number of active frames
/// @arg x
/// @arg y
/// @arg active_frames

var _x = argument0;
var _y = argument1;
// the amount of frames before the puddle will begin to fade
var _active_frames = argument2;

// create the puddle
var _puddle = instance_create_layer(_x, _y, "Instances", obj_clean_area);
_puddle.active_frames = _active_frames;

// return the puddle's id
return _puddle;