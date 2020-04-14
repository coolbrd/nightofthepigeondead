// the pigeon's current action
state = pigeon_state.circling;

// the timer that determines when the pigeon will change its direction
turnaround_timer = random_range(turnaround_min, turnaround_max);

// the timer that determines when the pigeon will poop
poop_timer = 0;