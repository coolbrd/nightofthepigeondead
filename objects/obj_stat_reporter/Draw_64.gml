exit;

draw_text_ext_transformed(5, 100, "pps: " + string(poop_total / frames * 60), 10, 100, 2, 2, 0);
draw_text_ext_transformed(5, 130, "pigeons: " + string(instance_number(obj_pigeon)), 10, 100, 2, 2, 0);