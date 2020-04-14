// the list of things that this swing has collided with
var _collisions_list = ds_list_create();
// check for collisions with pigeons and poop
instance_place_list(x, y, obj_pigeon, _collisions_list, false);
instance_place_list(x, y, obj_poop, _collisions_list, false);

// if any collisions were found
if (ds_list_size(_collisions_list)) {
	// iterate over every collision
	for (var _i = 0; _i < ds_list_size(_collisions_list); _i++) {
		// destroy it
		instance_destroy(_collisions_list[| _i]);
	}
}
// clean up the list
ds_list_destroy(_collisions_list);