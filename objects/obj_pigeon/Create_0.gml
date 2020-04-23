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
// the floor of the room
floor_instance = instance_find(obj_floor, 0);

// the instance that killed this pigeon
killer = noone;
// the force with which this pigeon's corpse will be thrown
kill_force = 1;
// whether or not this pigeon's corpse will be able to kill other pigeons
corpse_deadly = false;