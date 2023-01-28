var _color = gotHit
	? c_red
	: ((z < 0) ? merge_color(c_white, c_aqua, 0.5) : c_white);
draw_surface_ext(application_surface, 0, 0, 1, 1, 0, _color, 1);
gotHit = false;
