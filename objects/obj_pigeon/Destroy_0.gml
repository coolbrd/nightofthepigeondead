// create a corpse instance
var _corpse = instance_create_layer(x, y, "Instances", obj_dead_pigeon);
// assign the corpse this pigeon's deadly indicator when killed
_corpse.deadly = corpse_deadly;

// if something killed the pigeon
if (killer) {
	// scale speeds depending on direction and player annoyance
	_corpse.xspeed = 5 * -sign(killer.image_xscale) * kill_force;
	_corpse.yspeed = -(3 + 3 * player.annoyance_multiplier) * kill_force;
}

// give the player a point
player.total_score++;
// decrease the player's annoyance a little
scr_annoy_player(annoyance_on_death, false);