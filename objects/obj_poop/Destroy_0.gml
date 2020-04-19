if (relieve_on_death) {
	player.current_annoyance += annoyance_on_destroy;
}

// spawn a cleaned poop effect to fade away
instance_create_layer(x, y, "Instances", obj_cleaned_poop);