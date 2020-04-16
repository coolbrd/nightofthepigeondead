// the pigeon's current action
state = pigeon_state.circling;

// the timer that determines when the pigeon will change its direction
turnaround_timer = 0;
// the timer that determines when the pigeon will perform a dive
dive_timer = 0;
// the timer that determines when the pigeon will poop
poop_timer = 0;

// whether or not the pigeon can currently annoy the player
can_annoy = true;

// the player instance in the room
player = instance_find(obj_player, 0);