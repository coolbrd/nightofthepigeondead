/// @desc increments a value towards another value by a given increment
/// @arg value
/// @arg goal
/// @arg increment

var _value = argument[0];
var _goal = argument[1];
var _increment = argument[2];

var _initial_difference = _goal - _value;
// the incremented value
var _new_value = _value + _increment * sign(_initial_difference);
var _new_difference = _goal - _new_value;

// if the goal was not crossed after incrementing the value
if (sign(_initial_difference) == sign(_new_difference)) {
	// just return the incremented value
	return _new_value;
}
// if the goal was crossed by any amount
else {
	// eliminate going back and forth over the goal by just returning the goal
	return _goal;
}