// the player's current action
state = player_state.moving;

// the player's head hitbox
head = instance_create_layer(x, y, "Instances", obj_player_head);
// give the head a reference to the player
head.player = id;

// the instance of a swing hitbox currently associated with the player
swing_instance = noone;
// the timer that tracks when the player can swing
current_swing_cooldown = 0;
// the timer that tracks the player's current swing instance and when it should be destroyed
swing_timer = 0;
// the offset values for where the swing occured in relation to the player
swing_x_offset = 0;
swing_y_offset = 0;

// the instance of a cleaning hitbox currently associated with the player
clean_area_instance = noone;
// the timer that tracks when the player can clean
cleaning_timer = 0;

// the player's current level of annoyance
current_annoyance = 0;
// a multiplier that comes from how much more annoyance the player can take
annoyance_multiplier = 0;

// the floor in the current room
floor_instance = instance_find(obj_floor, 0);

// randomize the seed
randomize();