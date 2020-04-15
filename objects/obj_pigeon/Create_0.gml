// the pigeon's current action
state = pigeon_state.circling;

// the timer that determines when the pigeon will change its direction
turnaround_timer = random_range(turnaround_min, turnaround_max);

dive_timer = random_range(dive_delay_min, dive_delay_max);

// the timer that determines when the pigeon will poop
poop_timer = 0;

can_annoy = true;

// the player instance in the room
player = instance_find(obj_player, 0);