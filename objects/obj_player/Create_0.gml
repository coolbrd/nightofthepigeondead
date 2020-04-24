// make the player face right
image_xscale = -1;

// the player's current action
state = player_state.moving;

// the number of pigeons killed
total_score = 0;

// the manager that plays music
game_manager = instance_find(obj_game_manager, 0);

// the player's head hitbox
head = instance_create_layer(x, y, "Instances", obj_player_head);
// give the head a reference to the player
head.player = id;

// the player's current level of annoyance
current_annoyance = 0;
// a multiplier that comes from how much more annoyance the player can take
annoyance_multiplier = 0;

// the instance of a swing hitbox currently associated with the player
swing_instance = noone;
// the timer that tracks when the player can swing
current_swing_cooldown = 0;
// the timer that tracks the player's current swing instance and when it should be destroyed
swing_timer = 0;
// the offset values for where the swing occured in relation to the player
swing_x_offset = 0;
swing_y_offset = 0;
// whether or not the player is swinging
is_swinging = false;

// the instance of a cleaning hitbox currently associated with the player
puddle_instance = noone;
// the timer that tracks when the player can clean
cleaning_timer = 0;

// the number of dashes that the player currently has
current_dash_count = dash_max;
// the timer that tracks when the player will regenerate a dash
dash_regen_timer = dash_regen;
// the duration of the player's current dash
dash_timer = 0;
// whether or not the player is dashing
is_dashing = false;
dash_and_clean = false;

// whether or not the player takes damage from pigeon and poop collisions
invulnerable = false;
// the timer that tracks player invulnerability
current_invul_timer = 0;

// whether or not the player is on their last chance
dying = false;
// the meter that must be filled in order to save the player's life
last_chance_meter = 0;
// the timer that determines whether the player lives or dies
last_chance_timer = 0;

// the floor in the current room
floor_instance = instance_find(obj_floor, 0);

// randomize the seed
randomize();