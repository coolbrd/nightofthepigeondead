event_inherited();

// get a reference to the player
player = instance_find(obj_player, 0);

// whether or not that poop has splattered
splat = false;
// whether or not the poop stays after splattering
destroy_after_splat = false;
// whether or not the poop will revieve the player of annoyance when it is destroyed
relieve_on_death = true;