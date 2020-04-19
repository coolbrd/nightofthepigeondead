/// @desc Spawn pigeon

// create a new pigeoon
var _pigeon = instance_create_layer(x, y, "Instances", obj_pigeon);
_pigeon.spawner = id;
// randomize the direction that the pigeon comes from
var _pigeon_direction = choose(-1, 1);
// place the pigeon outside of the room
_pigeon.x = room_width / 2 + (room_width / 2 + _pigeon.sprite_width) * _pigeon_direction;
// randomize the pigeon's flying height
_pigeon.y = floor(random_range(40, 80));
// randomize the pigeon's speed
_pigeon.flying_speed = random_range(1, 4);
_pigeon.flying_direction = _pigeon_direction;
// assign the pigeon's randomized height to be its flying height
_pigeon.flying_level = _pigeon.y;
// assign pigeon values
_pigeon.poop_delay_min = pigeon_poop_delay_min;
_pigeon.poop_delay_range = pigeon_poop_delay_range;
_pigeon.dive_speed = pigeon_dive_speed;
_pigeon.rise_speed = pigeon_rise_speed;
_pigeon.turnaround_delay_min = pigeon_turnaround_delay_min;
_pigeon.turnaround_delay_range = pigeon_turnaround_delay_range;
_pigeon.dive_delay_min = pigeon_dive_delay_min;
_pigeon.dive_delay_range = pigeon_dive_delay_range;