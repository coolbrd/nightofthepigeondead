/// @desc increments a value towards another value by a given increment
/// @arg value
/// @arg goal
/// @arg increment

var _value = argument[0];
var _goal = argument[1];
var _increment = argument[2];

return _value + _increment * sign(_goal - _value);