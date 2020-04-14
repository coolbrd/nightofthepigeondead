// check every 50 frames if the current number of pigeons is less than the allowed max
if (++frames >= 50 && instance_number(obj_pigeon) < max_pigeons) {
	// create a new pigeoon
	var _pigeon = instance_create_layer(x, y, "Instances", obj_pigeon);
	// randomize the direction that the pigeon comes from
	var _pigeon_direction = choose(-1, 1);
	// place the pigeon outside of the room
	_pigeon.x = room_width / 2 + (room_width / 2 + _pigeon.sprite_width) * _pigeon_direction;
	_pigeon.y = floor(random_range(40, 80));
	// randomize the pigeon's speed
	_pigeon.xspeed = random_range(1, 4) * -_pigeon_direction;
	
	// reset the frame counter
	frames = 0;
}