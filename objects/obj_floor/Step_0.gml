if (global.pause_frames > 0) exit;

// the list of colliding poop
var _poop_list = ds_list_create();
// check for poop collisions
instance_place_list(x, y - 1, obj_poop, _poop_list, false);

// count how many collisions there were
poop_count = ds_list_size(_poop_list);
// clean up the list
ds_list_destroy(_poop_list);