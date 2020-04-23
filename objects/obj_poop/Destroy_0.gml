// if this poop provides an annoyance relief on death
if (relieve_on_death) {
	// relieve the player
	scr_annoy_player(annoyance_on_destroy, false);
}

// spawn a cleaned poop effect to fade away
instance_create_layer(x, y, "Instances", obj_cleaned_poop);